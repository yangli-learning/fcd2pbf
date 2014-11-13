cmake_minimum_required(VERSION 2.6)

file(GLOB xml_SOURCE *.cpp)

# make the library
add_library(xmlparser ${xml_SOURCE})



