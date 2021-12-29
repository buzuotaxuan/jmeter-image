ARG IMAGE_PREFIX=metersphere

FROM alpine:3.13
LABEL maintainer="support@fit2cloud.com"

# 环境变量
ENV JMETER_VERSION "5.4.3"
ENV KAFKA_BACKEND_LISTENER_VERSION "1.0.4"
ENV DUBBO_JMETER_PLUGIN_VERSION "2.7.7"
ENV JMETER_HOME /opt/jmeter
ENV TESTS_DIR /test
ENV JAVA_VERSION "8"
ENV PATH $PATH:$JMETER_HOME/bin:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/bin
ENV FORMAT_MESSAGES_PATTERN_DISABLE_LOOKUPS "true"

#定义时区参数
ENV TZ=Asia/Shanghai

# 执行构建脚本
ADD .cache/jmeter $JMETER_HOME
ADD .cache/metersphere-jmeter-functions-v1.0.1.jar ${JMETER_HOME}/lib/ext
ADD .cache/jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar ${JMETER_HOME}/lib/ext
ADD .cache/jmeter.backendlistener.kafka-${KAFKA_BACKEND_LISTENER_VERSION}.jar ${JMETER_HOME}/lib/ext
ADD .cache/mysql-connector-java-5.1.49.jar ${JMETER_HOME}/lib/ext
ADD .cache/ojdbc8-19.7.0.0.jar ${JMETER_HOME}/lib/ext
ADD .cache/postgresql-42.2.14.jar ${JMETER_HOME}/lib/ext
ADD .cache/mssql-jdbc-7.4.1.jre8.jar ${JMETER_HOME}/lib/ext
ADD .cache/jmeter-plugins-threadgroup-autostop-1.0.0.jar ${JMETER_HOME}/lib/ext
ADD .cache/jython-standalone-2.7.2.jar ${JMETER_HOME}/lib/ext
ADD .cache/lib/ext/jmeter-plugins-casutg-2.10.jar ${JMETER_HOME}/lib/ext
ADD .cache/lib/ext/jmeter-plugins-tst-2.5.jar ${JMETER_HOME}/lib/ext
#
ADD log4j2.xml $JMETER_HOME/bin/log4j2.xml
ADD jmeter.properties $JMETER_HOME/bin/jmeter.properties
ADD run-test.sh /run-test.sh
RUN chmod +x /run-test.sh && mkdir /test

RUN mkdir /jmeter-log

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
apk add --update openjdk${JAVA_VERSION} wget curl tar bash && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone && \
rm -rf /var/cache/apk/*

#
ADD .cache/generate-report-0.3.5.jar /jmeter-log/generate-report.jar

EXPOSE 60000
WORKDIR /jmeter-log/
ENTRYPOINT /run-test.sh