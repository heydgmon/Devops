# jenkins에서 github master 브랜치 프로젝트 클론 후 빌드 및 실행하는 방법
1.프로젝트 생성
-Freestyle project

"소스코드 관리"에서
git 클릭 -> 레포 url 클릭 -> 브랜치 클릭

그러면 아래 디렉토리에 저장소가..만들어짐
cd /var/lib/jenkins/workspace/github

그리고 여기에 git에서 clone받은 프로젝트 소스가 들어감


아래는 git에서 clone 받은 이후 실행하는 스크립트

cd /var/lib/jenkins/workspace/github
chmod 777 gradlew
./gradlew build
cd /var/lib/jenkins/workspace/github/build/libs
chmod 777 demo-0.0.1-SNAPSHOT.jar
nohup java -jar demo-0.0.1-SNAPSHOT.jar
exit


# github에 푸쉬 시 자동으로 jenkins 빌드시키는 방법
1.jenkins 프로젝트의 "빌드유발"에서 github plugin에 있는 GitHub hook trigger for GITScm polling를 체크함
2.github webhook생성
3.github에 변경사항 푸쉬 시 자동으로 jenkins에 빌드됨

[빌드 로그]
Started by GitHub push by heydgmon
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/github
The recommended git tool is: NONE
No credentials specified
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/github/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/heydgmon/springcicd # timeout=10
Fetching upstream changes from https://github.com/heydgmon/springcicd
 > git --version # timeout=10
 > git --version # 'git version 2.40.1'
 > git fetch --tags --force --progress -- https://github.com/heydgmon/springcicd +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 2bfc19e60c952b523a39996d586213db728f1092 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 2bfc19e60c952b523a39996d586213db728f1092 # timeout=10
Commit message: "Update test"
 > git rev-list --no-walk 57e0a8e7b8f5b7927e51fd82f19d160824fbc99e # timeout=10
[github] $ /bin/sh -xe /tmp/jenkins10484460891779422002.sh
+ cd /var/lib/jenkins/workspace/github
+ chmod 777 gradlew
+ ./gradlew build
Starting a Gradle Daemon (subsequent builds will be faster)
> Task :compileJava UP-TO-DATE
> Task :processResources UP-TO-DATE
> Task :classes UP-TO-DATE
> Task :resolveMainClassName UP-TO-DATE
> Task :bootJar UP-TO-DATE
> Task :jar UP-TO-DATE
> Task :assemble UP-TO-DATE
> Task :compileTestJava NO-SOURCE
> Task :processTestResources NO-SOURCE
> Task :testClasses UP-TO-DATE
> Task :test NO-SOURCE
> Task :check UP-TO-DATE
> Task :build UP-TO-DATE

BUILD SUCCESSFUL in 8s
5 actionable tasks: 5 up-to-date
+ cd /var/lib/jenkins/workspace/github/build/libs
+ chmod 777 demo-0.0.1-SNAPSHOT.jar
+ nohup java -jar demo-0.0.1-SNAPSHOT.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v3.4.1)

2025-01-02T05:55:09.006Z  INFO 5891 --- [demo] [           main] com.example.demo.DemoApplication         : Starting DemoApplication v0.0.1-SNAPSHOT using Java 17.0.12 with PID 5891 (/var/lib/jenkins/workspace/github/build/libs/demo-0.0.1-SNAPSHOT.jar started by jenkins in /var/lib/jenkins/workspace/github/build/libs)
2025-01-02T05:55:09.018Z  INFO 5891 --- [demo] [           main] com.example.demo.DemoApplication         : No active profile set, falling back to 1 default profile: "default"
2025-01-02T05:55:10.304Z  INFO 5891 --- [demo] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
2025-01-02T05:55:10.322Z  INFO 5891 --- [demo] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2025-01-02T05:55:10.323Z  INFO 5891 --- [demo] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.34]
2025-01-02T05:55:10.371Z  INFO 5891 --- [demo] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2025-01-02T05:55:10.373Z  INFO 5891 --- [demo] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1263 ms
2025-01-02T05:55:10.996Z  INFO 5891 --- [demo] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
2025-01-02T05:55:11.016Z  INFO 5891 --- [demo] [           main] com.example.demo.DemoApplication         : Started DemoApplication in 2.618 seconds (process running for 3.16)
