<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date, java.text.SimpleDateFormat" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	Date nowDay = new Date();
	SimpleDateFormat dateForm = new SimpleDateFormat("yyyy�� MM�� dd��, a hh:mm�� ����");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>:: ������ :: With My Pet</title>
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/logos/logo-yellow.png">
    <link rel="stylesheet" href="../assets/plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="../assets/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <link href="../assets/css/admin/style.css" rel="stylesheet">
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
	<style>
	canvas{
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>

<body>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    
    <div id="main-wrapper">
        <div class="nav-header" style="background-color:#FFD687;">
            <div class="brand-logo" style="display:flex; margin:auto;">
                <a href="#" style="display:flex; margin:auto;">
                    <span class="brand-title" style="display:flex; margin:auto; margin-bottom:10%;">
                        <img style="display:flex; margin:auto; width:80%;"src="../assets/images/logos/logo-grey.png" alt=""><br/><br/>
                    </span>
                </a>
            </div>
        </div>
        <div class="header" style="background-color:#FFD687; margin-bottom: -1%;">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <!-- �˻� -->
                <div class="header-left">
                    <div class="input-group icons" style="width:200%;">
                        <input id="mainSearchKeyword" type="text" class="form-control" placeholder="�˻�� �Է��ϼ���." aria-label="Search Dashboard">
                        <div class="drop-down animated flipInX d-md-none">
                           <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1">
                        	<a onclick="mainSearchCheck()"><i class="mdi mdi-magnify"></i></a>
                        </span>
                    </div>                    
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                    	<!-- �� ���Ǳ�  -->
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge badge-pill gradient-1">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="" style="font-family: 'Spoqa Han Sans Neo';">�� ���Ǳ�</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span style="font-family: 'Spoqa Han Sans Neo';"class="badge badge-pill gradient-1">3</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Saiful Islam</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Adam Smith</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Barak Obama</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="../assets/images/admin/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-heading">Hilari Clinton</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-timestamp">08 Hours ago</div>
                                                    <div style="font-family: 'Spoqa Han Sans Neo';"class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- Ȯ�� �ʿ� ���� -->
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2">5</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">Ȯ�λ���</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span class="badge badge-pill gradient-2">5</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">��å ����Ʈ ����</h6>
                                                    <span class="notification-text">Within next 5 days</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">��� ��Ȳ ����</h6>
                                                    <span class="notification-text">One hour ago</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <!-- ������ �̵� �׺� �� -->
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>����������</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="../">����ȭ��</a></li>
                                        <li><a href="../walk/list.do">��å</a></li>
                                        <li><a href="../product">����</a></li>
                                        <li><a href="../board/list.do">Ŀ�´�Ƽ</a></li>
                                        
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="nk-sidebar" style="background-color:#FFD687;">           
            <div class="nk-nav-scroll" style="background-color:#FFD687;">
                <ul class="metismenu" id="menu" style="background-color:#FFD687;">
                    <li class="nav-label"></li>
                    <li>
                        <a href="#" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text"></span>
                        </a>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt user-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">ȸ ��</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="memberList.do"style="font-family: 'Spoqa Han Sans Neo';">ȸ�� ���</a></li>
                        	<li><a href="memberMessage.do"style="font-family: 'Spoqa Han Sans Neo';">ȸ������ �޼��� ����</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt user-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">�� å</span>
                        </a>
                        <ul aria-expanded="false">
                        	<li><a href="nextWalk.do"style="font-family: 'Spoqa Han Sans Neo';">��å ���� ��Ȳ</a></li>
                        	<li><a href="previousWalk.do"style="font-family: 'Spoqa Han Sans Neo';">���� ��å ��Ȳ</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm" style="z-index:999;">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">�� ǰ</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="registerProduct.do"style="font-family: 'Spoqa Han Sans Neo';">��ǰ ���</a></li>
                            <li><a href="productQ.do"style="font-family: 'Spoqa Han Sans Neo';">���� �亯</a></li>
                            <li><a href="productA.do"style="font-family: 'Spoqa Han Sans Neo';">���� ���� ����</a></li>
                            <li><a href="orderStatus.do"style="font-family: 'Spoqa Han Sans Neo';">�ֹ� ��Ȳ</a></li>
                        </ul>
                    </li>
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">�Խñ�</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="recentBoard.do"style="font-family: 'Spoqa Han Sans Neo';">�ֱ� �Խñ�</a></li>
                            <li><a href="reportedPost.do"style="font-family: 'Spoqa Han Sans Neo';">�Ű�� ���</a></li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="walkStatistic.do" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">��å ���</span>
                        </a>
                    </li>
                    <li>
                        <a href="salesStatistic.do" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">���� ���</span>
                        </a>
                    </li>
                    <li>
                        <a href="postNotice.do" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text"style="font-family: 'Spoqa Han Sans Neo';">�������� �ۼ�</span>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <!-- ���� -->
        <div class="content-body" style="background-color:white;">
            <div class="container-fluid mt-3">
            
                <h4 style="text-align:center; margin:auto;font-family: 'Spoqa Han Sans Neo';">���� ��Ȳ</h4>
                <p style="text-align:center; margin:auto;font-family: 'Spoqa Han Sans Neo';"><%=dateForm.format(nowDay)%></p><br/>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">�ű� ����</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">${indexData.newMember} ��</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-user"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">�� ���� ȸ��</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">${indexData.totalMember} ��</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">���� ����</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">${indexData.todayIncome} ��</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white"style="font-family: 'Spoqa Han Sans Neo';">��Ī ����</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white"style="font-family: 'Spoqa Han Sans Neo';">${indexData.matchPer}</h2>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>
                
                <div class="row">
                        <div class="col-lg-6 col-md-6">
                        	<!-- ��å&�Ǹ� ��� -->
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title"style="font-family: 'Spoqa Han Sans Neo';">��å & �Ǹ� ���</h4>
	                                <canvas id="lineChart" width="500" height="250"></canvas>
	                            </div>
	                        </div>
                        </div>    
<script>
	/* �ֱ� ������ ��¥ 
	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = currentDay.getMonth();
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();*/
	var thisWeek = new Array();
	var weekWalk = new Array();
	var weekSale = new Array();
	
	<c:forEach items="${indexData.allList.week}" var="item">
		thisWeek.push("${item}");
	</c:forEach>
	<c:forEach items="${indexData.allList.walk}" var="item">
		weekWalk.push("${item}");
	</c:forEach>
	<c:forEach items="${indexData.allList.sale}" var="item">
		weekSale.push("${item}");
	</c:forEach>
	
	/* ���� ��Ʈ ���� */
	var lineChart = document.getElementById('lineChart').getContext('2d');
	var barChart = new Chart(lineChart,{
		type:'line',
		data: {
			labels : thisWeek,
			fill: false,
			borderColor: "rgb(255 180 70)",
			datasets:[{
				label: '��å Ƚ��',
				data: weekWalk,
			}, {
				label: '�Ǹ� Ƚ��',
				fill: false,
				borderColor: "rgb(110 197 206)",
				data: weekSale,
			}]
		},
		options: {
			responsive: true,
			title: {
				display: true,
				text: '�ְ� ��å �Ǹ� ���'
			},
			tooltips: {
				mode: 'index',
				intersect: false,
			},
			hover: {
				mode: 'nearest',
				intersect: true
			},
			scales: {
				xAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: '��¥'
					}
				}],
				yAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: 'Ƚ��'
					}
				}]
			}
		}
	});
