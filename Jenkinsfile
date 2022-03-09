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
git tag -l -n2
          git tag -l -n2 | grep $(cat VERSION| sed -e 's|#||') 
        '''
      }
    }


  }

}
//
