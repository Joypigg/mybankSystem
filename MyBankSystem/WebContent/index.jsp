<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>欢迎来到-银行系统登录界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- CSS -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/supersized.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body oncontextmenu="return false">

	<div class="page-container">
		<h1>银行系统登录界面</h1>
		<form action="logincheck.jsp" method="post">
			<div>
				<select name="s">
					<option selected="用户" value="1">普通用户</option>
					<option value="2">管理员</option>
				</select>
			</div>
			<div>
				<input type="text" name="username" class="username"
					placeholder="Username" autocomplete="off" />
			</div>
			<div>
				<input type="password" name="password" class="password"
					placeholder="Password" oncontextmenu="return false"
					onpaste="return false" />
			</div>
			<%
				// request.getCharacterEncoding("UTF-8");
				String flag = request.getParameter("flag");
				//String flag1=request.getParameter("flag1");
				if (flag != null && flag.equals("1")) {
					out.print("类型或用户名、密码错误！");
				} else if (flag != null && flag.equals("2")) {
					out.print("<script> alert('修改成功！请重新登录！');</script>");
				}
			%>

			<button id="submit" type="button">Sign in</button>
			<button id="reset" type="reset">reset</button>
		</form>

		<div class="connect">
			<p>If we can only encounter each other rather than stay with each
				other,then I wish we had never encountered.</p>
		</div>
	</div>


	<!-- Javascript -->
	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"
		type="text/javascript"></script>
	<script src="js/supersized.3.2.7.min.js"></script>
	<script src="js/supersized-init.js"></script>
	<script>
		$(".btn").click(function() {
			is_hide();
		})
		var u = $("input[name=username]");
		var p = $("input[name=password]");
		$("#submit")
				.live(
						'click',
						function() {
							if (u.val() == '' || p.val() == '') {
								$("#ts").html("用户名或密码不能为空!");
								is_show();
								return false;
							} else {
								var reg = /^[0-9A-Za-z]+$/;
								if (!reg.exec(u.val())) {
									$("#ts").html("用户名错误");
									is_show();
									return false;
								} else {
									$
											.get(
													"LoginServlet",
													{
														"username" : u.val(),
														"password" : p.val()
													},
													function(data) {
														if (data == "error") {
															$("#ts")
																	.html(
																			"用户名和密码错误，请从新登陆");
															is_show();
														} else if (data == "admin") {
															window.location.href = "http://localhost:8080/MyBankSystem/admin.jsp";//管理员页面
														} else {
															window.location.href = "http://localhost:8080/yinhang/user.jsp";//用户页面

														}
													});

								}
							}
						});
		window.onload = function() {
			$(".connect p").eq(0).animate({
				"left" : "0%"
			}, 600);
			$(".connect p").eq(1).animate({
				"left" : "0%"
			}, 400);
		}
		function is_hide() {
			$(".alert").animate({
				"top" : "-40%"
			}, 300)
		}
		function is_show() {
			$(".alert").show().animate({
				"top" : "45%"
			}, 300)
		}
	</script>
</body>

</html>