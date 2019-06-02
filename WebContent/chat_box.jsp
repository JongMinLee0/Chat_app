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

<script
	src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<script
	src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
<script
	src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
<meta charset='UTF-8'>
<meta name="robots" content="noindex">
<link rel="shortcut icon" type="image/x-icon"
	href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />
<link rel="canonical"
	href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300'
	rel='stylesheet' type='text/css'>

<script src="https://use.typekit.net/hoy3lrg.js"></script>
<script>
	try {
		Typekit.load({
			async : true
		});
	} catch (e) {
	}
</script>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<link rel="stylesheet" href="css/chat_box.css">
</head>
<body>
	<%
		String nick = (String) session.getAttribute("nick");
		ChatDAO dao = ChatDAO.getInstance();
		
		
		if(request.getParameter("receive")!=null){
			String receive = request.getParameter("receive"); 
			List<ChatBean> aList = dao.getList(nick);
			
		}
	%>
	<jsp:include page="index_nav.jsp" flush="false" />
	<div id="frame">
		<div id="sidepanel">
			<div id="profile">
				<div class="wrap">
					<p><%=nick%></p>
				</div>
			</div>
			<div id="contacts">
				<ul>
					<li class="contact">
						<div class="wrap">
							<div class="meta">
								<p class="name">Louis Litt</p>
								<p class="preview">You just got LITT up, Mike.</p>
							</div>
						</div>
					</li>
					<li class="contact active">
						<div class="wrap">
							<div class="meta">
								<p class="name">Harvey Specter</p>
								<p class="preview">Wrong. You take the gun, or you pull out
									a bigger one. Or, you call their bluff. Or, you do any one of a
									hundred and forty six other things.</p>
							</div>
						</div>
					</li>

				</ul>
			</div>
			<div id="bottom-bar">
				<button id="addcontact">
					<i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add
						contact</span>
				</button>
			</div>
		</div>
		<div class="content">
			<div class="contact-profile">
				<p>Harvey Specter</p>
			</div>
			<div class="messages">
				<ul>
					<li class="sent">
						<p>What are you talking about? You do what they say or they
							shoot you.</p>
					</li>
					<li class="replies">
						<p>Wrong. You take the gun, or you pull out a bigger one. Or,
							you call their bluff. Or, you do any one of a hundred and forty
							six other things.</p>
					</li>
				</ul>
			</div>
			<div class="message-input">
				<div class="wrap">
					<input type="text" placeholder="Write your message..." />
					<button class="submit">
						<i class="fa fa-paper-plane" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="index_foot.jsp" flush="false" />
	<script
		src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
	<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
	<script>
		$(".messages").animate({
			scrollTop : $(document).height()
		}, "fast");

		function newMessage() {
			message = $(".message-input input").val();
			if ($.trim(message) == '') {
				return false;
			}
			$('<li class="sent"><p>' + message + '</p></li>').appendTo(
					$('.messages ul'));
			$('.message-input input').val(null);
			$('.contact.active .preview').html('<span>You: </span>' + message);
			$(".messages").animate({
				scrollTop : $(document).height()
			}, "fast");
		};

		$('.submit').click(function() {
			newMessage();
		});

		$(window).on('keydown', function(e) {
			if (e.which == 13) {
				newMessage();
				return false;
			}
		});
	</script>
</body>
</html>