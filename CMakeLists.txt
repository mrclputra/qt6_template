cmake_minimum_required(VERSION 3.21)
project(qt6_template)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui OpenGL)
find_package(spdlog)

add_executable(qt6_template
  src/main.cpp
)

target_link_libraries(qt6_template PRIVATE
  Qt6::Core
  Qt6::Gui
  Qt6::OpenGL
)
