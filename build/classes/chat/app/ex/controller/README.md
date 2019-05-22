
## Servlet
Controller로써 모든 요청을 Servlet으로 받고 client에게 보여줄 page는 jsp로 작성한다.

<br />

#### Life Cycle
객체생성 -> init( ) -> Service( ) -> doGet( ) -> destroy( )
> init( ) : 최초 1회 실생(새로고침시 수행안 됨)
> -> 한번 Servlet객체가 생성되었기 때문에, Servlet 객체는 메모리에 저장되어 있다.

<br />

## Java

### Java try - catch - resources
- exception 처리하므로써 정상실행 상태가 유지되도록 할 수 있다.
- 자바가 제공하거나 개발자가 만드는 모든 예외는 **java.lang.Exception** 클래스 상속

<br />

##### Exception
- 일반예외 : 컴파일 과정에서 예외판단
- RuntimeException : JVM이 상속여부를 보고 판단

<br />

##### Multi catch
```java
try{

}catch(예외1 | 예외2){

}
```
- 동일하게 처리하고 싶은 예외를 연결한다.

<br />

##### Auto Closeable Interface
- 예외 발생여부와 상관없이 finally에서 항상 처리해줘야 했던 리소스 객체(입출력 스트림, 소켓 등)의 close( )메소드를 호출해서 안전하게 리소스를 닫아준다.

**자바6이전**
```java
FileInputStream fis = null;
try{
    fis = new FileInputStream("file.txt");
    //...
}catch(IOexception e){
    //...
}finally{
    if(fis != null){
        try{
            fis.close();
        }catch(IOException e){
       }
     }
}
```
**자바6이후**
```java
try(FileInputStream fis = new FileInputStream("file.txt");
    FileOuputStream fos = new FileOutputStream("file2.txt")){
    // ...
    }catch(IOException e){
    // ...
    }
```
**Auto Closeable Interface**로 구현할 수 있다.

<br />

## 직렬화(Serializable)
- 자바시스템 내부에서 사용되는 객체 또는 데이터를 외부의 자바 시스템에서도 사용할 수 있도록 byte형태로 데이터 변환하는 기술 <-> 역직렬화
- 자바 기본(**primitive type**)과 **java.io.Serializable** 인터페이스를 상속받은 객체는 직렬화 할 수 있는 기본 조건을 가진다.
- 직렬화 방법은 **java.io.ObjectOutputStream**객체를 이용한다.

<br />

**CSV, JSON** : 대부분의 시스템에서의 데이터 교환시 많이 사용
**<->**
**Java직렬화** : 자바 직렬화 형태의 데이터 교환은 자바 시스템간의 데이터 교환을 위해서 존재한다.
> 굳이 자바직렬화를 써야하나?
> => **'목적에 따라 적절하게 써야한다.'**

장점 : 자바시스템에서의 개발에 최적화, 복잡한 데이터 구조의 클래스 객체라도 직렬화 기본조건만 지키면 큰 작업 없이 직렬화 가능

<br />

##### 언제, 어디서 사용되나?
1. JVM의 메모리에서만 상주되어 있는 객체 데이터를 그래도 영속화(Persistence)가 필요할 때 사용된다.(영속화 : 시스템을 종료하더라도 없어지지 않는다.(네트워크로 전송가능))
2. 많이 사용되는 곳:
- 서블릿 세션(Servlet Session)
- 캐시(cache)
- 자바 RMI(Remote Method Invocation)
> **자바 RMI** : 자바 직렬화에서 빠지지 않는 부분(java.io.Serializable 인터페이스 구현)


<br />

##### 클래스 구조변경시(직렬화)

- 특별한 문제 없으면 **serialVersionUID**의 값은 개발시 직접 관리 해야 한다.
- 외부(DB, 캐시서버, SQL서버)에 장기간 저장될 정보는 사용을 지양한다.
> 쓰레기가 될 가능성이 높다. 또한 언제 예외가 발생할지 모른다.

- 프레임워크, 라이브러리가 제공하는 클래스에는 사용을 지양한다.(개발자가 직접 컨트롤하기 힘듬)
> - 객체가 직접 SerialVersionUID를 가지고 있을 수 있다.
> - 버전업하면서 변경할 수도 있음
> - 테스트시에 발생안하다가 운영에 반영될 수 있음

- 자주변경되는 클래스의 객체는 사용안하는 것이 좋다.
- 역직렬화가 되지 않을 때와 같은 예외처리는 기본적으로 해둘 것.
- 긴 만료시간을 가지는 데이터는 JSON등 다른 포맷을 사용하여 저장
