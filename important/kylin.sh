
# 改成绝对路径
export KYLIN_HOME=/home/liguodong/install/kylin

#在路径中添加$hive_dependency 
export HBASE_CLASSPATH_PREFIX=${tomcat_root}/bin/bootstrap.jar:${tomcat_root}/bin/tomcat-juli.jar:${tomcat_root}/lib/*:$hive_dependency:$HBASE_CLASSPATH_PREFIX



