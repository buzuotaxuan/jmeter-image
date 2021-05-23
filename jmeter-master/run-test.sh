wget --no-check-certificate "${METERSPHERE_URL}/jmeter/download?testId=${TEST_ID}&resourceId=${RESOURCE_ID}&ratio=${RATIO}&reportId=${REPORT_ID}&resourceIndex=${RESOURCE_INDEX}" -O ${TEST_ID}.zip
unzip -o ${TEST_ID}.zip -d ${TESTS_DIR}

while [[ $(curl -s ${METERSPHERE_URL}/jmeter/ready?&ratio=${RATIO}&resourceIndex=${RESOURCE_INDEX}&reportId=${REPORT_ID}) -gt  0 ]]
do
  sleep 0.1
done

for file in ${TESTS_DIR}/*.jmx; do
  jmeter -n -t ${file} -Jserver.rmi.ssl.disable=${SSL_DISABLED}
done
