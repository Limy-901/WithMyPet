<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html>

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Pooch Care an Animals Category Bootstrap Responsive Template | Home </title>
   <!-- google fonts -->  
   <link href="//fonts.googleapis.com/css2?family=Jost:wght@300;400;600&display=swap" rel="stylesheet">
   <!-- google fonts --> 
  <!-- Template CSS -->
  <link rel="stylesheet" href="../assets/css/login.css">
  <!-- Template CSS -->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

   <style>
   
        form {
           margin-top: 10px;
        }
   </style>
<body>
  <!--header-->
<header id="site-header" class="fixed-top">
  <div class="container">
      <nav class="navbar navbar-expand-lg stroke">
          <h1><a class="navbar-brand" href="index.html">
               Pooch Care
          </a></h1>
          <!-- if logo is image enable this   
      <a class="navbar-brand" href="#index.html">
          <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
      </a> -->
          <button class="navbar-toggler  collapsed bg-gradient" type="button" data-toggle="collapse"
              data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false"
              aria-label="Toggle navigation">
              <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
              <span class="navbar-toggler-icon fa icon-close fa-times"></span>
              </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav ml-auto">
                  <li class="nav-item active">
                      <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="about.html">About</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="services.html">Services</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="gallery.html">Gallery</a>
                  </li>
                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Blog<span class="fa fa-angle-down"></span>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown1">
                          <a class="dropdown-item" href="blog.html">Blog Posts</a>
                          <a class="dropdown-item" href="blog-single.html">Blog single</a>
                     <a class="dropdown-item" href="landing-single.html">Landing Page</a>
                      </div>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="login.do">Login</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="agree.do">Signup</a>
                  </li>
              </ul>
          </div>
          <!-- toggle switch for light and dark theme -->
          <div class="mobile-position">
              <nav class="navigation">
                  <div class="theme-switch-wrapper">
                      <label class="theme-switch" for="checkbox">
                          <input type="checkbox" id="checkbox">
                          <div class="mode-container">
                              <i class="gg-sun"></i>
                              <i class="gg-moon"></i>
                          </div>
                      </label>
                  </div>
              </nav>
          </div>
          <!-- //toggle switch for light and dark theme -->
      </nav>
  </div>
  
  
</header>

&nbsp;



  <section class="w3l-stats py-5" id="follow-stats">
    <div class="gallery-inner container py-lg-0 py-3">
      <div class="row stats-con pb-lg-3">
        <div class="col-lg-3 col-6 stats_info counter_grid">
          <div class="testi-des">
             <div class="test-img">
                <img src="../assets/images/f1.jpg" class="img-fluid" alt="client-img" style="width: 130px;">
             </div>
          </div>
          <h4>내 프로필</h4>
        </div>
        <div id="my_post" class="col-lg-3 col-6 stats_info counter_grid1" button type="button" onclick="location.href =  '/mypost.do';">
          <p class="counter">80</p>
          <h4>게시물</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid mt-lg-0 mt-5" button type="button" onclick="location.href =  '/follower.do';"> 
          <p class="counter">812</p>
          <h4>팔로우</h4>
        </div>
        <div class="col-lg-3 col-6 stats_info counter_grid2 mt-lg-0 mt-5">
          <p class="counter">90</p>
          <h4>팔로워</h4>
        </div>
      </div>
    </div>
  </section>
<br><br>
<section class="w3l-team-main">
 <center>
	<div style="float:left; margin-left:360px;">
		<div class="column position-relative">
			 <img src="<c:url value="/img/${mpvo.pet_fname}"/>" class="img-fluid img-thumbnail"/></a>
            </div>
            <div class="column">
              
              <br>
               
              <h3 class="name-pos"><a href="#url">${login.member_name}</a></h3>
              <p>
            <button onclick="location.href='mypagepetupdate.do'"class="btn btn-primary mt-4">강아지정보수정</button >
            <button onclick="location.href='messge.do'"class="btn btn-primary mt-4">메세지</button >
            
          </p>
          
          <br>
              <div class="social">
                <div class="social-left">
                  <a href="#facebook" class="facebook"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                  <a href="#twitter" class="twitter"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                  <a href="#linkedin"><span class="fa fa-linkedin" aria-hidden="true"></span></a>
               
                </div>
              </div>
               </center>
            </div>
          </div>
</section>

         <br><br><br> 
     <div style="width:400px; float:right; margin-right:440px; margin-top:-40px">
      <center>
         <h1>회원정보 수정</h1>        
         <br>
    <form action="mypageupdate.do" method="post">
      <div class="text">
          <h1>${login.member_email}</h1>
          <br><br>
          <input type="text" class="form-control" name="member_password" id="w3lName" placeholder="password 변경" required="">
          <br><br>
          <input type="text" class="form-control" name="member_name" id="w3lName" placeholder="name 변경" required="">
          <br><br>
          <input type="text" class="form-control" name="member_address" id="w3lName" placeholder="adress 변경" required="">
          <br>
      </div>
       <p>
  	<button type="submit" class="btn btn-primary mt-4">정보수정하기</button >
  	</p>
  </form>
      </center>
 </div>

</body>
</html>