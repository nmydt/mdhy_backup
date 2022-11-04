#! /bin/bash
if [ $# -lt 1 ]; then
	echo Not Enough Arguement!
	exit
fi
for i in lylg102 lylg103 lylg104; do
	echo --------- $i ----------
	ssh $i $1
done