</script>
                        <!-- �Ǹ��� ���� -->
                        <div class="col-lg-6 col-md-6">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="card-title"style="font-family: 'Spoqa Han Sans Neo';">�α� �Ǹ� ����Ʈ</h4>
	                                <canvas id="doughnutChart" width="500" height="250"></canvas>
	                            </div>
	                        </div>
		                </div>
		            </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>
<script>
/*���� ��Ʈ*/
new Chart(document.getElementById("doughnutChart"), {
    type: 'doughnut',
    data: {
      labels: ["��ǰ1", "��ǰ2", "��ǰ3", "��ǰ4", "��ǰ5"],
      datasets: [{
          label: "Population (millions)",
          backgroundColor: ["#FFB446", "#FEE4B1","#AFD4DD","#6EC5CE","#999999"],
          data: [2478,5267,734,784,433]
        }]
    },
    options: {
      title: {
        display: true,
        text: '�ְ� �Ǹŷ� ���� ��'
      }
    }
});
</script> 
				<!-- �ֱ� ��ǰ�Ǹ� ����  -->
				<h4 style="text-align:center;margin:auto;font-family: 'Spoqa Han Sans Neo';">�ֱ� �Ǹ� ����</h4><br/>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="active-member">
                                    <div class="table-responsive">
                                        <table class="table table-xs mb-0">
                                            <thead>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <th>������</th>
                                                    <th>�� ǰ</th>
                                                    <th>�ּ���</th>
                                                    <th>�� ��</th>
                                                    <th>�������</th>
                                                    <th>�ֱ�Ȱ��</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/1.jpg" class=" rounded-circle mr-3" alt="">Sarah Smith</td>
                                                    <td>iPhone X</td>
                                                    <td>
                                                        <span>United States</span>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/2.jpg" class=" rounded-circle mr-3" alt="">Walter R.</td>
                                                    <td>Pixel 2</td>
                                                    <td><span>Canada</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">50 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/3.jpg" class=" rounded-circle mr-3" alt="">Andrew D.</td>
                                                    <td>OnePlus</td>
                                                    <td><span>Germany</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-warning" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/6.jpg" class=" rounded-circle mr-3" alt=""> Megan S.</td>
                                                    <td>Galaxy</td>
                                                    <td><span>Japan</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/4.jpg" class=" rounded-circle mr-3" alt=""> Doris R.</td>
                                                    <td>Moto Z2</td>
                                                    <td><span>England</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-success" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-success  mr-2"></i> Paid</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                                <tr style="font-family: 'Spoqa Han Sans Neo';">
                                                    <td><img src="../assets/images/admin/avatar/5.jpg" class=" rounded-circle mr-3" alt="">Elizabeth W.</td>
                                                    <td>Notebook Asus</td>
                                                    <td><span>China</span></td>
                                                    <td>
                                                        <div>
                                                            <div class="progress" style="height: 6px">
                                                                <div class="progress-bar bg-warning" style="width: 50%"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td><i class="fa fa-circle-o text-warning  mr-2"></i> Pending</td>
                                                    <td>
                                                        <span>Last Login</span>
                                                        <span class="m-0 pl-3">10 sec ago</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
               </div><br/><hr style="width:50%; margin:auto;"><br/><br/><br/>
                
                

                <h4 style="text-align:center; margin:auto; font-family: 'Spoqa Han Sans Neo';">�ű� ȸ��</h4><br/>
                <div class="row">
                
                <c:forEach items="${indexData.newMemList}" var="member">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="../assets/images/admin/users/8.jpg" class="rounded-circle" alt="">
                                    
                                    <h5 class="mt-3 mb-1"style="font-family: 'Spoqa Han Sans Neo';">${member.member_name}</h5>
                                    <p class="m-0"style="font-family: 'Spoqa Han Sans Neo';">${member.member_address}</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                
                </div><br/><br/><br/>
                
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    
    
