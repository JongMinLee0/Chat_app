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
