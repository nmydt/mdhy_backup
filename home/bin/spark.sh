#! /bin/bash

case $1 in
"start") {
	/opt/module/spark-2.2.0/sbin/start-master.sh
	/opt/module/spark-2.2.0/sbin/start-slaves.sh
} ;;
"stop") {
	/opt/module/spark-2.2.0/sbin/stop-master.sh
	/opt/module/spark-2.2.0/sbin/stop-slaves.sh
} ;;
"restart") {
	spark.sh stop
	spark.sh start
} ;;
esac
