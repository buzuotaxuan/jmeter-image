pipeline {
    agent {
        node {
            label 'metersphere'
        }
    }
    options { quietPeriod(600) }
    environment { 
        IMAGE_NAME = 'jmeter-master'
        IMAGE_PREFIX = 'registry.cn-qingdao.aliyuncs.com/metersphere'
    }
    stages {
        stage('Download resources') {
            steps {
                sh "./jmeter-master/build-jmeter.sh"
            }
        }
        stage('Docker build & push') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:\${TAG_NAME:-\$BRANCH_NAME} ./jmeter-master/"
                sh "docker tag ${IMAGE_NAME}:\${TAG_NAME:-\$BRANCH_NAME} ${IMAGE_PREFIX}/${IMAGE_NAME}:\${TAG_NAME:-\$BRANCH_NAME}"
                sh "docker push ${IMAGE_PREFIX}/${IMAGE_NAME}:\${TAG_NAME:-\$BRANCH_NAME}"
            }
        }
    }
    post('Notification') {
        always {
            sh "echo \$WEBHOOK\n"
            withCredentials([string(credentialsId: 'wechat-bot-webhook', variable: 'WEBHOOK')]) {
                qyWechatNotification failSend: true, mentionedId: '', mentionedMobile: '', webhookUrl: "$WEBHOOK"
            }
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true)
        }
    }
}
