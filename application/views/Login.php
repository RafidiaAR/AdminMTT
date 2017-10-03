<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Jual Beli MTT</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="<?php echo base_url(); ?>assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="<?php echo base_url(); ?>assets/js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="<?php echo base_url(); ?>assets/css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='//fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
</head>
<body>	
<div class="login-page">
    <div class="login-main">  	
    	 <div class="login-head">
				<h1>Login Jual Beli MTT</h1>
			</div>


			<div class="login-block">

			
			<?php if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
       		 } ?>
				<form action="<?php echo base_url(); ?>index.php/Auth/Login" method="post" enctype="multipart/form-data">
					<input type="text" name="email" placeholder="Enter your email or your username here" required="">


					<input type="password" name="password" class="lock" placeholder="Enter your password here">
					<div class="forgot-top-grids">
						<!-- <div class="forgot">
							<a href="#">Forgot password?</a>
						</div> -->
						<div class="clearfix"> </div>
					</div>
					<input type="submit" name="submit" value="Login">	
					<h3>Bukan Merchant, dan ingin menjadi merchant di Jual Beli MTT?<a href="#signup"> <br>Sign up now</a></h3>				
					<!-- <h2>or login with</h2>
					<div class="login-icons">
						<ul>
							<li><a href="#" class="google"><i class="fa fa-google-plus"></i></a></li>						
						</ul>
					</div> -->
				</form>
				
			</div>
      </div>
</div>
<!--inner block end here-->
<!--copy rights start here-->
<div class="copyrights">
   <p>© 2017 JualBeli MTT. All Rights Reserved | Design by  <a href="http://mtt.or.id/" target="_blank">MTT Digital</a> </p>
</div> 
<!--COPY rights end here-->

<!--scrolling js-->
		<script src="<?php echo base_url(); ?>assets/js/jquery.nicescroll.js"></script>
		<script src="<?php echo base_url(); ?>assets/js/scripts.js"></script>
		<!--//scrolling js-->
<script src="<?php echo base_url(); ?>assets/js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>


                      
						
