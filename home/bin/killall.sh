#! /bin/bash

for i in lylg102 lylg103 lylg104; do

	echo --------- $i ----------
	ssh $i "echo \"正在关闭Java进程：\"; jps |grep -v Jps| awk '{if(\$1>0){print \"kill -9 \"\$1}}'|sh; echo \"关闭成功，$i所有Java进程为：\";jps;sleep 0.5"

done
