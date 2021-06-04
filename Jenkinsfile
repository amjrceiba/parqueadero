pipeline {
  agent {
    label 'Slave_Mac'
  }

  stages {
    stage('Build') {
      steps {
        sh 'xcodebuild -workspace parqueadero.xcworkspace -scheme "parqueadero" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 11,OS=14.5" clean build'
      }
    }

    stage('Test') {
      steps {
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'build/reports/junit.xml'])
      }
    }

    stage('Static Code Analysis') {
      steps {
        echo '------------>Análisis de código estático<------------'
        withSonarQubeEnv('Sonar') {
          sh "${tool name: 'SonarScanner', type:'hudson.plugins.sonar.SonarRunnerInstallation'}/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
        }
      }
    }

    stage ('Notify') {
      post {
        failure {
          echo 'This will run only if failed'
          mail (to: 'andres.jaramillo@ceiba.com.co', subject: "Failed Pipeline:${currentBuild.fullDisplayName}", body: "Something is wrong with ${env.BUILD_URL}")
        }

        success {
          echo 'This will run only if successful'
          junit 'build/test-results/test/*.xml' //RUTA DE TUS ARCHIVOS .XML
        }
      }
    }
  }
}
