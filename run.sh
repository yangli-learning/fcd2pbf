# usage
filename=$(basename "$1") 
filename="${filename%.*}"
echo "output written with basename ${outfname}"
 
build/src/exec/fcd2pbf -i $1 -o $filename
