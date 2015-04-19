# usage
filename=$(basename "$1") 
filename="${filename%.*}"
echo "output written with basename ${filename}"
 
build/src/exec/fcd2pbf -i $1 -o $filename
chmod 644 ${filename}.pbf
