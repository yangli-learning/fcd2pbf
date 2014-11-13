cmake_minimum_required(VERSION 2.6) 

file(GLOB math_SOURCE *.cpp)
add_library( math ${math_SOURCE})
