cmake_minimum_required(VERSION 2.6) 
project(fcd2pbf)

# set the default flag for the compiler.
# used to control the error messages printed to the error file.
SET(CMAKE_CXX_FLAGS "-g -O0 -Wall -DSUN -std=c++11")
SET(CMAKE_CXX_FLAGS_DEBUG "-D DEBUG")

# Includes external libraries
#find_package (GeographicLib REQUIRED)
#include_directories (${GeographicLib_INCLUDE_DIRS})
#add_definitions (${GeographicLib_DEFINITIONS})

find_package(GeoGraphicLib REQUIRED)
include_directories(${GEOGRAPHICLIB_INCLUDE_DIR})
add_definitions(-DGEOGRAPHICLIB_SHARED_LIB=0)

find_package(Protobuf REQUIRED)
include_directories(${PROTOBUF_INCLUDE_DIRS})
 
# set executable 
SET (EXECUTABLE2 fcd2pbf)
SET (EXECUTABLE2_SRC fcd2pbf.cpp)
add_executable(${EXECUTABLE2} ${EXECUTABLE2_SRC})
target_link_libraries(${EXECUTABLE2} core xmlparser ${PROTOBUF_LIBRARIES} ${GEOGRAPHICLIB_LIBRARIES})

 
