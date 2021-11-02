JMETER_VERSION="5.4.1" &&
  KAFKA_BACKEND_LISTENER_VERSION="1.0.4" &&
  DUBBO_JMETER_PLUGIN_VERSION="2.7.7" &&
  SCRIPT_DIR=$(
    cd $(dirname "${BASH_SOURCE[0]}")
    pwd
  ) &&
  JMETER_HOME="${SCRIPT_DIR}/.cache/jmeter" &&
  mkdir -p "${SCRIPT_DIR}/.cache" &&
  cd "${SCRIPT_DIR}/.cache" &&
  wget -N --no-check-certificate https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz &&
  wget -N --no-check-certificate https://jmeter-plugins.org/files/packages/jpgc-casutg-2.10.zip &&
  wget -N --no-check-certificate https://jmeter-plugins.org/files/packages/jpgc-tst-2.5.zip &&
  wget -N --no-check-certificate https://hub.fastgit.org/metersphere/jmeter-backend-listener-kafka/releases/download/v${KAFKA_BACKEND_LISTENER_VERSION}/jmeter.backendlistener.kafka-${KAFKA_BACKEND_LISTENER_VERSION}.jar &&
  wget -N --no-check-certificate https://hub.fastgit.org/metersphere/jmeter-functions/releases/download/v1.0.1/metersphere-jmeter-functions-v1.0.1.jar &&
  wget -N --no-check-certificate https://hub.fastgit.org/metersphere/jmeter-plugins-for-apache-dubbo/releases/download/${DUBBO_JMETER_PLUGIN_VERSION}/jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar &&
  wget -N --no-check-certificate https://hub.fastgit.org/metersphere/generate-report-release/releases/download/v0.3.1/generate-report-0.3.1.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc8/19.7.0.0/ojdbc8-19.7.0.0.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.14/postgresql-42.2.14.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/7.4.1.jre8/mssql-jdbc-7.4.1.jre8.jar &&
  wget -N --no-check-certificate https://repo1.maven.org/maven2/io/metersphere/jmeter-plugins-threadgroup-autostop/0.1/jmeter-plugins-threadgroup-autostop-0.1.jar &&
  mkdir -p ${JMETER_HOME} &&
  tar -zxf apache-jmeter-${JMETER_VERSION}.tgz -C ${JMETER_HOME}/ --strip-components=1 &&
  unzip -o jpgc-casutg-2.10.zip -d ./ && cp ./lib/ext/jmeter-plugins-casutg-2.10.jar ${JMETER_HOME}/lib/ext &&
  unzip -o jpgc-tst-2.5.zip -d ./ && cp ./lib/ext/jmeter-plugins-tst-2.5.jar ${JMETER_HOME}/lib/ext &&
  cp metersphere-jmeter-functions-v1.0.1.jar ${JMETER_HOME}/lib/ext &&
  cp jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar ${JMETER_HOME}/lib/ext &&
  cp jmeter.backendlistener.kafka-${KAFKA_BACKEND_LISTENER_VERSION}.jar ${JMETER_HOME}/lib/ext &&
  cp mysql-connector-java-5.1.49.jar ${JMETER_HOME}/lib/ext &&
  cp ojdbc8-19.7.0.0.jar ${JMETER_HOME}/lib/ext &&
  cp postgresql-42.2.14.jar ${JMETER_HOME}/lib/ext &&
  cp mssql-jdbc-7.4.1.jre8.jar ${JMETER_HOME}/lib/ext &&
  cp jmeter-plugins-threadgroup-autostop-0.1.jar ${JMETER_HOME}/lib/ext &&
  cp jython-standalone-2.7.2.jar ${JMETER_HOME}/lib/ext
