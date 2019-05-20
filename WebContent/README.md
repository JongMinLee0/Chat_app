# Web Application
----------------------------------------------------------------------------------------------
###WAS(Web Application Server)
- 동적콘테츠를 제공하기 위해 만들어진 Application server(DB조회, 로직처리가 요구되는 컨텐츠)

<br />

### Web Server
- 클라이언트가 서버에 페이지 요청을 하면 요청을 받아 정적컨텐츠(html, png, css 등)를 제공하는 서버
- 클라이언트에서 요청이 올때 가장 앞에서 요청에 대한 처리를 한다.

<br />

### Tomcat
- Tomcat은 Servlet container, Servlet Engine으로써 Servlet 실행

<br />

### Web.xml
- client가 어떤 URL을 요청했을 때 어떤 Servlet파일을 실행시킬 것인지 Mapping 해놓은 파일
- Annotation으로 대체할 수 있다.(이 방법이 훨씬 간단하다)

<br />

## JSP / JSTL / EL
---------------------------------------------------------------------------------------------------
**JSP** : Java Server Pages
**JSTL** : Jsp Standard Tag Library
**EL** : Expression Language

<br />

Attribute를 작은 scope에서 큰 scope로 찾는다.(page -> request -> session -> application)
> Attribute : method를 통해서 저장되고 관리되고 있는 Data

<br />

**1. PageContext / Request에서 사용될 때**

- setAttribute("key", value) : 값을 넣는다.
- getAttribute("key") : 값을 가져온다.
- removeAttribute("key") : 값을 지운다.

**2. Session에서 사용될 때**

- set / get/ remove 동일, 추가로 ++
- invalidate( ) : 값을 전부 지운다.

**3. 기호 연산자**
- '/' = div ,  '%' = mod
- '>=' = le (less or equal)
- '<=' = ge (greater or equal)
- '>' = lt (less than)
- '<' = gt (greater than)
- '==' = eq (equal)
- '!=' = nq (not equal)

**4. 내장객체**
1. pageScope : pageScope에 접근
2. requestScope : requestScope에 접근
3. sessionScope : sessionScoep에 접근
4. applicationScope : applicationScope에 접근
5. param : 파라미터 값 얻어올 때(1개의 key에 1개의value)
6. paramValues : 파라미터 값을 배열로 얻어올 때(1개의 key에 여러개의 value)
7. header : 헤더값 얻어올 때(1개의 key에 한개의 value)
8. headerValues : 헤더값을 배열로 얻어올 때(1개의 key에 여러개의 value)
9. cookie : ${cookie.key값.value값} 으로 쿠키값 조회
10. initParam : 초기 파리미터 조회
11. pageContext : pageContext객체를 참조할 때

<br />

### JSTL TAG

1. Core(prefix : c)
- 일반 프로그래밍에서 제공하는 것과 유사한 변수선언
- 실행 흐름의 제어기능을 제공
- 페이지 이동기술 제공
2. Formatting(prefix : fmt)
- 숫자, 날짜, 시간을 포맷팅 하는 기능을 제공
- 국제화 , 다국어 지원기능 제공
3. DataBase(prefix : sql)
- DB의 data를 입력, 수정, 삭제, 조회하는 기능을 제공
4. XML(prefix : x)
- XML문서를 처리할 때 필요한 기능 제공
5. Function(prefix : fn)
- 문자열을 제공하는 함수제공

<br />

<**출력**>

-  ``` <c: out value="${변수}"> ``` : 변수 출력
-  ``` <c: out value="${param.name}"> ``` : name에서 입력된 값을 출력
-  ``` <c: out value="{testit}" default="Default Value"/> ``` : 변수에 값이 없을 경우 default 값 출력

<**if문**>
```jsp
<c : if test="${A=B}">
    <c:if ...  >
        실행 => 본문없이 if 구문 안에서 처리할 수도 있다.
    </c:if>
</c:if>
```

<**기타**>

- c:choose => switch, otherwise => else나 defalut
- c: when => case

<br />

### JSP TAG
1.<**jsp:useBean**>
```jsp
<jsp:useBean id = "빈이름" class="자바빈 클래스이름" scope="범위" />
```
id : jsp page에서 자바빈 객체에 접근할 때 사용하는 이름
class : 패키지를 포함한 자바빈 클래스 이름
scope : 자바빈 객체가 저장될 영역 지정, default = page(page, request, session, application)


2.<**jsp:setProperty**>
```jsp
<jsp:setProperty name="자바빈" property="이름" value = "값" />
```
name : property 값을 변경할 객체 / useBean에서 지정한 id값
property : 값을 지정할 property 이름 / *의 경우 값과 같은 이름 ex) id=id, pw=pw...
value : property값, 표현식 사용가능

3.<**jsp:getProperty**>
```jsp
<jsp:getProperty name="자바빈" property="이름"/>
```
name = ```<jsp:useBean>``` 액션 태그의 id속성에서 지정한 값 사용
property : 값을 가져올 property 이름

<br />

## Cookie / Session

