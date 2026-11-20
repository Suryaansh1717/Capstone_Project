#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Terraform Linux EC2 Web Server</title>
  <style>
    body { font-family: Arial, sans-serif; text-align: center; margin-top: 80px; background-color: #f4f6f9; }
    .card { display: inline-block; padding: 30px 50px; background: white; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
    h1 { color: #232f3e; }
    p { color: #555; }
  </style>
</head>
<body>
  <div class="card">
    <h1>Deployed via Terraform!</h1>
    <p>Apache Web Server is running on Amazon Linux EC2.</p>
  </div>
</body>
</html>
EOF
