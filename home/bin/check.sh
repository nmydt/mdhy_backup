#! /bin/bash
process102=$(ssh lylg102 "jps | grep -v Jps | awk '{print \$2}'")
process103=$(ssh lylg103 "jps | grep -v Jps | awk '{print \$2}'")
process104=$(ssh lylg104 "jps | grep -v Jps | awk '{print \$2}'")

#grep: -w, --word-regexp         force PATTERN to match only whole words
#      -o, --only-matching       show only the part of a line matching PATTERN

NameNode=$(echo -e $process102 $process103 $process104 | grep -ow NameNode | wc -l)
DataNode=$(echo -e $process102 $process103 $process104 | grep -ow DataNode | wc -l)
NodeManager=$(echo -e $process102 $process103 $process104 | grep -ow NodeManager | wc -l)
Kafka=$(echo -e $process102 $process103 $process104 | grep -ow Kafka | wc -l)
HistoryServer=$(echo -e $process102 $process103 $process104 | grep -ow HistoryServer | wc -l)
JobHistoryServer=$(echo -e $process102 $process103 $process104 | grep -ow JobHistoryServer | wc -l)
QuorumPeerMain=$(echo -e $process102 $process103 $process104 | grep -ow QuorumPeerMain | wc -l)
ResourceManager=$(echo -e $process102 $process103 $process104 | grep -ow ResourceManager | wc -l)
SecondaryNameNode=$(echo -e $process102 $process103 $process104 | grep -ow SecondaryNameNode | wc -l)
#Spark
Worker=$(echo -e $process102 $process103 $process104 | grep -ow Worker | wc -l)
Master=$(echo -e $process102 $process103 $process104 | grep -ow Master | wc -l)

# HBase HRegionServer HMaster
HRegionServer=$(echo -e $process102 $process103 $process104 | grep -ow HRegionServer | wc -l)
HMaster=$(echo -e $process102 $process103 $process104 | grep -ow HMaster | wc -l)

# gt ge lt le eq ne  and or
index=1

if [ $NameNode -ne 1 ]; then
	echo -e "$index NameNode进程丢失\n\t请检查HDFS!!"
	let index++
fi

if [ $DataNode -ne 3 ]; then
	echo -e "$index DataNode进程丢失\n\t请检查HDFS!!"
	let index++
fi

if [ $SecondaryNameNode -ne 1 ]; then
	echo -e "$index SecondaryNameNode进程丢失\n\t请检查HDFS!!"
	let index++
fi
if [ $JobHistoryServer -ne 1 ]; then
	echo -e "$index MapReduce JobHistoryServer进程丢失\n\t请执行 /opt/module/hadoop-2.7.2/sbin/mr-jobhistory-daemon.sh start historyserver 命令开启JobHistoryServer"
	let index++
fi
if [ $NodeManager -ne 3 ]; then
	echo -e "$index NodeManager进程丢失\n\t请检查Yarn!!"
	let index++
fi
if [ $ResourceManager -ne 1 ]; then
	echo -e "$index ResourceManager进程丢失\n\t请检查Yarn!!"
	let index++
fi
if [ $QuorumPeerMain -ne 3 ]; then
	echo -e "$index Zookeeper QuorumPeerMain进程丢失\n\t请执行 zk.sh start 命令启动Zookeeper"
	let index++
fi
if [ $HRegionServer -ne 3 ] || [ $HMaster -ne 1 ]; then
	echo -e "$index Hbase 进程丢失\n\t请执行 /opt/module/hbase-1.3.1/bin/start-hbase.sh 命令启动HBase"
	let index++
fi
if [ $Kafka -ne 3 ]; then
	echo -e "$index Kafka进程丢失\n\t请执行 kf.sh start 命令启动Kafka"
	let index++
fi
# if [ $HistoryServer -ne 1 ]; then
# 	echo -e "$index Spark HistoryServer进程丢失\n\t请执行 /opt/module/spark-3.0.0/sbin/start-history-server.sh 命令开启HistoryServer"
# 	let index++
# fi
if [ $Master -ne 1 ]; then
	echo -e "$index Spark Master\n\t请执行 /opt/module/spark-2.2.0/sbin/start-master.sh 命令"
	let index++
fi
if [ $Worker -ne 3 ]; then
	echo -e "$index Spark Worker进程丢失\n\t请执行 /opt/module/spark-2.2.0/sbin/start-slaves.sh 命令"
	let index++
fi
if [ $index -eq 1 ]; then
	echo -e "------------Hadoop集群已正常启动！！------------"
fi
