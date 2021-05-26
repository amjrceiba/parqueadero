pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Mac'
  }

  stages {
    stage('Checkout') {
        checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    doGenerateSubmoduleConfigurations: false,
                    extensions: [],
                    gitTool: 'Default',
                    submoduleCfg: [],
                    userRemoteConfigs: [[
                        credentialsId: 'GitHub_amjrceiba',
                        url: 'https://github.com/amjrceiba/parqueadero'
                    ]]
                ])

        stage('Build') {
            // Build and Test
            sh 'xcodebuild -scheme "parqueadero" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.5" -enableCodeCoverage YES | /usr/local/bin/xcpretty -r junit'
        }

        stage('Test') {
            // Publish test restults.
            step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
        }
    }
  }
}
