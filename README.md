fcd2pbf - Convert SUMO generated trajectories to PBF
====================================================

Dependency
-----------

This project depends on GeoGraphicLib and protobuf.
It also uses v11 features in C++ compiler.

GeoGraphicLib
 http://geographiclib.sourceforge.net/

Protobuf
 http://code.google.com/p/protobuf/

Compile
-----------

In the project root, compile the project using CMake
 
 mkdir build
 cd build
 cmake ..
 make

Usage
-----------

fcd2pbf -i fcd_file -o output_basename [-n noise_std] [-u utm_zone] 
    
options: 
 -n <float> noise_std   standard deviation of Guassian noise in meters. default is 0
 -u <int>   utm_zone    time zone of the fcd input file. default is 50 (Beijing)

Output will be written to <output_basename>.pbf and <output_basename>.bbox
 

Example: 
 src/exec/fcd2pbf -n 5 -i ../data/gridTrace.fcd.xml -o ../data/output
 
Note
-----------

You may need to change the permission of the output pbf file 
for it to be read by other programs.
