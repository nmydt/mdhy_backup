#! /bin/bash

case $1 in
"start") {
	echo " --------启动 Kafka-------"
	xcall.sh "kafka-server-start.sh -daemon /opt/module/kafka_2.11/config/server.properties"
} ;;
"stop") {
	echo " --------关闭 Kafka-------"
	xcall.sh "kafka-server-stop.sh"
} ;;
esac
