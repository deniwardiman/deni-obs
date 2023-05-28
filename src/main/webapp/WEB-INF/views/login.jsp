<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Login</title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminLTE.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/iCheck/square/blue.css">
		<link rel="icon" href="${pageContext.request.contextPath}/resources/images/default-profiles.png">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<div class="login-logo">
				<a href="#"><b>Login</b>Page</a>
			</div>
			<!-- /.login-logo -->
			<div class="login-box-body">
				<p class="login-box-msg">Enter the System</p>
                                
                                
				<c:if test="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION != null}">
					<div class="alert alert-danger">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION}</div>
				</c:if>
				<c:if test="${param.error != null}">
					<div class="alert alert-danger">Invalid User Name / Password</div>
				</c:if>

				<c:if test="${param.success != null}">
					<div class="alert alert-success">You have been succesfuly logged out, Please Relogin again</div>
				</c:if>

				<c:if test="${param.updated != null}">
					<div class="alert alert-success">Please Relogin again</div>
				</c:if>
	
				<form id="formLogin" action="${pageContext.request.contextPath}/login" method="post" autocomplete="off">
					<div class="form-group has-feedback">
						<input id="username" name="username" type="email" class="form-control" placeholder="Email" required>
						<span class="fa fa-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input id="password" name="password" type="password" class="form-control" placeholder="Password" required autocomplete="off">
						<span class="fa fa-lock form-control-feedback"></span>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<div class="row">
						<%--<div class="col-xs-8">--%>
							<%--<div class="checkbox icheck">--%>
								<%--<label> <input type="checkbox"> Remember Me--%>
								<%--</label>--%>
							<%--</div>--%>
						<%--</div>--%>
						<!-- /.col -->
						<div class="col-xs-4">
							<button type="submit" class="btn btn-primary btn-block btn-flat">Sign
								In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
			</div>
			<!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->

		<!-- jQuery 2.2.3 -->
		<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
		<!-- Bootstrap 3.3.6 -->
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<!-- iCheck -->
		<script src="${pageContext.request.contextPath}/resources/js/icheck.min.js"></script>
		<script type="text/javascript">
            $(function() {
                $('input').iCheck({
                    checkboxClass : 'icheckbox_square-blue',
                    radioClass : 'iradio_square-blue',
                    increaseArea : '20%' // optional
                });
            });

            function setTimeZoneInCookie() {
                var _myDate = new Date();
                var _offset = _myDate.getTimezoneOffset();
                document.cookie = "TIMEZONE_COOKIE=" + _offset; //Cookie name with value
            }

            setTimeZoneInCookie();
		</script>
	</body>
</html>
