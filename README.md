# FileTest

#### Tiles 기술을 사용하지 않고 기존 방식(include 방식) 사용해서 조각페이지 관리하기

- new - spring legacy project - spring mvc project
- project name: `FileTest`
- root package: `com.test.file`

---

#### 자바 버전과 pom.xml 수정

- 프로젝트 우클릭 -> Project Facets -> Java 11, Dynamic Web Module 3.1
- properties 태그에 있는 java-version 11
- 그 아래 스프링 버전 5.0.7.RELEASE로
- 맨 아래쪽 plugin 태그 -> maven plugin 내부
  - configuration 태그 내부 source, target 내부 11로 변경
- servlet, jsp 버전 약간 상향
  - 3.1.0, artifact id: javax. 붙이기
  - 2.3.3, artifact id: javax.servlet 붙이기

---
#### 파일 업로드 설정하기
1. 파일 저장 폴더: `webapp/resources/files`
2. `web.xml`
3. `servlet-context.xml`

---

#### 파일, 패키지

<!-- 
##### src/main/java - 구현용
- com.test.tiles(root)
  - .controller
    - `MainController.java`
    - `MemberController.java`
    - `AdminController.java`

##### src/main/webapp - View 관련
- resources/css
  - `main.css`
- WEB-INF
  - `web.xml` : tiles 세팅 XML 파일
- WEB-INF/views
  - `index.jsp`
  - /member : 주업무 코드만이 존재하는 조각 페이지
    - `info.jsp`
    - `history.jsp`
    - `favorite.jsp`
  - /admin : 주업무 코드만이 존재하는 조각 페이지
    - `log.jsp`
    - `setting.jsp`
  - /inc : 조각 페이지
    - `main_menu.jsp`: 주메뉴(상단)
    - `member_menu.jsp`:보조메뉴(회원)
    - `admin_menu.jsp`: 보조메뉴(관리자)
    - `asset.jsp`
  - /layout : 조각페이지 연결용 jsp 레이아웃 파일
    - `member.jsp`
    - `admin.jsp` 
-->