<br />
**사용하는 이유** : HTTP 프로토콜의 특징이자 약점을 보완하기 위해서.
### HTTP의 특징
1. 비연결지향(Connectionless)
- 클라이언트가 request를 서버에 보내면, 서버는 client에게 요청에 맞는 response를 보내고 접속을 끊는 특성이 있다.
- HTTP1.1버전에서 keep-alive가 추가 되긴 했다.
- 비연결지향 특성적분에 통신연결을 유지하지 않아 리소스 낭비가 줄어드는 장점이 있다. 그러나 새로 커넥션을 열기 때문에 계속 인증해야 하는 단점이 생긴다.
2. 상태정보유지안함(Stateless)
- 연결을 끊는 순간 클라이언트와 서버의 통신이 끝나며 상태 정보는 유지하지 않는다.

<br />

### 쿠키(Cookie)
- 클라이언트 로컬에 저장되는 키와 값이 들어있는 작은 데이터 파일이다.
- 쿠키에는 이름, 값, 만료날짜(쿠키저장기간), 경로정보가 들어있다.
- 쿠키는 일정시간동안 데이터를 저장할 수 있다.(로그인 상태 유지에 활용)
- 지속적으로 로그인 정보를 가지고 있는 것처럼 사용

<br />

##### 쿠키 프로세스
1. 브라우저에서 웹페이지 접속
2. 클라이언트가 요청한 웹페이지를 받으면서 쿠키를 클라이언트 로컬(하드)에 저장
3. 클라이언트가 재 요청시 웹페이지 요청과 함께 쿠키값도 전송
4. 지속적으로 로그인 정보를 가지고 있는 것처럼 사용

<br />

##### 쿠키 사용사례
자동 로그인, 팝업에서 "오늘 더이상 창을 보지 않음" 체크, 쇼핑몰의 장바구니 등..

<br />

##### 쿠키의 제한
- 클라이언트에 300개까지 쿠키저장 가능
- 하나의 도메인망 20개의 값만 가질 수 있음
- 하나의 쿠키값은  4KB까지 저장
> Response Header에 Set-Cookie속성을 사용하면 클라이언트에 쿠키를 만들 수 있다. 쿠키는 사용자가 따로 요청하지 않아도 브라우저가 Request시에 Request Header를 넣어서 자동으로 서버에 전송한다.

<br />

### 세션(Session)
- 일정 시간동안 같은 브라우저로부터 들어오는 일련의 요구를 하나의 상태로 보고 그 상태를 유지하는 기술
- 즉, 웹 브라우저를 통해 웹서버에 접속한 이후로 브라우저를 종료할 때까지 유지되는 상태
- 클라이언트가 Request를 보내면, 해당 서버의 엔진이 클라이언트에게 유일한 ID를 부여하는데 이것이 세션 ID 이다.

<br />

##### 세션 프로세스
1. 클라이언트가 서버에 접속시 세션 ID를 발급
2. 서버에서는 클라이언트로 발급해준 세션 ID를 쿠키를 사용해 저장(JSESSIONID)
3. 클라이언트는 다시 접속할 때, 이 쿠키(JSEEIONID)를 이용해서 세션 ID값을 서버에 전달

> 즉, 세션을 구별하기 위해 ID가 필요하고 그 ID만 쿠키를 이용해서 저장해 놓는다.(쿠키사용) 쿠키는 자동으로 서버에 전송되니까 서버에서 세션아이디에 따른 처리를 할 수 있다.

##### 세션 사용사례
로그인 정보 유지

<br />

### 쿠키와 세션의 차이
**1. 저장위치**
쿠키는 클라이언트에 파일로 저장, 세션은 서버에 저장

<br />

**2.보안**
쿠키는 클라이언트 로컬에 저장되기 때문에 변질되거나 request에서 스나이핑 당할 우려가 있어서 보안에 취약하지만 세션은 쿠키를 이용해서 sessionID만 저장하고 그것으로 구분해서 서버에서 처리하기 때문에 비교적 보안성이 좋다.

<br />

**3.라이프 사이클**
쿠키도 만료시간이 있지만 파일로 저장되기 때문에 브라우저를 종료해도 계속해서 정보가 남아 있을 수 있다. 또한 만료기간을 넉넉하게 잡아두면 쿠키를 삭제를 할 때까지 유지될 수도 있다. 반면에 세션도 만료시간을 정할 수 있지만 브라우저가 종료되면 만료시간에 상관없이 삭제된다.

<br />

**4.속도**
쿠키에 정보가 있기 때문에 서버에 요청시 속도가 빠르고 세션은 정보가 서버에 있기 때문에 처리가 요구되어 비교젹 느린 속도를 낸다.

<br />

**세션을 주로 사용하면 좋은데 왜 쿠키를 사용할까?**
세션은 서버의 자원을 사용하기 때문에 무분별하게 만들다보면 서버의 메모리가 감당할 수 없어질 수가 있고, 속도가 느려질 수 있기 때문이다.

<br />

**쿠키, 세션은 캐시와 엄연히 다르다**
캐시는 이미지나 css, js파일 등이 사용자의 브라우저에 저장되는 것이다.
