node {
    def commitHash, commitHashShort, commitUrl
    def project = "navikt"
    def app = "fpsak-akseptansetest"
    def committer, committerEmail, releaseVersion

    def dockerRepo = "repo.adeo.no:5443"
    def branch = "master"
    def groupId = "nais"
    def zone = 'sbs'
    def namespace = 'default'

    stage("Checkout") {
        cleanWs()
        withEnv(['HTTPS_PROXY=http://webproxy-utvikler.nav.no:8088']) {
            sh(script: "git clone https://github.com/${project}/${app}.git -b ${branch} .")
        }
        commitHash = sh(script: 'git rev-parse HEAD', returnStdout: true).trim()
        commitHashShort = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
        commitUrl = "https://github.com/${project}/${app}/commit/${commitHash}"
        committer = sh(script: 'git log -1 --pretty=format:"%an"', returnStdout: true).trim()
        committerEmail = sh(script: 'git log -1 --pretty=format:"%ae"', returnStdout: true).trim()

        releaseVersion = "${env.major_version}.${env.BUILD_NUMBER}-${commitHashShort}"
        echo "release version: ${releaseVersion}"
    }

    stage("Build & publish") {
        withEnv(['HTTPS_PROXY=http://webproxy-internett.nav.no:8088',
                 'NO_PROXY=localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no',
                 'no_proxy=localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no',
                 'NODE_TLS_REJECT_UNAUTHORIZED=0'
        ]) {
            System.setProperty("java.net.useSystemProxies", "true")
            System.setProperty("http.nonProxyHosts", "*.adeo.no")
            sh "yarn install"
        }

        sh "docker build --build-arg version=${releaseVersion} --build-arg app_name=${app} -t ${dockerRepo}/${app}:${releaseVersion} ."

        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'nexusUser', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
            //sh "docker login -u ${env.USERNAME} -p ${env.PASSWORD} ${dockerRepo} && docker push ${dockerRepo}/${app}:${releaseVersion}"
        }
        /*
        slackSend([
            color: 'good',
            message: "Build <${env.BUILD_URL}|#${env.BUILD_NUMBER}> (<${commitUrl}|${commitHashShort}>) of ${project}/${app}@master by ${committer} passed"
        ])
        */
    }

    stage("Deploy to preprod") {
        parallel 'T10': {
            stage("T10") {

            }
        }, 'Q1': {
            stage("Q1") {

            }
        }
    }

    stage("Deploy to prod") {
        /*
        withEnv(['HTTPS_PROXY=http://webproxy-utvikler.nav.no:8088',
               'NO_PROXY=localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no',
               'no_proxy=localhost,127.0.0.1,.local,.adeo.no,.nav.no,.aetat.no,.devillo.no,.oera.no'
              ]) {
            System.setProperty("java.net.useSystemProxies", "true")
            System.setProperty("http.nonProxyHosts", "*.adeo.no")
            try {
                timeout(time: 5, unit: 'MINUTES') {
                    input id: 'prod', message: "Deploy to prod?"
                }
            } catch (Exception ex) {
                echo "Timeout, will not deploy to prod"
                currentBuild.result = 'SUCCESS'
                return
            }

            callback = "${env.BUILD_URL}input/Deploy/"
            def deploy = deployLib.deployNaisApp(app, releaseVersion, 'p', zone, namespace, callback, committer, false).key
            try {
                timeout(time: 15, unit: 'MINUTES') {
                    input id: 'deploy', message: "Check status here:  https://jira.adeo.no/browse/${deploy}"
                }

                slackSend([
                    color: 'good',
                    message: "${app} version ${releaseVersion} has been deployed to production."
                ])
            } catch (Exception e) {
                slackSend([
                   color: 'danger',
                   message: "Unable to deploy ${app} version ${releaseVersion} to production. See https://jira.adeo.no/browse/${deploy} for details"
               ])
                throw new Exception("Deploy feilet :( \n Se https://jira.adeo.no/browse/" + deploy + " for detaljer", e)
            }
        }
        */
    }

}