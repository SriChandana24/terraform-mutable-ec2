pipeline {

  agent {
    node { label 'workstation' }
  }

  environment {
    TOKEN = credentials('GITHUB_TOKEN')
  }

  stages {

    stage('Check Code Style') {
      steps {
        sh 'terraform fmt -check -recursive -diff'
      }
    }

    stage('Create Release') {
      steps {
        script {
          //def statusCode = sh script:"git ls-remote --tags origin | grep \$(cat VERSION | sed -e 's|#||')", returnStatus:true
          def statusCode = sh script:"git ls-remote --tags origin | grep 1.1.1", returnStatus:true
          if (statusCode == 0) {
            error "VERSION is already tagged, Use new version number"
          } else {
              sh '''
                mkdir temp 
                echo $GIT_URL | sed -e "s|github.com|${TOKEN}@github.com|" 
              '''
//              sh 'mkdir temp'
//              //def gitUrl = sh script:"env", returnStdout:true
//              env gitUrl = sh script:"echo \$GIT_URL | sed -e 's|@github|\${TOKEN}@github|'", returnStdout:true
//              sh 'echo gitUrl'
          }
        }
      }
    }


  }

  post {
    always {
      cleanWs()
    }
  }

}
//
