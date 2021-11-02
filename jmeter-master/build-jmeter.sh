mkdir -p ${JMETER_HOME} && \
tar -zxf apache-jmeter-${JMETER_VERSION}.tgz -C ${JMETER_HOME}/  --strip-components=1 && \
unzip -o jpgc-casutg-2.9.zip -d /tmp/ && mv /tmp/lib/ext/jmeter-plugins-casutg-2.9.jar ${JMETER_HOME}/lib/ext && \
unzip -o jpgc-tst-2.5.zip -d /tmp/ && mv /tmp/lib/ext/jmeter-plugins-tst-2.5.jar ${JMETER_HOME}/lib/ext && \
mv metersphere-jmeter-functions-v1.0.1.jar ${JMETER_HOME}/lib/ext && \
mv jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar ${JMETER_HOME}/lib/ext && \
mv jmeter.backendlistener.kafka-${KAFKA_BACKEND_LISTENER_VERSION}.jar ${JMETER_HOME}/lib/ext && \
mv mysql-connector-java-5.1.49.jar ${JMETER_HOME}/lib/ext && \
mv ojdbc8-19.7.0.0.jar ${JMETER_HOME}/lib/ext && \
mv postgresql-42.2.14.jar ${JMETER_HOME}/lib/ext && \
mv mssql-jdbc-7.4.1.jre8.jar ${JMETER_HOME}/lib/ext && \
mv jmeter-plugins-threadgroup-autostop-0.1.jar ${JMETER_HOME}/lib/ext && \
mv jython-standalone-2.7.2.jar ${JMETER_HOME}/lib/ext && \
mv generate-report-0.3.1.jar /jmeter-log/generate-report.jar && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone && \
rm -rf /opt/cache/ && \
rm -rf /var/cache/apk/*