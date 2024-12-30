#!/bin/bash

# 현재 디렉토리에 있는 current로 이동 (필요시 주석 해제)
# cd "$(dirname "$0")"

# 기존 프로세스 종료
PID=$(ps -ef | grep default-name.jar | grep -v grep | awk '{print $2}')
if [ ! -z "$PID" ]; then
    echo "기존 프로세스($PID)가 발견되었습니다. 종료합니다."
    kill -9 $PID
    echo "기존 PID 파일 제거"
    rm -f ./current/default-name.pid
else
    echo "기존 프로세스가 없습니다."
fi

# prod 환경으로 default-name.jar 실행
echo "default-name.jar를 prod 환경으로 실행합니다."
cd ./current
java -jar default-name.jar --spring.profiles.active=prod > ./default-name.log 2>&1

# 새로 실행된 프로세스 PID 기록
echo $! > ./default-name.pid

echo "실행 완료! PID: $(cat ./default-name.pid)"


이 파일은 apps/api 경로에 있음
