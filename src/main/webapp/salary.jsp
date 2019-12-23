<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>浆果</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/bootstrap-4.3.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <script src="assets/js/chart-master/Chart.js"></script>
    <script src="jquery/jquery-3.4.1.min.js"></script>
    <script src="bootstrap/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
    <!--引入Vue.js-->
    <script type="text/javascript" src="vue/vue.js"></script>
</head>

<body>
<section id="container">
    <!--顶布局-->
    <header class="header black-bg">
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
                    </a>
                </li>
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-envelope-o"></i>
                    </a>
                </li>
            </ul>
        </div>
    </header>
    <!--侧边栏-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- 侧边栏开始-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href=""><img src="img/ng-header.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">${sessionScope.AlwaysuserEntity['username']}</h5>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-desktop"></i>
                        <span>功能列表</span>
                    </a>
                    <ul class="sub">
                        <li><a href="HouseinfoAction_list">密码查询</a></li>
                        <li><a href="${pageContext.request.contextPath}/PasswordController">密码管理</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-cogs"></i>
                        <span>个人中心</span>
                    </a>
                    <ul class="sub">
                        <li><a href="calendar.html">我的消息</a></li>
                        <li><a href="HouseinfoAction_mylist?username=${sessionScope.user['username'] }">个人信息</a></li>
                        <li><a href="UserinfoAction_userinfo?id=${sessionScope.user['id'] }">其他》》》</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>帮助中心</span>
                    </a>
                    <ul class="sub">
                        <li><a href="">我的账户</a></li>
                        <!--  <li><a  href="">最新动态</a></li> -->
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>浆果</span>
                    </a>
                    <ul class="sub">
                        <li><a href="BaseDictAction_chart?id=1">浆果</a></li>
                    </ul>
                </li>

            </ul>
            <!-- 侧边栏-->
        </div>
    </aside>
    <!--侧边栏-->
    <!--主界面-->
    <section id="main-content">
        <section class="wrapper site-min-height">
            <div id="app">
                <div class="container">
                    <h1>薪资管理</h1>
                    <!--面板组件-->
                    <div class="panel panel-primary">
                        <!--面板标题区域-->
                        <div class="panel-heading">
                            <h3 class="panel-title">添加用户</h3>
                        </div>
                        <!--面板内容区域-->
                        <div class="panel-body form-inline">
                            <!--员工ID-->
                            <div class="form-group">
                                <label for="addID">员工ID</label>
                                <input v-model="addId" type="text" class="form-control" id="addID" placeholder="员工ID"/>
                            </div>
                            <!--员工名输入框-->
                            <div class="form-group">
                                <label for="addName">员工姓名</label>
                                <input v-model="addName" type="text" class="form-control" id="addName" placeholder="员工姓名"/>
                            </div>
                            <div class="form-group">
                                <label for="addSalary">薪资</label>
                                <input v-model="addSalary" type="number" class="form-control" id="addSalary" placeholder="4000"/>
                            </div>
                            <button type="submit" class="btn btn-primary" @click="addEmpFun">添加</button>
                            <!--搜索框-->
                            <div class="form-group pull-right">
                                <input v-model="searchValue" type="text" class="form-control" id="searchInput" placeholder="搜索"/>
                            </div>
                        </div>
                    </div>
                    <!--定义表格-->
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th style="vertical-align: middle !important;text-align: center;">序号</th>
                            <th style="vertical-align: middle !important;text-align: center;">期间</th>
                            <th style="vertical-align: middle !important;text-align: center;">工资单名称</th>
                            <th style="vertical-align: middle !important;text-align: center;">应发薪资</th>
                            <th style="vertical-align: middle !important;text-align: center;">社保公积金</th>
                            <th style="vertical-align: middle !important;text-align: center;">扣个税</th>
                            <th style="vertical-align: middle !important;text-align: center;">实发薪资</th>
                            <th style="vertical-align: middle !important;text-align: center;">详细信息</th>
                            <th style="vertical-align: middle !important;text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <!--扫描-->
                        <tr v-for="(item,index) of searchEmpFun(searchValue)" :key="index">
                            <td style="vertical-align: middle !important;text-align: center;">{{item.number}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.time}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.salaryname}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.payable}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.socialsecurity}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.tax}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.actualsalary}}</td>
                            <td style="vertical-align: middle !important;text-align: center;">{{item.details}}</td>
                            <td>
                                <button @click="updateEmpFun(index)" class="btn btn-success" data-toggle="modal" data-target="#myModal"><i class=" fa fa-edit"></i></button>
                                <button @click="deleteEmpFun(index)" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

            </div>

        </section>
    </section>
<%--    <!--底端-->--%>
<%--    <footer class="site-footer">--%>
<%--        <div class="text-center">--%>
<%--            <a>欢迎继续访问！</a>--%>
<%--            <a href="first.jsp#" class="go-top">--%>
<%--                <i class="fa fa-angle-up"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    </footer>--%>
    <!--底端-->
