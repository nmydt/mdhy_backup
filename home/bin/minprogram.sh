#! /bin/bash

case $1 in
"start") {
	ssh -T lylg103 <<finished
cd /opt/module/mdhy
nohup java -jar mdhy-server-0.0.1-SNAPSHOT.jar >/dev/null & 
jps -l | grep mdhy-server-0.0.1-SNAPSHOT.jar | awk '{print \$1}'
exit
finished
} ;;
"stop") {
	ssh -T lylg103 <<finished
	jps -l |grep mdhy-server-0.0.1-SNAPSHOT.jar
	jps -l |grep mdhy-server-0.0.1-SNAPSHOT.jar | awk '{print \$1}'|xargs kill -9
exit
finished

} ;;
"restart") {
	minprogram.sh stop
	sleep 5s
	minprogram.sh start
} ;;
esac
