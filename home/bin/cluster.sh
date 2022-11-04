#! /bin/bash

case $1 in
"start") {
	format ~/bin
	echo " -------- 启动 集群 -------"

	echo " -------- 启动 hadoop集群 -------"
	/opt/module/hadoop-2.7.2/sbin/start-dfs.sh
	ssh lylg103 "/opt/module/hadoop-2.7.2/sbin/start-yarn.sh"
	sleep 6s

	echo " -------- 启动 MapReduce JobHistoryServer -------"
	/opt/module/hadoop-2.7.2/sbin/mr-jobhistory-daemon.sh start historyserver

	echo "--------- 启动 Zookeeper集群----------"
	zk.sh start
	#Zookeeper的启动需要一定时间，此时间根据用户计算机的性能而定，可适当调整
	sleep 4s

	echo "--------- 启动HBase集群 ------------"
	/opt/module/hbase-1.3.1/bin/start-hbase.sh
	sleep 3s

	#启动 Flume采集集群
	# f1.sh start

	echo "--------- 启动Kafka集群 ------------"
	#Kafka的启动需要一定时间，此时间根据用户计算机的性能而定，可适当调整
	kf.sh start
	sleep 6s

	# echo " -------- 启动 spark 集群 -------"
	/opt/module/spark-2.2.0/sbin/start-master.sh
	/opt/module/spark-2.2.0/sbin/start-slaves.sh

	# echo " -------- 启动 spark HistoryServer -------"
	# /opt/module/spark-2.2.0/sbin/start-history-server.sh
	#启动 Flume消费集群
	#f2.sh start

	echo "------------开始检测集群状态------------"
	sleep 5s
	check.sh
	sleep 10s
	check.sh
} ;;
"stop") {
	echo " -------- 停止 集群 -------"

	# echo " -------- 停止 spark HistoryServer -------"
	# /opt/module/spark-2.2.0/sbin/stop-history-server.sh

	# echo " -------- 停止 spark 集群 -------"
	/opt/module/spark-2.2.0/sbin/stop-master.sh
	/opt/module/spark-2.2.0/sbin/stop-slaves.sh

	#停止 Flume消费集群
	#f2.sh stop

	echo "--------- 停止Kafka集群 ------------"
	kf.sh stop

	sleep 20s

	echo "--------- 停止HBase集群 ------------"
	/opt/module/hbase-1.3.1/bin/hbase-daemon.sh stop master
	/opt/module/hbase-1.3.1/bin/stop-hbase.sh
	sleep 3s

	#停止 Flume采集集群
	#f1.sh stop

	echo "--------- 停止 Zookeeper集群----------"
	zk.sh stop

	echo " -------- 停止 hadoop集群 -------"
	ssh lylg103 "/opt/module/hadoop-2.7.2/sbin/stop-yarn.sh"
	/opt/module/hadoop-2.7.2/sbin/stop-dfs.sh

	echo " -------- 停止 MapReduce JobHistoryServer -------"
	/opt/module/hadoop-2.7.2/sbin/mr-jobhistory-daemon.sh stop historyserver
	sleep 5s

	echo " -------- 当前Java进程为 -------"
	xcall.sh jps

} ;;
"restart") {
	cluster.sh stop
	sleep 7s
	cluster.sh start
} ;;
esac
