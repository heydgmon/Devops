#!/bin/bash

TIMESTAMP=$(date +%Y%m%d%H%M%S)
TARGET_PATH="/home/ec2-user/apps/api/$TIMESTAMP"

mkdir -p "${TARGET_PATH}"

cd "/home/ec2-user/apps/api"
ln -snf "${TARGET_PATH}" ./current

echo '#### GIT CLONE...'

sh /home/ec2-user/build/git/api/api-gitclone.sh

echo '#### BUILD...'

cd /home/ec2-user/build/git/api/current/ktis-ai-chatbot-user-api
gradle clean :api:build --no-build-cache

echo '#### COPY JAR...'
# cd /home/ec2-user/build/git/api/current/ktis-ai-chatbot-user-api/api/build/libs/
cp /home/ec2-user/build/git/api/current/ktis-ai-chatbot-user-api/api/build/libs/default-name.jar "${TARGET_PATH}"

echo '#### DEPLOY API...'
cd "/home/ec2-user/apps/api/current"
