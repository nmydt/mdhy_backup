# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$PATH:~/bin
#JAVA_HOME
export JAVA_HOME=/opt/module/jdk1.8.0_144
export PATH=$PATH:$JAVA_HOME/bin

#HADOOP_HOME
export HADOOP_HOME=/opt/module/hadoop-2.7.2
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
#SPARK_HOME
export SPARK_HOME=/opt/module/spark-2.2.0
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/:$PYTHONPATH
export PATH=$SPARK_HOME/bin:$SPARK_HOME/python:$PATH
#ZOOKEEPER_HOME
export ZOOKEEPER_HOME=/opt/module/zookeeper-3.4.10
export PATH=$PATH:$ZOOKEEPER_HOME/bin
#KAFKA_HOME
export KAFKA_HOME=/opt/module/kafka_2.11
export PATH=$PATH:$KAFKA_HOME/bin
#HIVE_HOME
export HIVE_HOME=/opt/module/hive-2.3.6
export PATH=$PATH:$HIVE_HOME/bin
#PHOENIX_HOME
export PHOENIX_HOME=/opt/module/phoenix-hbase-1.3-4.16.1
export PATH=$PATH:$PHOENIX_HOME/bin
#远程ssh登录可使用alias
shopt -s expand_aliases
#增强jps显示
alias Jps="jps |grep -v Jps |awk '{print \$2\" \"\$1}'|sort|awk '{printf \"%2d %8s %s\n\",NR,\$2, \$1}'
"


