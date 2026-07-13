#include <cstdio>
#include <linux/in.h>
#include <sys/endian.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <unistd.h>
#include <cstring>
#include <iostream>
#include "chat.hpp"

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

int accept_client(int server_fd)
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

void echo_loop(int server_fd)
{
  char buffer[1024];

  bool running=true;
  while(running)
  {
    memset(buffer,0,sizeof(buffer));
    int bytes_read=recv(server_fd,buffer,sizeof(buffer),0);
    
    if(bytes_read<=0)
    {
      if(bytes_read==0)
      {
        std::cout<<"client disconnected"<<std::endl;
      }
      else
      {
        perror("recv failed");
      }
      break;
    }
    std::cout<<"recv failed"<<std::endl;
    send(server_fd,buffer,bytes_read,0);
  }
  close(server_fd);
}


int main()
{
  bool running=true;
  int server_fd=check_socket();

  int bind=bind_socket(server_fd,8080);
  if(bind==-1)
  {
    return 1;
  }
  std::cout<<"Successful bind"<<std::endl;

  int listen=listen_socket(server_fd);
  if(listen==-1)
  {
    return 1;
  }
  std::cout<<"Successful listen"<<std::endl;

  while(running)
  {
    int client_fd=accept_client(server_fd);
    if(client_fd==-1)continue;

    add_client(client_fd);
    std::thread t(handle_client, client_fd);
    t.detach();
  }
}
