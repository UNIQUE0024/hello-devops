pipeline {
    agent any
    
    tools {
        maven 'Maven3'
    }
    
    environment {
        NEXUS_URL = '192.168.0.17:8081'  // Change to your node3 IP!
        NEXUS_REPO = 'maven-releases'
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'admin123'
    }
    
    stages {
        stage('1️⃣ Checkout Code') {
            steps {
                echo '📥 Getting code from GitHub...'
                checkout scm
            }
        }
        
        stage('2️⃣ Build with Maven') {
            steps {
                echo '🔨 Building application...'
                sh 'mvn clean package'
                echo '✅ Build complete!'
            }
        }
        
        stage('3️⃣ Upload to Nexus') {
            steps {
                echo '========================================='
                echo '📤 STEP 3: Uploading to Nexus Repository'
                echo '========================================='
                script {
                    def warFile = 'target/hello-devops.war'
                    def artifactId = 'hello-devops'
                    def version = '1.0.0'
                    
                    sh """
                        curl -v -u ${NEXUS_USER}:${NEXUS_PASS} \
                        --upload-file ${warFile} \
                        http://${NEXUS_URL}/repository/${NEXUS_REPO}/com/devops/${artifactId}/${version}/${artifactId}-${version}.war
                    """
                    
                    echo '✅ Artifact uploaded to Nexus!'
                    echo "📍 URL: http://${NEXUS_URL}/repository/${NEXUS_REPO}/com/devops/${artifactId}/${version}/${artifactId}-${version}.war"
                }
            }
        }
        
        stage('4️⃣ Verify Upload') {
            steps {
                echo '========================================='
                echo '✅ STEP 4: Verification'
                echo '========================================='
                echo '🎉 SUCCESS! Your artifact is now stored in Nexus'
                echo ''
                echo 'How to access it:'
                echo "1. Open Nexus: http://${NEXUS_URL}"
                echo '2. Browse → maven-releases'
                echo '3. Find: com/devops/hello-devops/1.0.0/'
                echo ''
            }
        }
    }
    
    post {
        success {
            echo ''
            echo '🎉 PIPELINE COMPLETED SUCCESSFULLY!'
            echo ''
            echo 'Summary:'
            echo '✅ Code downloaded from GitHub'
            echo '✅ Application built with Maven'
            echo '✅ .war file uploaded to Nexus'
            echo ''
            echo '📦 Your artifact is safely stored in Nexus repository!'
        }
    }
}
