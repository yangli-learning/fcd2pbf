cmake_minimum_required(VERSION 2.6) 
 
file(GLOB core_SOURCE *.cpp)
add_library( core ${core_SOURCE})

