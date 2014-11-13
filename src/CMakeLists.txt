cmake_minimum_required(VERSION 2.6) 

add_subdirectory(core)
add_subdirectory(exec) 
add_subdirectory(xmlparser) 

include_directories(${CORE_DIR})
include_directories(${EXE_DIR}) 
include_directories(${XML_DIR})
 
