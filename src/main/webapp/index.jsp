<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Hello DevOps</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .container {
            text-align: center;
            padding: 50px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }
        h1 {
            font-size: 4em;
            margin: 0;
        }
        p {
            font-size: 1.5em;
            margin: 20px 0;
        }
        .emoji {
            font-size: 6em;
            animation: bounce 2s infinite;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="emoji">🚀</div>
        <h1>Hello DevOps!</h1>
        <p><strong>Version:</strong> 1.0.0</p>
        <p><strong>Build Time:</strong> <%= new java.util.Date() %></p>
        <p>Successfully deployed via Jenkins Pipeline!</p>
        <p>✅ Maven Build → ✅ Nexus Storage → ✅ Deployment</p>
    </div>
</body>
</html>
