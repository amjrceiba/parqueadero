pipeline {
  //Donde se va a ejecutar el Pipeline
  agent {
    label 'Slave_Mac'
  }

  stages {
    stage('Checkout') {
      steps {
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
      }
    }

    stage('Build') {
      // Build and Test
      steps {
        sh 'xcodebuild -scheme "parqueadero" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.5"'
      }
    }

    stage('Test') {
      // Publish test restults.
      steps {
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
      }
    }

    stage('Static Code Analysis') {
      steps {
        echo '------------>Análisis de código estático<------------'
        withSonarQubeEnv('Sonar') {
          sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner"
        }
      }
    }
  }
}
