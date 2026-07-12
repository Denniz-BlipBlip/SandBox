#pragma once
#include <mutex>
#include <vector>
#include <thread>
#include <algorithm>

std::vector<int>clients;
std::mutex clients_mutex;

void add_client(int fd)
{
  std::lock_guard<std::mutex>guard(clients_mutex);
  clients.push_back(fd);
}

void remove_client(int fd)
{
  std::lock_guard<std::mutex>guard(clients_mutex);
}

void handle_client()
{

}

void broadcast_msg()
{

}
