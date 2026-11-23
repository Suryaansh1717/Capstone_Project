#!/usr/bin/env bash
set -euo pipefail

BUCKET_NAME="suryaansh-capstone-log-backups-590507089733"
REGION="ap-south-1"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H-%M-%SZ")
HOST=$(hostname)
ARCHIVE_NAME="${HOST}-logs-${TIMESTAMP}.tar.gz"
TMP_PATH="/tmp/${ARCHIVE_NAME}"

# Package system and Nginx logs
tar -czf "${TMP_PATH}" -C /var/log syslog nginx 2>/dev/null || tar -czf "${TMP_PATH}" -C /var/log syslog

# Upload to S3
/usr/local/bin/aws s3 cp "${TMP_PATH}" "s3://${BUCKET_NAME}/backups/${ARCHIVE_NAME}" --region "${REGION}" 2>/dev/null || aws s3 cp "${TMP_PATH}" "s3://${BUCKET_NAME}/backups/${ARCHIVE_NAME}" --region "${REGION}"

rm -f "${TMP_PATH}"
echo "[$(date -u)] Uploaded ${ARCHIVE_NAME} to s3://${BUCKET_NAME}/backups/${ARCHIVE_NAME}" >> /home/clouduser/Capstone_Project/project19/backup.log
