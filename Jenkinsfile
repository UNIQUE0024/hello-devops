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
```

4. Click **"Commit changes"**

---

## **STEP 3: Configure Jenkins (10 minutes)**

### **A. Install Maven in Jenkins**

1. **Open Jenkins** (click 8080 port link on node1)
2. **Manage Jenkins** → **Tools**
3. Scroll to **Maven installations**
4. Click **"Add Maven"**
5. Name: `Maven3` (exactly this!)
6. ✅ Check **"Install automatically"**
7. Version: Choose latest (3.9.x)
8. Click **"Save"**

---

### **B. Create Jenkins Pipeline Job**

1. Jenkins Dashboard → Click **"New Item"**
2. Enter name: `hello-devops-pipeline`
3. Select: **Pipeline**
4. Click **"OK"**

5. Scroll down to **Pipeline** section
6. Definition: Select **"Pipeline script from SCM"**
7. SCM: Select **"Git"**
8. Repository URL: `https://github.com/UNIQUE0024/hello-devops`
   (Replace YOUR-USERNAME with your actual GitHub username!)
9. Branch: `*/main` (or `*/master` if your default branch is master)
10. Script Path: `Jenkinsfile`
11. Click **"Save"**

---

## **STEP 4: Run the Pipeline! 🚀**

1. Click **"Build Now"**
2. Watch the pipeline execute (takes 2-3 minutes first time)

**You'll see:**
```
Stage View:
✅ 1️⃣ Checkout Code
✅ 2️⃣ Build with Maven
✅ 3️⃣ Show Build Artifact
✅ 4️⃣ Archive Artifact
