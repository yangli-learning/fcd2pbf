# usage
filename=$(basename "$1") 
subsample=15
filename="${filename%.*}-ss${subsample}"
echo "output written with basename ${filename}"
 
build/src/exec/fcd2pbf -i $1 -o $filename -s $subsample
chmod 644 ${filename}.pbf
