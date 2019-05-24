# Java with DataBase

### JDBC driver(Java DataBase Connectivity)
JVM의 시스템과 DB시스템을 연결하고 통신하기 위한 JAVA의 표준스펙(Java API)

### DAO
특별한 경우가 아니면(변경을 가하는 작업이 없는 경우) Singleton pattern 적용 -> List로 읽어드린다.

### static
DB연결시 1회만 수행되서 작성하여 이용할 수 있다. 또한 **java.sql Class** 의 모든 메서드는 static이다.(반드시 객체를 생성시킬 필요 x)

<br />

### DriverManger Class
- 데이터 원본에 JDBC드라이버를 통하여 커넥션을 만드는 역할
- Class.forName( ) 메소드를 통해 생성
- forName( ) 은 드라이버 클래스를 찾지 못할 경우 **ClassNotFoundException**을 발생시키므로 반드시 예외처리 해야한다.
- DriverManage Class는 Connection 인터페이스 구현객체를 생성하는데 getConnection( )메소드를 사용한다.

<br />

### Connection Interface
- SQL 문장을 실행시키기전 Connection 객체가 있어야 한다.
- Connection 객체는 특정 데이터와 연결된 커넥션을 나타내고, 특정한 SQL문장을 정의하고 실행시킬 수 있는 Statement객체를 생성할 때도 connection 객체를 사용한다.
- MetaData에 관한 정보를 데이터 원본에 질의하는데 사용한다.

<br />

### Statement Interface
- 단순 질의문에 사용한다.
- Connection 객체에 의해 프로그램에 리턴되는 객체에 의해 구현되는 일종의 메소드 집합을 정의
> **statement** 객체는 인터페이스를 구현한 객체로, 항상 인수가 없는 Connection 클래스의 **createStatement( )** 메소드를 호출함으로써 얻어진다.

- executeQuery( ) 메소드로 질의 실행

<br />

### PreparedStatement Interface
- Connection객체의 prepareStatement( ) 메소드를 사용하여 객체 생성
- SQL 문장이 미리 컴파일됨(실행하는 동안 인수값을 위한 공간을 확보할 수 있음)
- 여러번 특정값만 바꾸어 실행하거나 많은 데이터를 다뤄 정리가 필요할 때 유용
> **statement**객체의 SQL은 실행될 때 매번 서버에서 분석해야 하는데 **PreparedStatement**객체는 한 번 분석되면 재사용이 용이하다.

1. execute
 - executeQuery, executeUpdate 두가지 경우를 모두 포함한다.
 - 즉, DML, DCL, DDL 모두사용 가능 / 다만 return이 boolean형이다.
2. executeQuery( )
- ResultSet을 얻기 위한 메소드
- 주로 select문이 여기에 속한다.
3. executeUpdate( )
- 적용된 행의 갯수를 얻기 위한 메소드
- DDL(create, alter, drop), DML(insert, update, delete)
- INSERT, DELETE, UPDATE 관련 구문에서는 반영된 RECORD 갯수를 리턴
- CREATE, DROP 관련 구문에서는 -1을 반환

<br />

### Callable Statement Interface
- Connection 객체의 prepareCall( ) 메소드를 사용해서 객체를 생성한다.
- 주로 Stored Procedure(SQL문을 저장한 것)를 사용하기 위해 사용된다.

<br />

### ResultSet Interface
- 질의에 의해 생성된 테이블을 담고 있다.
- ResultSet객체는 '커서(cursor)'를 가지고 있어 특정 행에 대한 참조 조작 가능.

<br />

# Encryption

## 기본적인 사용자 등록 및 인증관련 흐름
1. 사용자가 계정을 생성한다.
2. 사용자의 비밀번호는 해싱되어 데이터베이스에 저장된다. 원본 패스워드의 해시값이 하드디스크 어디에도 기록되지 않는다.
3. 사용자가 로그인을 시도할 때 사용자가 입력한 패스워드의 해시값이 데이터베이스에 저장된 값과 동일한지 비교한다.
4. 만약 해시값이 동일하면, 사용자는 로그인에 성공하고 아니면 잘못된 값을 입력했다고 알려준다.
5. 로그인을 계속 시도하는 경우 3~4번 과정을 반복한다.

> 4번 과정에서 '사용자 ID 및 비밀번호가 일치하지 않습니다'라고 노출시켜야 한다. ID가 잘못되었는지 비밀번호가 잘못되었는지 절대 알려주지 않는다.

<br />

일반적으로 해쉬 함수를 통해서 비밀번호를 관리하면 사용자들의 비밀번호는 안전할 것이라고 생각할 수 있다. 이것은 현실과는 꽤 다른데 아주 빠르게 일반 해시 암호를 찾아낼 수 있는 방법이 있다.

-> 단어 사전 입력 공격 및 무차별 대입공격, Lookup tables 등등..

<br />

## Adding Salt

만약 두 사용자가 동일한 비밀번호를 사용한다면 이들은 동일한 해싱 비밀번호를 가지게 된다. 소금이라 불리는 무작위 문자열을 비밀번호로 해싱하기 전에 붙여서 해쉬값을 무작위로 만들 수 있다. 이 값은 보통 사용자 계정을 저장하는 데이터베이스에 비밀번호 해쉬값과 같이 있거나 해쉬값으로 변환 되어 저장한다.

<br />

### Salt의 잘못된 사용
### 1. 짧은 소금값 & 소금값 재사용
- 각 해쉬마다 같은 소금값을 이용하면 안된다. 이 소금값을 추가한 후 해싱한다면 쉽게 비밀번호를 얻어 낼 수 있다.
- 소금값이 너무 짧으면 해커는 가능한 소금값들을 활용해서 LookUp table을 만들 수 있다.

### 2. 이중 해싱 및 엉뚱한 해쉬 함수
- 다른 해싱 함수들을 조합해서 사용할 수 있으니 그 결과가 더 안전할 것이라고 생각 하기 쉽ㄴ다. 물론 이를 수행함으로써 아주 작은 이득이 있다. 하지만 이 방법은 상호 운영성에 대한 문제가 발생하고 가끔 해쉬 값을 덜 안전하게 만들기도 한다.

### 3. 항상 서버에서 해시를 해야한다.

<br />

**비밀번호 저장하기**

1. CSPRNG를 사용해서 임의의 소금값을 생성한다.(CSPRNG : java.security.SecureRandom)
2. 소금값을 비밀번호 앞에 덧붙이고 SHA256같은 표준 암호화 해시 함수를 사용해서 해시한다.
3. 소금값과 해시값을 사용자 계정 테이블에 저장한다.

<br />

**비밀번호 유효성 검사**

1. 사용자의 소금값과 비밀번호 해시값을 테이터베이스에서 찾는다.
2. 입력한 비밀번호에 소금값을 것붙이고 비밀번호 해싱에 사용했던 동일한 해싱함수를 사용하여 해싱한다.
3. 입력한 비밀번호로 생성한 해싱값과 저장되어 있는 해싱값과 비교해서 일치하는지 확인하고 동일하면 비밀번호가 정확한 비밀번호를 입력한 것, 아니면 잘못된 비밀번호를 입력한 것이다.

