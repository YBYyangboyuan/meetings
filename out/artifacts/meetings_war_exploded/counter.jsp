<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="java.rmi.RemoteException" %>

<html>
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <title>Meeting</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css">
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
    <link rel="apple-touch-icon" sizes="76x76" href="images/apple-icon.png">
    <link rel="icon" type="image/png" href="images/favicon.png">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <script src="js/jquery.min.js"></script>






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

        <h1 id="fh5co-logo"><a href="counter.jsp"><img src="images/logo3.png" alt="Free HTML5 Bootstrap Website Template"></a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li class="fh5co-active"><a href="counter.jsp">个人中心</a></li>
                <li id="one"><a href="employee.html">人员管理</a></li>
                <li id="two"><a href="booking.html">会议预定</a></li>
                <li><a href="index.jsp?action=Logout">注销账号</a></li>
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

    <div id="fh5co-main">


        <div class="fh5co-narrow-content">
            <h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">个人中心</h2>
            <div class="row animate-box" data-animate-effect="fadeInLeft">
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="NewNoti.jsp">
                        <img src="images/work_1.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">最新通知</h3>
                        <p>give you last info</p>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="MyResver.jsp">
                        <img src="images/work_2.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">我的预定</h3>
                        <p>check where </p>
                    </a>
                </div>
                <div class="clearfix visible-sm-block"></div>
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="MyMeeting.jsp">
                        <img src="images/work_3.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">我的会议</h3>
                        <p>choose what you like</p>
                    </a>
                </div>
                <div class="clearfix visible-md-block"></div>


            </div>
        </div>



        <%
            HelloClient hc = new HelloClient();
            hc.gettest();
            Itest it=hc.gettest();

//            Integer hitsCount =
//                    (Integer)application.getAttribute("hitCounter");
            Integer hitsCount = it.addvisit();
//            if( hitsCount ==null || hitsCount == 0 ){
//       /* 第一次访问 */
//                out.println("欢迎访问菜鸟教程!");
//                hitsCount = 0;
//            }else{
//       /* 返回访问值 */
//                out.println("欢迎再次访问菜鸟教程!");
////                hitsCount += 1;
//
//
//
//            }
            application.setAttribute("hitCounter", hitsCount);

        %>

        <div class="fh5co-counters" style="background-image: url(images/hero.jpg);" data-stellar-background-ratio="0.5" id="counter-animate">
            <div class="fh5co-narrow-content animate-box">
                <div class="row" >
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to="101" data-speed="2000" data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">Design Times</span>
                    </div>
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to=<%= hitsCount%> data-speed="2000" data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label"> view counter</span>
                    </div>
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to="27232" data-speed="2000" data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">Line of Codes</span>
                    </div>
                </div>
            </div>
        </div>

        <!--<div class="fh5co-cards">-->
        <!--<div class="fh5co-narrow-content">-->
        <!--<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">Press Release</h2>-->

        <!--<div class="fh5co-flex-wrap">-->
        <!--<div class="fh5co-card animate-box" data-animate-effect="fadeInLeft">-->
        <!--<h5>Expertise</h5>-->
        <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>-->
        <!--<p><a href="#" class="btn btn-md btn-primary">Learn More</a></p>-->
        <!--</div>-->
        <!--<div class="fh5co-card animate-box" data-animate-effect="fadeInLeft">-->
        <!--<h5>Explore</h5>-->
        <!--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. The Big Oxmox advised her not to do so, because there were thousands of bad Commas.</p>-->
        <!--<p><a href="#" class="btn btn-md btn-primary">Learn More</a></p>-->
        <!--</div>-->

        <!--</div>-->

        <!--</div>-->
        <!--</div>-->

        <!--<div class="fh5co-narrow-content">-->
        <!--<div class="row">-->
        <!--<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">-->
        <!--<h1 class="fh5co-heading-colored">We Design Beautiful &amp; Functional Website</h1>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="row">-->
        <!--<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">-->
        <!--<p class="fh5co-lead">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>-->
        <!--<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>-->
        <!--</div>-->
        <!--<div class="col-md-7 col-md-push-1">-->
        <!--<div class="row">-->
        <!--<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">-->
        <!--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>-->
        <!--</div>-->
        <!--<div class="col-md-6 animate-box" data-animate-effect="fadeInLeft">-->
        <!--<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->


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



</body>
</html>

