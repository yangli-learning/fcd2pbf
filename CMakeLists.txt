# needed for cmake build system
cmake_minimum_required (VERSION 2.6)

# the name of the project
project (fcd2pbf)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake)
message("cmake module path ${CMAKE_MODULE_PATH}")

# Make sure testing is enabled
ENABLE_TESTING()

# where the external code is kept 
set (SOURCE_DIR src)
set (CORE_DIR  ${SOURCE_DIR}/core)
set (EXE_DIR ${SOURCE_DIR}/exec) 
set (XML_DIR ${SOURCE_DIR}/xmlparser)
 
# c++ flags 
set (CMAKE_CXX_FLAGS "-Wall -g -std=gnu++0x") 


# subdirectory for other source code
add_subdirectory( ${SOURCE_DIR} )
 
   
