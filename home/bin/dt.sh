#!/bin/bash

for i in lylg102 lylg103 lylg104; do
	echo "========== $i =========="
	ssh -t $i "sudo date -s $1"
done
