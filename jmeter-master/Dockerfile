ARG IMAGE_PREFIX=metersphere

FROM alpine:3.13
LABEL maintainer="support@fit2cloud.com"

# 环境变量
ENV JMETER_VERSION "5.4.1"
ENV KAFKA_BACKEND_LISTENER_VERSION "1.0.4"
ENV DUBBO_JMETER_PLUGIN_VERSION "2.7.7"
ENV JMETER_HOME /opt/jmeter
ENV TESTS_DIR /test
ENV JAVA_VERSION "8"
ENV PATH $PATH:$JMETER_HOME/bin:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/bin

#定义时区参数
ENV TZ=Asia/Shanghai
#
ADD log4j2.xml $JMETER_HOME/bin/log4j2.xml
ADD jmeter.properties $JMETER_HOME/bin/jmeter.properties
ADD run-test.sh /run-test.sh
RUN chmod +x /run-test.sh && mkdir /test

# 执行构建脚本
ADD .cache/jmeter /opt/jmeter
RUN mkdir /jmeter-log

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
apk add --update openjdk${JAVA_VERSION} wget curl tar bash && \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo "$TZ" > /etc/timezone && \
rm -rf /var/cache/apk/*

#
ADD .cache/generate-report-0.3.1.jar /jmeter-log/generate-report.jar

EXPOSE 60000
WORKDIR /jmeter-log/
ENTRYPOINT /run-test.sh