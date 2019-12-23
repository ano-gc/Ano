<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	
    <title>房屋租赁中介管理信息系统</title>

    <!-- Bootstrap core CSS -->
    
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <script src="assets/js/chart-master/Chart.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript">
	function changePage(pageNum){
		//1 将页码的值放入对应表单隐藏域中
			$("#currentPageInput").val(pageNum);
		//2 提交表单
				$("#pageform").submit();
	};
	
	function changePageSize(pageSize){
			//1 将页码的值放入对应表单隐藏域中
			$("#pageSizeInput").val(pageSize);
		//2 提交表单
			$("#pageform").submit();
	};
	function changeCity(){
		$('#districtname').empty();
		$('#districtname').append($("<option value='' >-请选择-</option>"));
		var str=document.getElementById("cityname").value;
		$.post("${pageContext.request.contextPath}/BaseDictAction_district",{id : str},
				  function(data){
				   		//遍历
				//4 返回json数组对象,对其遍历
				   		$.each( data, function(i, json){
					// 每次遍历创建一个option对象
				   			var $option = $("<option value='"+json['id']+"' >"+json["districtname"]+"</option>"); 
							$('#districtname').append($option);
				   		});
				  },"json");
			
	};
	
	function loadSelecthall(){
		$('#type').append($("<option value='' >-请选择-</option>"));
		$.post("${pageContext.request.contextPath}/BaseDictAction_hall",
				  function(data){
				   		//遍历
				//4 返回json数组对象,对其遍历
				   		$.each( data, function(i, json){
					// 每次遍历创建一个option对象
				   			var $option = $("<option value='"+json['id']+"' >"+json["type"]+"</option>"); 
							$('#type').append($option);
				   		});
				  },"json");
	};
	function loadSelectcity(){
		if($('#cityname'))
		$('#cityname').append($("<option value='' >-请选择-</option>"));
		$('#districtname').append($("<option value='' >-请选择-</option>"));
		$.post("${pageContext.request.contextPath}/BaseDictAction_city",
				  function(data){
				   		//遍历
				//4 返回json数组对象,对其遍历
				   		$.each( data, function(i, json){
					// 每次遍历创建一个option对象
				   			var $option = $("<option value='"+json['id']+"' >"+json["cityname"]+"</option>"); 
							$('#cityname').append($option);
				   		});
				  },"json");
	};
	/*  function loadSelectdistrict(){
		
		
		$.post("${pageContext.request.contextPath}/BaseDictAction_district",
				  function(data){
				   		//遍历
				//4 返回json数组对象,对其遍历
				   		$.each( data, function(i, json){
					// 每次遍历创建一个option对象
				   			var $option = $("<option value='"+json['districtname']+"' >"+json["districtname"]+"</option>"); 
							$('#district').append($option);
				   		});
				  },"json");
	}; */
	$(document).ready(function(){
		loadSelecthall();
		loadSelectcity();
	/* 	loadSelectdistrict(); */
		});
    </script>
  </head>
 

  <body>
  <section id="container" >
      <!-- **********************************************************************************************************************************************************
   
      *********************************************************************************************************************************************************** -->
      <!--顶布局-->
      <header class="header black-bg" >
      		<!-- 顶部 -->
            <div class="sidebar-toggle-box">
                <div class="fa fa-bars tooltips" data-placement="right" data-original-title="菜单选项"></div>
            </div>
            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-tasks"></i>
                            <span class="badge bg-theme">4</span>
                        </a>
                    </li>
                    <li id="header_inbox_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-theme">5</span>
                        </a>
                    </li>
                   
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">退出登录</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
     		主菜单
      *********************************************************************************************************************************************************** -->
      <!--侧边栏-->
      <!--侧边栏-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- 侧边栏开始-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href=""><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
              	  <h5 class="centered" >${sessionScope.user['username']}</h5>
              	  	
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>房源信息</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="HouseinfoAction_list">查找房源</a></li>
                          <li><a  href="addhouse.jsp">我要发布</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>个人中心</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="calendar.html">我的消息</a></li>
                          <li><a  href="HouseinfoAction_mylist?username=${sessionScope.user['username'] }">我的发布</a></li>
                          <li><a  href="UserinfoAction_userinfo?id=${sessionScope.user['id'] }">个人信息</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>商家中心</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="">我的账户</a></li>
                         <!--  <li><a  href="">最新动态</a></li> -->
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>统计</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="chart.jsp">房源信息统计</a></li>
                      </ul>
                  </li> 

              </ul>
              <!-- 侧边栏-->
          </div>
      </aside>
      <!--侧边栏-->      
      <!-- **********************************************************************************************************************************************************
      		主界面
      *********************************************************************************************************************************************************** -->
      <!--主界面-->
      <section id="main-content">
          <section class="wrapper">
              <div class="row">
                  <div class="col-xs-12 main-chart">
					<div class="row">
						<div class="col-md-12 mb-5">
							<div class="panel panel-default">
							  <div class="panel-heading">
							    <h3 class="panel-title">房源信息</h3>
							  </div>
							  <div class="panel-body">
							  	<div class="group">
									<h4>标题： <s:property value="#houseinfo.title" /></h4>
								</div>
							  	<label>图片</label>
							    <p class="centered"> <img src="upload/${houseinfo.pic}" height="300" width="500"alt="..."></p>
							    
								<div class="group" >
									<h4>厅室： <s:property value="#houseinfo.hall.type" /></h4>
								</div>
								<div class="group" >
									<h3>价格： <s:property value="#houseinfo.rent" /></h3>
								</div>
								<div class="group" >
									<h4>详细描述： <s:property value="#houseinfo.content" /></h4>
								</div>
								<div class="group" >
									<h4>联系电话： <s:property value="#houseinfo.user.phone" /></h4>
								</div>
								<div class="group" >
									<h4>地区： <s:property value="#houseinfo.city.cityname" />/<s:property value="#houseinfo.district.districtname" /></h4>
								</div>
								<div class="group" >
									<h4>详细地址： <s:property value="#houseinfo.address" /></h4>
								</div>
								<input type="button" id="btn_add" class="btn btn-primary"  value="编辑">
							  </div>
							  
							  <div class="panel-footer">欢迎查询</div>
							  
							</div>
							
                   			<center>
                   			
                   			
                   			</center>
	            					
						</div>
					</div><!-- /row -->
                  </div>
              </div>
          </section>
      </section>
  </section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form id="edit" action="HouseinfoAction_edit" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="user.id" value="${houseinfo.user.id}"/>
            	<input type="hidden" name="id" value="${houseinfo.id }"/>
            	<%-- <input type="hidden" name="password" value="${ }"/>
            	<input type="hidden" name="username" value="${userinfo.username }"/> --%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增</h4>
                </div>
                <div class="modal-body">

                   <div class="row mb" >
						<div class="col-md-6">	
							<div class="form-group">	
								<label >标   题：</label> 
								<input name="title" type="text" class="form-control" placeholder="请输入标题" value="<s:property value="#houseinfo.title" />" />
							</div>	
							<div class="form-group">					
								<label >面   积：</label> 
								<input name="area" type="text" class="form-control" placeholder="请输入面积" value="<s:property value="#houseinfo.area" />" />						
							</div>	
							<div class="form-group">						
								<label >城   市：</label> 
								 <select id="cityname" name="city.id" onclick="changeCity()" class="selectpicker show-tick form-control">
								 </select>
							</div>	
							<div class="form-group">						
								<label >区   域：</label> 
								 <select id="districtname" name="district.id" class="selectpicker show-tick form-control">
								 </select>
							</div>	
							<div class="form-group">						
								<label >厅   室：</label> 
								 <select id="type" name="hall.id" class="selectpicker show-tick form-control" >
								 </select>
							</div>	
							
						</div>	
						<div class="col-md-6">
							<div class="form-group">						
								<label >价   格：</label> 
								<input name="rent" type="text" class="form-control" placeholder="请输入价格" value="<s:property value="#houseinfo.rent" />" />					
							</div>	
							<div class="form-group">						
								<label >地  址：</label> 
								<input name="address" type="text" class="form-control" placeholder="请输入详细地址"  value="<s:property value="#houseinfo.address" />"/>					
							</div>	
							<div class="form-group">						
								<label >详  情：</label> 
								<textarea class="form-control" rows="3" name="content" placeholder="请输入描述"  value="<s:property value="#houseinfo.content" />" ></textarea>
								<!-- <input name="content" type="text" class="form-control" placeholder="请输入描述" />	 -->				
							</div>						
							<div class="form-group">						
								<label for="inputfile">请上传图片</label> 
								<%-- <s:if test="headImg != null && user.headImg !='' ">
								    <img src="${basePath}/upload/<s:property value='user.headImg'/>" width="100" height="100"/>
								    <s:hidden name="user.headImg"/>
								</s:if> --%>
								<input type="file" name="photo"/>					
							</div>					
						</div>	
					</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                    <button type="submit" onclick="savedata()" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
                </div>
            </form>
            </div>
        </div>
    </div>
	<script type="text/javascript">
		//注册新增按钮的事件
	  	$("#btn_add").click(function () {
	       $("#myModalLabel").text("编辑房源信息");
	  	   $('#myModal').modal();
	  	});
	  	function savedata(){
			$("#edit").submit();
			self.location=document.referrer;
		};
	</script>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/jquery-1.8.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>
    <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="assets/js/sparkline-chart.js"></script>    
	<script src="assets/js/zabuto_calendar.js"></script>	
  </body>
</html>
