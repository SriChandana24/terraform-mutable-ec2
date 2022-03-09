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
        sh '''
git ls-remote --tags origin | grep $(cat VERSION| sed -e 's|#||') 
        '''
      }
    }


  }

}
//
