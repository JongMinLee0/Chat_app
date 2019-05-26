<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write OK</title>
</head>
<body>

<%String result = (String)request.getAttribute("result"); %>
<c:set var = "result" value = "<%=result %>"/>

<c:if test="${result=='sucess'}">
	<script>
	alert("글 작성에 성공했습니다!!");
	document.location.href="board.jsp";
	</script>
</c:if>
<c:if test="${result=='fail'}">
	<script>
	alert("글 작성에 실패했습니다...");
	document.location.href="write.jsp";
	</script>
</c:if>

</body>
</html>