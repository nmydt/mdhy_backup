#! /bin/bash

case $1 in
"start") {
	echo " --------启动 ZooKeeper-------"
	xcall.sh "/opt/module/zookeeper-3.4.10/bin/zkServer.sh start"

} ;;
"stop") {
	echo " --------关闭 ZooKeeper-------"
	xcall.sh "/opt/module/zookeeper-3.4.10/bin/zkServer.sh stop"
} ;;
"status") {
	echo " --------ZooKeeper 当前状态-------"
	xcall.sh "/opt/module/zookeeper-3.4.10/bin/zkServer.sh status"

} ;;
esac