</section>
<!--弹出框-->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <!--员工ID-->
                <div class="form-group">
                    <label for="updateId" class="col-sm-2 control-label">员工ID</label>
                    <div class="col-sm-10">
                        <input v-model="updateEmpObj.id" type="text" class="form-control" id="updateId" readonly>
                    </div>
                </div>
                <!--员工姓名-->
                <div class="form-group">
                    <label for="updateName" class="col-sm-2 control-label">员工姓名</label>
                    <div class="col-sm-10">
                        <input v-model="updateEmpObj.name" type="text" class="form-control" id="updateName">
                    </div>
                </div>
                <!--员工薪资-->
                <div class="form-group">
                    <label for="updateSalary" class="col-sm-2 control-label">员工薪资</label>
                    <div class="col-sm-10">
                        <input v-model="updateEmpObj.salary" type="number" class="form-control" id="updateSalary">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">保存修改</button>
            </div>
        </div>
    </div>
</div>
<script>
    //创建vue实例对象
    new Vue({
//挂载点
        el: "#app",
//model数据
        data: {
//三个属性进行双向绑定
            number: "",
            time: "",
            salaryname: "",
            payable: "",
            socialsecurity: "",
            tax: "",
            actualsalary: "",
            details: "",
//更新对象
            updateEmpObj: {
                number: "",
                time: "",
                salaryname: "",
                payable: "",
                socialsecurity: "",
                tax: "",
                actualsalary: "",
                details: ""
            },
//定义搜索绑定值
            searchValue: "",
//原始数据
            empDataArray: [{
                number: "01",
                time: "2019M11",
                salaryname: "家电职能薪资组2019M11",
                payable: "5410.00",
                socialsecurity: "472.60",
                tax: "0.00",
                actualsalary: "4920.29",
                details: ""
            },
                {
                    number: "02",
                    time: "2019M10",
                    salaryname: "家电职能薪资组2019M10",
                    payable: "6700.00",
                    socialsecurity: "472.60",
                    tax: "6.14",
                    actualsalary: "6147.22",
                    details: ""
                },
                {
                    number: "03",
                    time: "2019M09",
                    salaryname: "家电职能薪资组2019M09",
                    payable: "6680.00",
                    socialsecurity: "472.60",
                    tax: "21.23",
                    actualsalary: "6125.67",
                    details: ""
                },
                {
                    number: "04",
                    time: "2019M08",
                    salaryname: "家电职能薪资组2019M08",
                    payable: "7380.00",
                    socialsecurity: "472.60",
                    tax: "48.22",
                    actualsalary: "6818.48",
                    details: ""
                },
                {
                    number: "05",
                    time: "2019M07",
                    salaryname: "家电职能薪资组2019M07",
                    payable: "7400.00",
                    socialsecurity: "472.60",
                    tax: "48.82",
                    actualsalary: "6848.94",
                    details: ""
                }
            ]
        },
//函数集合
        methods: {
//点击添加按钮
//             addEmpFun() {
//                 var addId = this.addId;
//                 var addName = this.addName;
//                 var addSalary = this.addSalary;
//                 if (addId == "" || addName == "" || addSalary == "") {
//                     alert("员工信息不能为空");
//                 } else {
//                     var addEmp = {
//                         id: addId,
//                         name: addName,
//                         salary: addSalary,
//                         createtime: new Date().toLocaleDateString()
//                     }
// //新数据添加到数组中
//                     this.empDataArray.push(addEmp);
//                 }
//             },
// //删除函数
//             deleteEmpFun(deleteIndex) {
//                 var tf = confirm("确定删除?");
//                 if (tf) {
//                     this.empDataArray.splice(deleteIndex, 1);
//                 }
//             },
// //更新函数
//             updateEmpFun(updateIndex) {
//                 this.updateEmpObj = this.empDataArray[updateIndex];
//             },
            searchEmpFun(sv) {
//我们创建数组用来保存查询的结果
                var newEmpDataArray = [];//如果查询到,则给它添加数据
                var empDataArray = this.empDataArray;//获取到原数组
                for (var i = 0; i < empDataArray.length; i++) {
                    if (empDataArray[i].number.indexOf(sv) != -1 || empDataArray[i].time.indexOf(sv) != -1 || empDataArray[i].salaryname.indexOf(sv) != -1 || empDataArray[i].payable.indexOf(sv) != -1) {
                        newEmpDataArray.push(empDataArray[i]);
                    }
                }
                return newEmpDataArray;
            }
        }
    });
</script>



<script src="assets/js/jquery.dcjqaccordion.2.7.js" class="include" type="text/javascript" ></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<script src="assets/js/common-scripts.js"></script>
<script src="assets/js/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<script src="assets/js/gritter-conf.js" type="text/javascript"></script>

<script src="assets/js/sparkline-chart.js"></script>
<script src="assets/js/zabuto_calendar.js"></script>
</body>
</html>
