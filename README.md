# Devops 

# CodeCommit의 레포지토리를 로컬로 옮기는 법
1.Codecommit 레포에서 코드 생성   
2.Codecommit git 연동 권한 부여(iam)   
3.git bash에서 git clone + url 시 2의 자격증명 입력하라고 나옴   
4.입력하면 로컬에 깔림   

# github의 레포지토리를 로컬로 옮기는 법
1.git bash에서 git clone + 레포 url 하면 옮겨짐

# 로컬에서 github로 커밋하는 법
1.git init   
2.git add 1.txt (커밋할 파일)   
3.git commit -m "first commit" (커밋메시지)   
4.git branch -M master(마스터 브랜치)   
5.git remote add origin github url(깃허브 저장소로 주소 추가)   
6.git push -u origin master(마스터 브랜치에 푸시)   

# 로컬에서 codecommit으로 커밋하는 법
1.위에꺼랑 동일하고 5만 바꾸면됨

# Codebuild에서 build 하는법
https://medium.com/@saurabhdahibhate50/mastering-aws-codebuild-a-step-by-step-guide-a7cf9e037284

빌드 성공한 파일 : buildespec.yaml

s3에서 '열기'클릭 시 웹사이트 열림
