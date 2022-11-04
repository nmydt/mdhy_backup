#! /bin/bash

case $1 in
"start") {
	nohup \
		/opt/module/spark-2.2.0/bin/spark-submit \
		--class com.lylg.spark.KafKa_Spark_Receiver \
		--master spark://lylg102:7077 \
		--files "/home/lylg/jars/spark/log4j_SparkReceiver.properties" \
		--jars $(echo /opt/module/hbase-1.3.1/lib/*.jar | tr ' ' ',') \
		--conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=file:/home/lylg/jars/spark/log4j_SparkReceiver.properties" \
		--conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=file:/home/lylg/jars/spark/log4j_SparkReceiver.properties" \
		--packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.0 \
		/home/lylg/jars/spark/sparktrain-1.0.jar lylg102:2181,lylg103:2181,lylg104:2181 group first 1 >/dev/null &
	jps -m | grep SparkSubmit | awk -F ' ' '{print$1}'
	nohup listen.sh ~/top "xsync /home/lylg/top" >/dev/null &
} ;;
"stop") {
	jps -m | grep SparkSubmit | awk -F ' ' '{print$1}' | xargs kill -9
	#停止同步~/top目录
	ps -aux | grep inotifywait | grep -v grep | awk '{print $2}' | xargs kill -9

} ;;
"restart") {
	sparkjar.sh stop
	sleep 5s
	sparkjar.sh start
} ;;
esac