<!-- footer-28 block -->
<section class="w3l-footer" style="background-color:black; display:absolute;">
  <footer class="footer-28">
    <div class="footer-bg-layer">
      <div class="container py-lg-3">
        <div class="row footer-top-28">
          <div class="col-lg-6 col-md-5 footer-list-28 mt-5">
            <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Contact information</h6>
            <ul style="padding:0;">
              <li>
                <p style="font-family: 'Spoqa Han Sans Neo';color:#999999;"><strong>Address</strong> : Seoul Mapo Baekbumro, South Korea</p>
                <p style="font-family: 'Spoqa Han Sans Neo';color:#999999;"><strong>Contact</strong> : <a style="color:#999999; text-decoration:none;" href="tel:+(12)234-11-24">Click Here</a></p>
              </li>
            </ul>
          </div>
          <div class="col-lg-6 col-md-7">
            <div class="row">
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Walk Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo'; padding:0;">
                  <li><a style="color:#999999; text-decoration:none;"href="about.html">Cha Ji Hyun</a></li>
                  <li><a style="color:#999999; text-decoration:none;"href="blog.html">Lim Yeon Ji</a></li>
                </ul>
              </div>
              <div class="col-sm-4 col-6 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Shopping Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo'; padding:0;">
                  <li><a style="color:#999999; text-decoration:none;"href="contact.html">Lee Ok Seok</a></li>
                  <li><a style="color:#999999; text-decoration:none;"href="#signup">Sung Jin Hee</a></li>
                </ul>
              </div>
              <div class="col-sm-4 footer-list-28 mt-5">
                <h6 class="footer-title-28" style="color:white;font-family: 'Spoqa Han Sans Neo';">Member Service</h6>
                <ul style="font-family: 'Spoqa Han Sans Neo'; padding:0;">
                  <li><a style="color:#999999; text-decoration:none;"href="#URL">Choi Woo Jae</a></li>
                  <li><a style="color:#999999; text-decoration:none;"href="#URL">Lee Su Jin</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </footer>
  </section>
    <!--**********************************
        Main wrapper end
    ***********************************-->
<script>
/* admin �˻� ��ȿ�� �˻� */
function mainSearchCheck(){
	var check = document.getElementById('mainSearchKeyword');
	if (check.value == '') alert("�˻�� �Է����ּ���.");
	mainSearchKeyword.focus();
}
</script>
    <!--**********************************
        Scripts
    
    ***********************************-->
    <script src="../assets/plugins/common/common.min.js"></script>
    <script src="../assets/js/admin/custom.min.js"></script>
    <script src="../assets/js/admin/settings.js"></script>
    <script src="../assets/js/admin/gleek.js"></script>
    <script src="../assets/js/admin/styleSwitcher.js"></script>
    <!-- Circle progress -->
    <script src="../assets/plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="../assets/plugins/d3v3/index.js"></script>
    <script src="../assets/plugins/topojson/topojson.min.js"></script>
    <script src="../assets/plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="../assets/plugins/raphael/raphael.min.js"></script>
    <script src="../assets/plugins/morris/morris.min.js"></script>
    <script src="../assets/js/admin/dashboard/dashboard-1.js"></script>

</body>

</html>