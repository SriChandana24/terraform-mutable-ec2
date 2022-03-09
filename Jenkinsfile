pipeline {

  agent {
    node { label 'workstation' }
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
          def statusCode = sh script:"git ls-remote --tags origin | grep \$(cat VERSION | sed -e 's|#||')", returnStatus:true
          print statusCode
        }
      }
    }


  }

}
//
