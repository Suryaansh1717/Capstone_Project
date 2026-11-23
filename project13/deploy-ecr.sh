#!/usr/bin/env bash
set -euo pipefail

AWS_REGION="ap-south-1"
REPO_NAME="suryaansh-capstone-app"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
ECR_URI="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO_NAME}"

aws ecr describe-repositories --repository-names "$REPO_NAME" --region "$AWS_REGION" >/dev/null 2>&1 || \
  aws ecr create-repository --repository-name "$REPO_NAME" --region "$AWS_REGION" --image-scanning-configuration scanOnPush=true

aws ecr get-login-password --region "$AWS_REGION" | sudo docker login --username AWS --password-stdin "${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"

sudo docker build -t "$REPO_NAME:v1" .
sudo docker tag "$REPO_NAME:v1" "$ECR_URI:v1"
sudo docker tag "$REPO_NAME:v1" "$ECR_URI:latest"
sudo docker push "$ECR_URI:v1"
sudo docker push "$ECR_URI:latest"
