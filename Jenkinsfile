pipeline {
    agent none
    environment {          
        app = 'fpsak-akseptansetest'
        branch = 'master'
        commitHash = ''
        commitHashShort = '' 
        committer = '' 
        committerEmail = '' 
        commitUrl= ''
        dockerRepo = 'repo.adeo.no:5443'
        groupId = 'nais'
        namespace = 'default'
        project = 'navikt'
        releaseVersion= ''
        zone = 'sbs'
    }
    stages {
        stage("Checkout") {
            environment {
                HTTPS_PROXY = 'http://webproxy-utvikler.nav.no:8088'
            }
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
                sh 'echo "release version: ${releaseVersion}"'
            }
        }
        stage('Fetch dependencies') {
            agent {
                docker 'circleci/node:9.3-stretch-browsers'
            }
            environment {
                HTTPS_PROXY = 'http://webproxy-utvikler.nav.no:8088'
                NO_PROXY = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
                no_proxy = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
                NODE_TLS_REJECT_UNAUTHORIZED = '0'
            }
            steps {
                sh 'yarn install'
                stash includes: 'node_modules/', name: 'node_modules'
            }
        }

        stage("Build & publish") {
            agent {
                docker 'circleci/node:9.3-stretch-browsers'
            }
            environment {
                HTTPS_PROXY = 'http://webproxy-utvikler.nav.no:8088'
                NO_PROXY = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
                no_proxy = 'localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
                NODE_TLS_REJECT_UNAUTHORIZED = '0'
            }
            steps {
                unstash 'node_modules'
                // Tar opp applikasjonen og venter på at alt er klart.
                sh "yarn up" 
                sh "docker build --build-arg version=${releaseVersion} --build-arg app_name=${app} -t ${dockerRepo}/${app}:${releaseVersion} ."
            /*
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'nexusUser', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                    sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD} ${dockerRepo} && docker push ${dockerRepo}/${app}:${releaseVersion}"
                }
                
                slackSend([
                    color: 'good',
                    message: "Build <${env.BUILD_URL}|#${env.BUILD_NUMBER}> (<${commitUrl}|${commitHashShort}>) of ${project}/${app}@master by ${committer} passed"
                ])
                */
            }
        }
    }
}
