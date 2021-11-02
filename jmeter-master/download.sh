JMETER_VERSION="5.4.1" &&
  KAFKA_BACKEND_LISTENER_VERSION="1.0.4" &&
  DUBBO_JMETER_PLUGIN_VERSION="2.7.7" &&
  JMETER_HOME=/opt/jmeter &&
  TESTS_DIR=/test &&
  SCRIPT_DIR=$(
    cd $(dirname "${BASH_SOURCE[0]}")
    pwd
  ) &&
  mkdir -p "${SCRIPT_DIR}/.cache" &&
  cd "${SCRIPT_DIR}/.cache" &&
  wget --no-check-certificate -nc https://mirrors.tuna.tsinghua.edu.cn/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz &&
  wget --no-check-certificate -nc https://jmeter-plugins.org/files/packages/jpgc-casutg-2.9.zip &&
  wget --no-check-certificate -nc https://jmeter-plugins.org/files/packages/jpgc-tst-2.5.zip &&
  wget --no-check-certificate -nc https://hub.fastgit.org/metersphere/jmeter-backend-listener-kafka/releases/download/v${KAFKA_BACKEND_LISTENER_VERSION}/jmeter.backendlistener.kafka-${KAFKA_BACKEND_LISTENER_VERSION}.jar &&
  wget --no-check-certificate -nc https://hub.fastgit.org/metersphere/jmeter-functions/releases/download/v1.0.1/metersphere-jmeter-functions-v1.0.1.jar &&
  wget --no-check-certificate -nc https://hub.fastgit.org/metersphere/jmeter-plugins-for-apache-dubbo/releases/download/${DUBBO_JMETER_PLUGIN_VERSION}/jmeter-plugins-dubbo-${DUBBO_JMETER_PLUGIN_VERSION}-jar-with-dependencies.jar &&
  wget --no-check-certificate -nc https://hub.fastgit.org/metersphere/generate-report-release/releases/download/v0.3.1/generate-report-0.3.1.jar &&
  wget --no-check-certificate -nc https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar &&
  wget -nc http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar -O mysql-connector-java.jar &&
  wget -nc http://search.maven.org/remotecontent?filepath=com/oracle/database/jdbc/ojdbc8/19.7.0.0/ojdbc8-19.7.0.0.jar -O ojdbc8.jar &&
  wget -nc http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/42.2.14/postgresql-42.2.14.jar -O postgresql.jar &&
  wget -nc http://search.maven.org/remotecontent?filepath=com/microsoft/sqlserver/mssql-jdbc/7.4.1.jre8/mssql-jdbc-7.4.1.jre8.jar -O mssql-jdbc.jar &&
  wget -nc http://search.maven.org/remotecontent?filepath=io/metersphere/jmeter-plugins-threadgroup-autostop/0.1/jmeter-plugins-threadgroup-autostop-0.1.jar -O jmeter-plugins-threadgroup-autostop.jar
