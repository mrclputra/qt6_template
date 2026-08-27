cmake_minimum_required(VERSION 3.21)
project(qt-test)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 COMPONENTS Core)
find_package(spdlog)

add_executable(qt-test
  src/main.cpp
)

target_link_libraries(qt-test PRIVATE 
  Qt6::Core
  spdlog::spdlog
)
