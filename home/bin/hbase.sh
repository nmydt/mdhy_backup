#! /bin/bash
/opt/module/spark-2.2.0/bin/spark-submit --class com.lylg.utils.HBaseUtils --master spark://lylg102:7077 --jars $(echo /opt/module/hbase-1.3.1/lib/*.jar | tr ' ' ',') --packages org.apache.spark:spark-streaming-kafka-0-8_2.11:2.2.0 /home/lylg/jars/spark/sparktrain-1.0.jar
