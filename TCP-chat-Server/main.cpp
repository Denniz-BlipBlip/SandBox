#include <cstdio>
#include <linux/in.h>
#include <sys/endian.h>
#include <sys/socket.h>
#include <netinet/in.h>
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
    perror("listen failed")
    return -1;
  }
  return 0;
}


int main()
{
  int n=check_socket();

  if(n==-1)
  {
    return 1;
  }

  std::cout<<"successfully created socket "<<n<<std::endl;

  int check=bind_socket(n,8080);

  if(check==-1)
  {
    return 1;
  }

  std::cout<<"sumakses"<<std::endl;
}
