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



# AWS 코드 시리즈
* CodeCommit의 레포지토리를 로컬로 옮기는 법
1.Codecommit 레포에서 코드 생성   
2.Codecommit git 연동 권한 부여(iam)   
3.git bash에서 git clone + url 시 2의 자격증명 입력하라고 나옴   
4.입력하면 로컬에 깔림   


* 로컬에서 codecommit으로 커밋하는 법
1.위에꺼랑 동일하고 5만 바꾸면됨

* Codebuild에서 build 하는법
https://medium.com/@saurabhdahibhate50/mastering-aws-codebuild-a-step-by-step-guide-a7cf9e037284

빌드 성공한 파일 : buildespec.yaml (아티팩트와 cp부분 수정)

s3에서 '열기'클릭 시 웹사이트 열림

* Codedeploy 배포하는법
https://sweetysnail1011.tistory.com/64





