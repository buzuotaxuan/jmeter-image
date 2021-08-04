wget --no-check-certificate "${METERSPHERE_URL}/jmeter/download?testId=${TEST_ID}&resourceId=${RESOURCE_ID}&ratio=${RATIO}&reportId=${REPORT_ID}&resourceIndex=${RESOURCE_INDEX}" -O ${TEST_ID}.zip
unzip -o ${TEST_ID}.zip -d ${TESTS_DIR}

# check file
if [ -f "${TESTS_DIR}/ms.properties" ]; then
  cat ${TESTS_DIR}/ms.properties >> /opt/jmeter/bin/jmeter.properties
fi

# dns
if [ -f "${TESTS_DIR}/hosts" ]; then
  cat ${TESTS_DIR}/hosts >>/etc/hosts
fi

while [[ $(curl -s -G -d "ratio=${RATIO}" -d "resourceIndex=${RESOURCE_INDEX}" -d "reportId=${REPORT_ID}" ${METERSPHERE_URL}/jmeter/ready) -gt 0 ]]; do
  echo "time syncing..."
  sleep 0.5
done

# run test
nohup jmeter -n -t ${TESTS_DIR}/${TEST_ID}.jmx -l ${REPORT_ID}.jtl > jmeter.out 2>&1 &
pid=$!

if [ -z ${BACKEND_LISTENER} ] || [ ${BACKEND_LISTENER} = 'false' ]; then
 java -jar generate-report.jar --reportId=${REPORT_ID} --granularity=${GRANULARITY}
fi

echo "waiting jmeter done..."
wait $pid
echo 'jmeter exited.'