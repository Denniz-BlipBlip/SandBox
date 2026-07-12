#include <cstdio>
#include <linux/in.h>
#include <sys/endian.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <unistd.h>
#include <cstring>
#include <iostream>

int check_socket()
{
  int server_fd=socket(AF_INET, SOCK_STREAM,0);
  if(server_fd==-1)
  {
    perror("socket failed");
    return -1;
  }
  return server_fd;
}

int bind_socket(int server_fd,int port)
{
  sockaddr_in address;
  memset(&address,0,sizeof(address));
  address.sin_addr.s_addr=INADDR_ANY;
  address.sin_family=AF_INET;
  address.sin_port=htons(port);

  if(bind(server_fd,(struct sockaddr*)&address,sizeof(address))==-1)
  {
    perror("bind failed");
    return -1;
  }
  return 0;
}

int listen_socket(int server_fd)
{
  if(listen(server_fd,5)==-1)
  {
    perror("listen failed");
    return -1;
  }
  return 0;
}

int accept_socket(int server_fd)
{
  sockaddr_in client_address;
  socklen_t  client_len=sizeof(client_address);

  int client_fd=accept(server_fd,(struct sockaddr*)&client_address,&client_len);

  if(client_fd==-1)
  {
    perror("accept failed");
    return -1;
  }
  std::cout<<"client connected fd = "<<client_fd<<std::endl;
  return client_fd;
}



int main()
{
  int server_fd=check_socket();

  int b=bind_socket(server_fd,8080);
  if(b==-1)
  {
    return 1;
  }
  std::cout<<"successful bind"<<std::endl;

  int a=listen_socket(server_fd);
  if(a==-1)
  {
    return 1;
  }
  std::cout<<"successful listen"<<std::endl;

  int c=accept_socket(server_fd);
  if(c==-1)
  {
    return 1;
  }
  std::cout<<"successful accept fd="<<c<<std::endl;
}
