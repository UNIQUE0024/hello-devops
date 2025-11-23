pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    stages {
        stage('1️⃣ Checkout Code') {
            steps {
                echo '========================================='
                echo '📥 STEP 1: Getting code from GitHub'
                echo '========================================='
                checkout scm
            }
        }
        
        stage('2️⃣ Build with Maven') {
            steps {
                echo '========================================='
                echo '🔨 STEP 2: Building application with Maven'
                echo '========================================='
                sh 'mvn clean package'
                echo '✅ Build successful! .war file created'
            }
        }
        
        stage('3️⃣ Show Build Artifact') {
            steps {
                echo '========================================='
                echo '📦 STEP 3: Here is the build artifact:'
                echo '========================================='
                sh 'ls -lh target/*.war'
                sh 'du -h target/*.war'
            }
        }
        
        stage('4️⃣ Archive Artifact') {
            steps {
                echo '========================================='
                echo '💾 STEP 4: Saving artifact in Jenkins'
                echo '========================================='
                archiveArtifacts artifacts: 'target/*.war', fingerprint: true
                echo '✅ Artifact saved! You can download it from Jenkins'
            }
        }
    }
    
    post {
        success {
            echo ''
            echo '🎉🎉🎉 PIPELINE COMPLETED SUCCESSFULLY! 🎉🎉🎉'
            echo ''
            echo 'What happened:'
            echo '1. ✅ Downloaded code from GitHub'
            echo '2. ✅ Built .war file with Maven'
            echo '3. ✅ Saved artifact in Jenkins'
            echo ''
            echo '📍 Find your .war file in Jenkins:'
            echo '   → Build #XX → Artifacts → hello-devops.war'
            echo ''
        }
        failure {
            echo '❌ Pipeline failed! Check the logs above.'
        }
    }
}
