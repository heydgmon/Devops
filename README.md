# CI / CD
CI = 빌드 및 테스트 자동화  
CD = 배포 자동화  

# 로컬에서 소스를 만들고 서버에 배포하는 과정
개발 툴을 사용하여 Java로 코딩한다고 생각해보자.   
  1. 코드를 짜고 Run을 눌러 실행한다. (컴파일, 실행)   
 - .java 파일이 번역되어 .class 파일이 생성된다. (컴파일)   
 - 파일이 실행된다. (실행)   
2. 실행 가능한 파일(.war, .jar 등)로 뽑아낸다. (빌드)   
3. 웹 서버에 접근하여 원하는 디렉토리에 실행 파일을 올린다. (배포)

# git 개념
1.git add = 로컬에 올릴 파일들을 list하는 작업     
2.git commit = 로컬에 반영하는 작업   
3.git push = 로컬 레포에서 remote 레포로 옮기는 작업 
4.git clone = 깃 레포에서 프로젝트 복제해 가져오는 작업

* github의 레포지토리를 로컬로 옮기는 법
1.git bash에서 git clone + 레포 url 하면 옮겨짐

* 로컬에서 github로 커밋하는 법
1.git init   
2.git add 1.txt (커밋할 파일)   git add . (전부)
3.git commit -m "first commit" (커밋메시지)   
4.git branch -M master(마스터 브랜치)   
5.git remote add origin github url(깃허브 저장소로 주소 추가)   
6.git push -u origin master(마스터 브랜치에 푸시)    git push origin +master (강제푸시)

# EC2 배포 
1.ami linux에 자바 설치   
yum list java*   
sudo yum install java-11-amazon-corretto.x86_64   
java -version   

2.winscp로 키 등록해서 jar 파일 옮기기(ec2-user)   

3.EC 2서버 winscp root 권한으로 접속   

vi /etc/ssh/sshd_config   
PermitRootLogin은 위에 캡쳐와 같이 yes로 바꿔주고      
sudo cp /home/ec2-user/.ssh/authorized_keys /root/.ssh      
이후에 winscp root로 접속하면 접속된다   

4.java -jar xxxxx.jar 명령어 실행해서 배포 
   
5.접속 : ec2 public ip:포트번호   
여기까지 하면 접속은 되는데 이후에 톰캣 포트 겹쳐져서 접속안됨  
The Tomcat connector configured to listen on port 8081 failed to start 배포할때 이런 오류가 생김


# AWS 코드 시리즈
# CodeCommit의 레포지토리를 로컬로 옮기는 법
1.Codecommit 레포에서 코드 생성   
2.Codecommit git 연동 권한 부여(iam)   
3.git bash에서 git clone + url 시 2의 자격증명 입력하라고 나옴   
4.입력하면 로컬에 깔림   


# 로컬에서 codecommit으로 커밋하는 법
1.위에꺼랑 동일하고 5만 바꾸면됨

# Codebuild에서 build 하는법
https://medium.com/@saurabhdahibhate50/mastering-aws-codebuild-a-step-by-step-guide-a7cf9e037284

빌드 성공한 파일 : buildespec.yaml (아티팩트와 cp부분 수정)

s3에서 '열기'클릭 시 웹사이트 열림

# Codedeploy 배포하는법
https://sweetysnail1011.tistory.com/64





