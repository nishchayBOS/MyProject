pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'cmake -B build -DCMAKE_BUILD_TYPE=Release'
                sh 'cmake --build build'
            }
        }
        stage('Test') {
            steps {
                sh 'ctest --test-dir build --output-on-failure'
            }
        }
        stage('Package') {
            steps {
                sh 'cpack -G ZIP'
            }
        }
    }
}
