pipeline {
    agent none
    environment {          
        app = 'fpsak-akseptansetest'
        branch = 'master'
        commitHash = ''
        commitHashShort = '' 
        committer = '' 
        committerEmail = '' 
        commitUrl = ''
        dockerRepo = 'repo.adeo.no:5443'
        groupId = 'nais'
        namespace = 'default'
        project = 'navikt'
        releaseVersion = ''
        zone = 'sbs'
        HTTPS_PROXY = 'http://webproxy-internett.nav.no:8088'
        NO_PROXY = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
        no_proxy = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
        NODE_TLS_REJECT_UNAUTHORIZED = '0'
    }
    stages {
        stage("Checkout assets") {
            agent any
            environment {}
            steps {
                cleanWs()
                sh 'git clone https://github.com/${project}/${app}.git -b ${branch} . '
                script {
                     commitHash = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
                     commitHashShort = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
                     commitUrl = "https://github.com/${project}/${app}/commit/${commitHash}"
                     committer = sh(script: 'git log -1 --pretty=format:"%an"', returnStdout: true).trim()
                     committerEmail = sh(script: 'git log -1 --pretty=format:"%ae"', returnStdout: true).trim()
                     releaseVersion = "${env.major_version}.${env.BUILD_NUMBER}-${commitHashShort}"
                }
                sh 'echo "release version: \$releaseVersion"'
            }
        }

        stage('Wire up test services') {
            agent any
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: false])
            }
        }

        stage('Fetch dependencies and wait for services') {
            agent {
                docker 'circleci/node:9.3-stretch-browsers'
            }
            environment {}
            steps {
                sh 'echo https-proxy \\"$HTTPS_PROXY\\" >> .yarnrc'
                sh 'echo strict-ssl false >> .yarnrc'
                sh 'yarn install'
                sh './node_modules/.bin/wait-on http://localhost:8080/fpsak/internal/health/isReady' 
                stash includes: 'node_modules/', name: 'node_modules'
            }
        }

        stage("test stuff") {
            agent any
            environment {
            }
            steps {
                unstash 'node_modules'
                sh "echo at this point i would have dispatched tests"
            }
        }
    }
}
