<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="java.rmi.RemoteException" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Meeting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" type="text/css" media="screen"
          href="https://cdn.bootcss.com/ionicons/2.0.1/css/ionicons.min.css">

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css">

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="js/respond.min.js"></script>
    <![endif]-->

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-table.min.css">
    <link rel="stylesheet" href="css/button_style.css">
    <link rel="stylesheet" href="css/a_style.css">
    <link rel="stylesheet" href="css/bootstrapValidator.css">
    <script src="js/jquery.min.js"></script>

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script src="js/bootstrap.min.js"></script>
    <script src="js/MyResver.js"></script>
    <script src="js/sweet-alert.js"></script>
    <link rel="stylesheet" href="css/sweet-alert.css">
    <style type="text/css">

        .table > tbody > tr > td {
            vertical-align: middle !important;
            padding: 3px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: 1px solid #ddd
        }
    </style>

</head>
<body>


<%!
    JSONObject jsonObject;
    String name="";
    String level="";

%>
<%
    Cookie[] cookies=request.getCookies();
    if (cookies!=null){
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("mes")){
//                JSONObject jsonObject= JSONObject.fromObject(cookie.getValue());
                JSONObject jsonObject= JSONObject.fromObject(URLDecoder.decode(cookie.getValue(),"utf-8"));
                name= URLDecoder.decode(jsonObject.getString("name"),"UTF-8");
                System.out.println("nameok"+jsonObject.toString());
                level=jsonObject.getString("level");
            }
        }
    }
%>


<div id="fh5co-page">
    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

        <h1 id="fh5co-logo"><a href="counter.jsp"><img src="images/logo3.png"
                                                       alt="Free HTML5 Bootstrap Website Template"></a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li><a href="counter.jsp">个人中心</a></li>
                <li id="one"><a href="employee.html">人员管理</a></li>
                <li id="two"><a href="booking.html">会议预定</a></li>
            </ul>
        </nav>

        <div class="fh5co-footer">
            <p><small>&copy; 2017.06-07</span> <span>Designed by group24 </span> <span>Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></span></small></p>

            <ul>
                <li><a href="#"><i class="icon-facebook"></i></a></li>
                <li><a href="#"><i class="icon-twitter"></i></a></li>
                <li><a href="#"><i class="icon-instagram"></i></a></li>
                <li><a href="#"><i class="icon-linkedin"></i></a></li>
            </ul>
        </div>

    </aside>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        var lev=<%=level%>;
        if(lev=="2"){
        }
        else{
            $('#one').hide();
            $('#two').hide();
        }
    </script>




    <div class="container" style="padding-left: 215px">
        <div class="panel-body" style="padding-bottom:0px;padding-left: 0px;padding-right: 0px">
            <div class="panel panel-default">
                <div style="text-align:center;font-weight:bold;font-size: larger" class="panel-heading">
                    <a>我预定的会议</a>
                </div>
                <div class="panel-collapse collapse in">
                    <div class="panel-body">
                        <form id="formSearch" class="form-horizontal">
                            <table id="tableResver"
                                   class="table table-striped"
                                   data-toggle="table"
                                   data-show-columns="true"
                                   data-search="true"
                                   data-show-refresh="true"
                                   data-show-toggle="true"
                                   data-pagination="true"
                                   data-page-size="10"
                                   data-cache="false">
                                <thead>
                                <tr>
                                    <th data-field="meetingName" data-formatter="idFormatter">会议名称</th>
                                    <th data-field="meetingroomname">会议室名称</th>
                                    <th data-field="starttime">会议开始时间</th>
                                    <th data-field="endtime">会议结束时间</th>
                                    <th data-field="status">状态</th>
                                    <th data-visible="false" data-field="meetingId">id</th>
                                    <th data-visible="false" data-field="peopleNum">num</th>
                                    <th data-visible="false" data-field="meetingNotes">notes</th>
                                    <th data-visible="false" data-field="data">notes</th>
                                    <th data-events="operateEvent" class="col-xs-2" data-field="operation"
                                        data-formatter="operateFormatter">操作
                                    </th>
                                </tr>
                                </thead>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        会议信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="defaultForm">
                        <div class="form-group">
                            <label control-label>会议名称</label>
                            <div class="">
                                <input type="text" class=" form-control" id="meetingName_modal" name="meetingName_modal"
                                       disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label">预计参加人数</label>
                            <div class="">
                                <input type="text" class="form-control" id="peopleNum_modal" name="peopleNum_modal"
                                       disabled/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class=" control-label">预计开始时间</label>
                            <div class="">
                                <input type="text" class="form-control" id="starttime_modal" name="starttime_modal"
                                       disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label">预计结束时间</label>
                            <div class="">
                                <input type="text" class="form-control" id="endtime_modal" name="endtime_modal"
                                       disabled/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class=" control-label">会议说明</label>
                            <div class="">
                            <textarea rows="3" type="password" class="form-control" id="meetingNotes_modal"
                                      name="meetingNotes_modal" disabled></textarea>
                            </div>
                        </div>
                        <label class=" control-label">参会人员</label>

                        <table id="table"
                               class="table table-striped"
                               data-toggle="table"
                               data-url="data/data1.json"
                               data-show-columns="true"
                               data-search="true"
                               data-show-refresh="true"
                               data-show-toggle="true"
                               data-pagination="true"
                               data-page-size="5"
                               data-cache="false">
                            <thead>
                            <tr>
                                <th data-field="name" data-formatter="idFormatter">姓名</th>
                                <th data-field="telephone">联系电话</th>
                                <th data-field="email">电子邮箱</th>
                            </tr>
                            </thead>
                        </table>
                        <div class="form-group">
                            <label class=" control-label">撤销理由</label>
                            <div class="">
                            <textarea rows="3" type="password" class="form-control" id="concel_modal"
                                      name="concel_modal" placeholder="必填"></textarea>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button id="concelbtn" type="button" class="nooutline otherstyle btn btn-default" data-dismiss="modal">撤销会议
                    </button>
                    <button type="button" class="nooutline btn btn-default" data-dismiss="modal">返回
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>




    <div class="row work-pagination animate-box" data-animate-effect="fadeInLeft">
        <div class="col-md-8 col-md-offset-2 col-sm-12 col-sm-offset-0">

            <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                <a href="counter.jsp"><i class="icon ion-arrow-left-c"></i> <span>Previous </span></a>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                <a href="#"><i class="icon ion-ionic"></i></a>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-4 text-center">
                <a href="#"><span>Next Project</span> <i class="icon ion-arrow-right-c"></i></a>
            </div>
        </div>
    </div>



</div>

<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>
<!-- Carousel -->
<script src="js/owl.carousel.min.js"></script>
<!-- Stellar -->
<script src="js/jquery.stellar.min.js"></script>
<!-- Waypoints -->
<script src="js/jquery.waypoints.min.js"></script>
<!-- Counters -->
<script src="js/jquery.countTo.js"></script>


<!-- MAIN JS -->
<script src="js/main.js"></script>

<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-export.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
</body>
</html>
