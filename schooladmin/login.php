<?php if(!isset($Translation)){ @header('Location: index.php?signIn=1'); exit; } ?>
<?php include_once("$currDir/header.php"); ?>

<body style="background-image: linear-gradient(to right, darkblue , lightblue);"></body>

<div class="row" >
	<p style="font-size: 85px;color: white;">School Management</p>
	<p style="font-size: 85px;color: white;">System</p>
	<div class="col-sm-6 col-lg-8" id="login_splash">
		<!-- customized splash content here -->
	</div>
	<div class="col-sm-6 col-lg-4">
		<div class="panel panel-success">

			<div class="panel-heading">
				<h1 class="panel-title" style="text-align: center;">LOGIN INTO YOUR ACCOUNT</h1>
			</div>

			<div class="panel-body">
				<form method="post" action="index.php">
					<div class="form-group">
						<label class="control-label" for="username">Username</label>
						<input class="form-control" name="username" id="username" type="text" placeholder="Enter Username" required>
					</div>
					<div class="form-group">
						<label class="control-label" for="password">Password</label>
						<input class="form-control" name="password" id="password" type="password" placeholder="Enter Password" required>
						<span class="help-block"><?php echo $Translation['forgot password']; ?></span>
					</div>
					<div class="checkbox">
						<label class="control-label" for="rememberMe">
							<input type="checkbox" name="rememberMe" id="rememberMe" value="1">
							<span>Remeber me</span>
						</label>
					</div>

					<div class="row">
						<div class="col-sm-offset-3 col-sm-6">
							<button name="signIn" type="submit" id="submit" value="signIn" class="btn btn-primary btn-lg btn-block">Log In</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>



<script>document.getElementById('username').focus();</script>
<?php include_once("$currDir/footer.php"); ?>

<div style="bottom: 0;background-color: black;color: white;text-align: center;padding: 5px">
	<p>Developed By: Sarvesh Khandelwal | Devang Dubey | Ronit Fozdar</p>
	<p>Thakur College of Engineering and Technology</p>
</div>