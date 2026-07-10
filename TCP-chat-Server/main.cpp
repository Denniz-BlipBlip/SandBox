#include <cstdio>
#include <iostream>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <cstring>

int check_socket()
{
  int server_fd=socket(AF_INET, SOCK_STREAM,0);
  if(server_fd==-1)
  {
    perror("socket failed");
    return 1;
  }
}

int main()
{
  return 0;
}
