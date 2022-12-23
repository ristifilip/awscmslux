
#!/bin/bash

# Schlüsselpaar erstellen

aws ec2 create-key-pair --key-name WP-Projekt --key-type rsa --query 'KeyMaterial' --output text >~/.ssh/wp-projekt.pem


# Sicherheitsgruppe erstellen 

aws ec2 create-security-group --group-name m346-sec-group --description "EC2-Webserver-SG"
aws ec2 authorize-security-group-ingress --group-name m346-sec-group --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-name m346-sec-group --protocol tcp --port 22 --cidr 0.0.0.0/0


# EC2-Instanz erstellen
# . ~ zeigt auf den Homepfad an.

aws ec2 run-instances --image-id ami-0574da719dca65348 --count 1 --instance-type t2.micro --key-name WP-Projekt --security-groups m346-sec-group --user-data file://~/awscmslux/cloud-init/cloud-init.yml --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Webserver}]'
