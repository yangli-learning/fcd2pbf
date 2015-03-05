# usage
filename=$(basename "$1") 
subsample=15
noise=3
filename="${filename%.*}-ss${subsample}-n${noise}"
echo "output written with basename ${filename} "
echo "subsample level = ${subsample}, noise = ${noise} "
 
build/src/exec/fcd2pbf -i $1 -o $filename -s $subsample -n $noise
chmod 644 ${filename}.pbf
