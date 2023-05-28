<!DOCTYPE html>
<html>

<head>
<title>Error 500</title>
</head>

<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>500 Error Page</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Examples</a></li>
				<li class="is_active">500 error</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">

			<div class="error-page">
				<h2 class="headline text-red">500</h2>

				<div class="error-content">
					<h3>
						<i class="fa fa-warning text-red"></i> Oops! Something went wrong.
					</h3>

					<p>
						We will work on fixing that right away. Meanwhile, you may <a href="/home">return to dashboard</a> or try using the
						search form.
					</p>

					<form class="search-form">
						<div class="input-group">
							<input type="text" name="search" class="form-control"
								placeholder="Search" />

							<div class="input-group-btn">
								<button type="submit" name="submit"
									class="btn btn-danger btn-flat">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
						<!-- /.input-group -->
					</form>
				</div>
			</div>
			<!-- /.error-page -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.js"></script>
	<!-- SlimScroll -->
	<script src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/resources/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath}/resources/js/demo.js"></script>
	<!-- Page scripts -->
</body>
</html>
