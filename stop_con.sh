pipeline {
  agent any

  stages {
    stage('Stop All Containers') {
      steps {
        // Checkout code from a Git repository
        git 'https://github.com/myuser/myrepo.git'

        // Copy the script to the workspace
        sh 'cp stop_containers.sh ${WORKSPACE}/'

        // Make the script executable
        sh 'chmod +x ${WORKSPACE}/stop_containers.sh'

        // Execute the script
        sh './stop_containers.sh'
      }
    }
  }
}

