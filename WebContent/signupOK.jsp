<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup OK</title>
</head>
<body>

<%-- <%
String result = (String)request.getAttribute("result");

if(result.equals("sucess")){
	pageContext.forward("index.jsp");
}else if(result.equals("fail")){
	pageContext.forward("signup.jsp");
}
%> --%>
<%
String result = (String)request.getAttribute("result");
%>
<c:set var="result" value="<%=result%>"/>
<c:if test="${result=='sucess'}">
    <script>
    alert("회원가입 되었습니다!!");
    document.location.href="login.jsp";
    </script>
</c:if>
<!-- 여기에 중복처리 구현 / 실패 -> 무엇이 중복되었다 -->
<c:if test="${result=='email'}">
    <script>
    alert("이미 가입된 사용자입니다.");
    document.location.href="signup.jsp";
    </script>
</c:if>
<c:if test="${result=='nick'}">
    <script>
    alert("닉네임이 중복되었습니다.");
    document.location.href="signup.jsp";
    </script>
</c:if>
<c:if test="${result=='fail'}">
    <script>
    alert("회원가입이 실패하였습니다.");
    document.location.href="signup.jsp";
    </script>
</c:if>




</body>
</html>