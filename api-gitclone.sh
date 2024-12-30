#!/bin/bash

echo '소스 받는다~!'

cd /home/ec2-user/build/git/api

# 현재 시간 기준으로 yyyyMMddhhmmss 형식의 타임스탬프 생성
TIMESTAMP2=$(date +%Y%m%d%H%M%S)

# 해당 디렉토리 생성
mkdir -p "${TIMESTAMP2}"

# 링크 파일 생성
echo '링크 파일 생성...'
ln -snf ./"${TIMESTAMP2}" ./current

# 디렉토리로 이동
cd "${TIMESTAMP2}"

# git clone 수행
git clone -b master https://jenkins:GaXeG2bDSsZ2JRTeid6w@gitlab.ktis.co.kr/jproject/ktis-ai-chatbot-user-api.git
