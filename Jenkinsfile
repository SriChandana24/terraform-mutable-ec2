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
              sh 'mkdir temp'
              sh 'cd temp; git clone ${GIT_URL} .'
          }
        }
      }
    }


  }

}
//
