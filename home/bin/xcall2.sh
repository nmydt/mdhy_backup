#! /bin/bash

for i in lylg102 lylg103 lylg104; do
	echo --------- $i ----------

	ssh -T $i $1 <<finished
rm -rf 
kill -9
cd ~
touch lalala
exit
finished
	echo "done!"
done
