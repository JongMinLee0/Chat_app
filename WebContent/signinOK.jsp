<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>singin OK</title>
</head>
<body>

<%
String login = (String)request.getAttribute("login");
%>
<c:set var="login" value="<%=login%>"/>
<c:if test="${login=='sucess'}">
    <script>
    alert("로그인 되었습니다!!");
    document.location.href="index.jsp";
    </script>
</c:if>
<c:if test="${login=='fail'}">
    <script>
    alert("로그인 실패하였습니다.");
    document.location.href="login.jsp";
    </script>
</c:if>
</body>
</html>