<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="chat.app.ex.model.ChatDAO"%>
<%@ page import="chat.app.ex.model.ChatBean"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chat page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href='css/chat_list.css'>
</head>
<body>
<jsp:include page="index_nav.jsp" flush="false" />

<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-xs-12">
			<div class="portlet portlet-default">
				<div class="portlet-heading">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="chatlist" class="porlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
					</div>
					<div class="portlet-footer">
						<div class="row">
							<div class="form-group col-xs-4">
								<input style="height: 40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="8">
							</div>
						</div>
						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="index_foot.jsp" flush="false" />
	
</body>
</html>