
export JAVA_HOME=/home/liguodong/install/jdk
export SCALA_HOME=/home/liguodong/install/scala
export PATH=$JAVA_HOME/bin:$SCALA_HOME/bin:$PATH

export HADOOP_HOME=/home/liguodong/install/hadoop
export HIVE_HOME=/home/liguodong/install/hive
export hive_dependency=$HIVE_HOME/conf:$HIVE_HOME/lib/*:$HIVE_HOME/hcatalog/share/hcatalog/hive-hcatalog-core-2.1.0.jar
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin:$PATH


export ZOOKEEPER_HOME=/home/liguodong/install/zookeeper
export HBASE_HOME=/home/liguodong/install/hbase
export KYLIN_HOME=/home/liguodong/install/kylin
export PATH=$ZOOKEEPER_HOME/bin:$HBASE_HOME/bin:$KYLIN_HOME/bin:$PATH


# User specific aliases and functions
cdls() {  
    cd "${1}";  
    ls;  
}  
alias cs='cdls' 

