sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
apk update && \
apk upgrade && \
apk add --update openjdk${JAVA_VERSION} wget curl tar bash && \
wget https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
wget https://jmeter-plugins.org/files/packages/jpgc-casutg-2.9.zip && \
wget https://jmeter-plugins.org/files/packages/jpgc-tst-2.5.zip && \
wget https://github.com/metersphere/jmeter-functions/releases/download/v1.0.1/metersphere-jmeter-functions-v1.0.1.jar && \
wget https://github.com/metersphere/jmeter-plugins-for-apache-dubbo/releases/download/${DUBBO_JMETER_PLUGIN_VERSION}/jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar && \
wget https://github.com/liuruibin/generate-report/releases/download/v0.0.1/generate-report-0.0.1.jar && \
wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar && \
wget "http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar" -O mysql-connector-java.jar && \
wget "http://search.maven.org/remotecontent?filepath=com/oracle/database/jdbc/ojdbc8/19.7.0.0/ojdbc8-19.7.0.0.jar" -O ojdbc8.jar && \
wget "http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/42.2.14/postgresql-42.2.14.jar" -O postgresql.jar && \
wget "http://search.maven.org/remotecontent?filepath=com/microsoft/sqlserver/mssql-jdbc/7.4.1.jre8/mssql-jdbc-7.4.1.jre8.jar" -O mssql-jdbc.jar && \
wget "http://search.maven.org/remotecontent?filepath=io/metersphere/jmeter-plugins-threadgroup-autostop/0.1/jmeter-plugins-threadgroup-autostop-0.1.jar" -O jmeter-plugins-threadgroup-autostop.jar && \
wget "http://search.maven.org/remotecontent?filepath=org/apache/kafka/kafka-clients/2.7.1/kafka-clients-2.7.1.jar" -O kafka-clients-2.7.1.jar && \
mkdir -p ${JMETER_HOME} && \
tar -zxf apache-jmeter-${JMETER_VERSION}.tgz -C ${JMETER_HOME}/  --strip-components=1 && \
unzip -o jpgc-casutg-2.9.zip -d /tmp/ && mv /tmp/lib/ext/jmeter-plugins-casutg-2.9.jar ${JMETER_HOME}/lib/ext && \
unzip -o jpgc-tst-2.5.zip -d /tmp/ && mv /tmp/lib/ext/jmeter-plugins-tst-2.5.jar ${JMETER_HOME}/lib/ext && \
mv metersphere-jmeter-functions-v1.0.1.jar ${JMETER_HOME}/lib/ext && \
mv jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar ${JMETER_HOME}/lib/ext && \
mv mysql-connector-java.jar ${JMETER_HOME}/lib/ext && \
mv ojdbc8.jar ${JMETER_HOME}/lib/ext && \
mv postgresql.jar ${JMETER_HOME}/lib/ext && \
mv mssql-jdbc.jar ${JMETER_HOME}/lib/ext && \
mv jmeter-plugins-threadgroup-autostop.jar ${JMETER_HOME}/lib/ext && \
mv kafka-clients-2.7.1.jar ${JMETER_HOME}/lib/ext && \
mv jython-standalone-2.7.2.jar ${JMETER_HOME}/lib/ext && \
mv generate-report-0.0.1.jar /jmeter-log/generate-report.jar && \
rm -rf apache-jmeter-${JMETER_VERSION}.tgz && \
rm -rf jpgc-casutg-2.9.zip && \
rm -rf jpgc-tst-2.5.zip && \
rm -rf jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar && \
rm -rf /var/cache/apk/* && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone