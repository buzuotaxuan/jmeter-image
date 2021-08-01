ARG IMAGE_PREFIX=metersphere

FROM alpine:3.14
LABEL maintainer="support@fit2cloud.com"

# 环境变量
ENV JMETER_VERSION "5.4.1"
ENV DUBBO_JMETER_PLUGIN_VERSION "2.7.7"
ENV JMETER_HOME /opt/jmeter
ENV TESTS_DIR /test
ENV JAVA_VERSION "8"
ENV PATH $PATH:$JMETER_HOME/bin:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/bin

#定义时区参数
ENV TZ=Asia/Shanghai

# 执行构建脚本
ADD build-jmeter.sh /build-jmeter.sh
RUN chmod +x /build-jmeter.sh && mkdir /jmeter-log
RUN ./build-jmeter.sh

#
ADD log4j2.xml $JMETER_HOME/bin/log4j2.xml
ADD jmeter.properties $JMETER_HOME/bin/jmeter.properties


EXPOSE 60000

ADD run-test.sh /run-test.sh
RUN chmod +x /run-test.sh \
    && mkdir /test

WORKDIR /jmeter-log/
ENTRYPOINT /run-test.sh