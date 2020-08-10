## 전자정부 표준 프레임워크 커스터마이징

***
###파스타 클라우드 활용(공통)

1. 스프링프로젝트 parksangcheon_mysql 변경.
2. 이클립스에서 parksangcheon_mysql 프로젝트를 파스타에 배포.(Hsql용)
3. parksangcheon_mysql 로컬 mysql서버와 연동처리.
4. 파스타 클라우드에서 Mysql서비스 생성.(원격접속이름과 암호를 확인가능)
5. 원격 phpmyadmin 툴(워크벤치와 비슷)을 파스타 클라우드에 PHP앱 생성 후 배포.
6. parksangcheon_mysql 프로젝트를 클라우드용 DB사용으로 변경 후 파스타에 재배포. 	http://parksangcheon_mysql.paas-ta.org
7. egov_sht 프로젝트 이름 변경: parksangcheon_egov 스타에배포(Mysql클라우드사용). 
	http://parksangcheon_egov.paas-ta.org
***

### 200810(월) 작업내역

- context-datasource.xml: Hsql 데이터베이스 사용 주석처리

```
<!-- hsql 주석처리
<jdbc:embedded-database id="dataSource-hsql" type="HSQL">
	<jdbc:script location= "classpath:/db/shtdb.sql"/>
</jdbc:embedded-database>
-->
```


- globals.properties: 유니코드 에디터로 생성됨. DB에 관련된 전역변수 지정.

```
# DB서버 타입(mysql, oracle, altibase, tibero) - datasource 및 sqlmap 파일 지정에 사용됨
Globals.DbType = mysql
Globals.UserName=root
Globals.Password=apmsetup
# mysql
Globals.DriverClassName=net.sf.log4jdbc.DriverSpy
Globals.Url=jdbc:mysql://127.0.0.1:3306/sht
#Hsql - local hssql \uc0ac\uc6a9\uc2dc\uc5d0 \uc801\uc6a9
#Globals.DriverClassName=net.sf.log4jdbc.DriverSpy
#Globals.Url=jdbc:log4jdbc:hsqldb:hsql://127.0.0.1/sampledb
```

-web.xml : 톰캣(WAS)이 실행될 때 불러들이는 xml 설정들 확인.

```
egov-com-servlet.xml
- Dispatcherservlet(서블렛배치=콤퍼넌트-scan:@Controller, @Service, @repository에 관련된 설정 수정)
- <context:component-scan vase-package="egovframework,edu">
- 위에서 ,edu 추가: edu.human.com 패키지 추가로 해당 패키지로 시작하는 콤포넌트를 빈 (실행 가능한 클래스)으로 자동들록하게 처리
```

- pom.xml : 메이븐 설정 파일중 Hsql DB를 Mysql DB사용으로 변경

```
Hsql은 주석 Mysql, log4jdbc는 주석해제
<!--
<dependency>
	<groupId>org.hsqldb</groupId>
	<artifactId>hsqldb</artifactId>
	<version>2.3.2</version>
</dependency>
-->
<!-- mysql driver -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>5.1.31</version>
</dependency>
<!-- log4jdbc driver 주석해제. 기능: Console창에 쿼리보이기-->
<dependency>
    <groupId>com.googlecode.log4jdbc</groupId>
    <artifactId>log4jdbc</artifactId>
    <version>1.2</version>
    <exclusions>
        <exclusion>
            <artifactId>slf4j-api</artifactId>
            <groupId>org.slf4j</groupId>
        </exclusion>
    </exclusions>
</dependency>
