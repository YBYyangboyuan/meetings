<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="java.rmi.RemoteException" %>

<html>
<head>
    <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
    <title>meetings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />-->
    <!--<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />-->
    <!--<meta name="author" content="FreeHTML5.co" />-->


    <!--&lt;!&ndash; Facebook and Twitter integration &ndash;&gt;-->
    <!--<meta property="og:title" content=""/>-->
    <!--<meta property="og:image" content=""/>-->
    <!--<meta property="og:url" content=""/>-->
    <!--<meta property="og:site_name" content=""/>-->
    <!--<meta property="og:description" content=""/>-->
    <!--<meta name="twitter:title" content="" />-->
    <!--<meta name="twitter:image" content="" />-->
    <!--<meta name="twitter:url" content="" />-->
    <!--<meta name="twitter:card" content="" />-->

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!--<link rel="shortcut icon" href="favicon.ico">-->

    <!--<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>-->
    <!--<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>-->

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

</head>
<body>
<div id="fh5co-page">
    <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
    <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

        <h1 id="fh5co-logo"><a href="person.html"><img src="images/logo3.png" alt="Free HTML5 Bootstrap Website Template"></a></h1>
        <nav id="fh5co-main-menu" role="navigation">
            <ul>
                <li class="fh5co-active"><a href="person.html">个人中心</a></li>
                <li><a href="employee.html">人员管理</a></li>
                <li><a href="booking.html">会议预定</a></li>
            </ul>
        </nav>

        <div class="fh5co-footer">
            <p><small>&copy; 2016 Nitro Free HTML5. All Rights Reserved.</span> <span>Designed by <a href="http://freehtml5.co/" target="_blank">FreeHTML5.co</a> </span> <span>Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></span></small></p>
            <ul>
                <li><a href="#"><i class="icon-facebook"></i></a></li>
                <li><a href="#"><i class="icon-twitter"></i></a></li>
                <li><a href="#"><i class="icon-instagram"></i></a></li>
                <li><a href="#"><i class="icon-linkedin"></i></a></li>
            </ul>
        </div>

    </aside>

    <div id="fh5co-main">

        <div class="fh5co-narrow-content">
            <h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">个人中心</h2>
            <div class="row animate-box" data-animate-effect="fadeInLeft">
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="NewNoti.html">
                        <img src="images/work_1.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">最新通知</h3>
                        <p>give you last info</p>
                    </a>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="MyResver.html">
                        <img src="images/work_2.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">我的预定</h3>
                        <p>check where </p>
                    </a>
                </div>
                <div class="clearfix visible-sm-block"></div>
                <div class="col-md-4 col-sm-6 col-xs-6 col-xxs-12 work-item">
                    <a href="MyMeeting.html">
                        <img src="images/work_3.jpg" alt="Free HTML5 Website Template by FreeHTML5.co" class="img-responsive">
                        <h3 class="fh5co-work-title">我的会议</h3>
                        <p>choose what you like</p>
                    </a>
                </div>
                <div class="clearfix visible-md-block"></div>


            </div>
        </div>


        <!--<div class="fh5co-testimonial" >-->
        <!--<div class="fh5co-narrow-content">-->
        <!--<div class="owl-carousel-fullwidth animate-box" data-animate-effect="fadeInLeft">-->
        <!--<div class="item">-->
        <!--<figure>-->
        <!--<img src="images/testimonial_person2.jpg" alt="Free HTML5 Bootstrap Template">-->
        <!--</figure>-->
        <!--<p class="text-center quote">&ldquo;Design must be functional and functionality must be translated into visual aesthetics, without any reliance on gimmicks that have to be explained. &rdquo; <cite class="author">&mdash; Ferdinand A. Porsche</cite></p>-->
        <!--</div>-->
        <!--<div class="item">-->
        <!--<figure>-->
        <!--<img src="images/testimonial_person3.jpg" alt="Free HTML5 Bootstrap Template">-->
        <!--</figure>-->
        <!--<p class="text-center quote">&ldquo;Creativity is just connecting things. When you ask creative people how they did something, they feel a little guilty because they didn’t really do it, they just saw something. It seemed obvious to them after a while. &rdquo;<cite class="author">&mdash; Steve Jobs</cite></p>-->
        <!--</div>-->
        <!--<div class="item">-->
        <!--<figure>-->
        <!--<img src="images/testimonial_person4.jpg" alt="Free HTML5 Bootstrap Template">-->
        <!--</figure>-->
        <!--<p class="text-center quote">&ldquo;I think design would be better if designers were much more skeptical about its applications. If you believe in the potency of your craft, where you choose to dole it out is not something to take lightly. &rdquo;<cite class="author">&mdash; Frank Chimero</cite></p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->


        <!--<div class="fh5co-narrow-content">-->
        <!--<h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft">This Is What <span>We Love To Do</span></h2>-->
        <!--<div class="row">-->
        <!--<div class="col-md-6">-->
        <!--<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">-->
        <!--<div class="fh5co-icon">-->
        <!--<i class="icon-strategy"></i>-->
        <!--</div>-->
        <!--<div class="fh5co-text">-->
        <!--<h3>Strategy</h3>-->
        <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="col-md-6">-->
        <!--<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">-->
        <!--<div class="fh5co-icon">-->
        <!--<i class="icon-telescope"></i>-->
        <!--</div>-->
        <!--<div class="fh5co-text">-->
        <!--<h3>Explore</h3>-->
        <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->

        <!--<div class="col-md-6">-->
        <!--<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">-->
        <!--<div class="fh5co-icon">-->
        <!--<i class="icon-circle-compass"></i>-->
        <!--</div>-->
        <!--<div class="fh5co-text">-->
        <!--<h3>Direction</h3>-->
        <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->
        <!--<div class="col-md-6">-->
        <!--<div class="fh5co-feature animate-box" data-animate-effect="fadeInLeft">-->
        <!--<div class="fh5co-icon">-->
        <!--<i class="icon-tools-2"></i>-->
        <!--</div>-->
        <!--<div class="fh5co-text">-->
        <!--<h3>Expertise</h3>-->
        <!--<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>-->
        <!--</div>-->
        <!--</div>-->
        <!--</div>-->

        <!--</div>-->
        <!--</div>-->
        <%
            HelloClient hc = new HelloClient();
            Itest it=new Itest() {
                @Override
                public int addvisit() throws RemoteException {
                    return 0;
                }

                @Override
                public boolean regist(String name, String telephone, String email, String position, int departmentid, String username, String password) throws RemoteException {
                    return false;
                }

                @Override
                public boolean regist(String jsonString) throws RemoteException {
                    return false;
                }

                @Override
                public String login(String name, String password) throws RemoteException {
                    return null;
                }

                @Override
                public String login(String jsonString) throws RemoteException {
                    return null;
                }

                @Override
                public boolean refuse_regisiton(int EmployeeCopyid) throws RemoteException {
                    return false;
                }

                @Override
                public boolean recover_regisiton(int EmployeeCopyid) throws RemoteException {
                    return false;
                }

                @Override
                public boolean passregistion(int EmployeeCopyid) throws RemoteException {
                    return false;
                }

                @Override
                public String showregistall(int status) throws RemoteException {
                    return null;
                }

                @Override
                public String showpassedall() throws RemoteException {
                    return null;
                }

                @Override
                public boolean deletestaff(int staffid) throws RemoteException {
                    return false;
                }

                @Override
                public boolean deletestaffcopy(int staffid) throws RemoteException {
                    return false;
                }

                @Override
                public boolean delete_personal_book_meeting(int meetingid) throws RemoteException {
                    return false;
                }

                @Override
                public String searchstaffbyname(String staff_name) throws RemoteException {
                    return null;
                }

                @Override
                public String searchstaffbyusername(String staff_name) throws RemoteException {
                    return null;
                }

                @Override
                public String searchstaffbydepartment(int departmentid) throws RemoteException {
                    return null;
                }

                @Override
                public String searchstaffbydepartment() throws RemoteException {
                    return null;
                }

                @Override
                public String searchstaff(String jsonString) throws RemoteException {
                    return null;
                }

                @Override
                public String searchMeeting(String jsonString) throws RemoteException {
                    return null;
                }

                @Override
                public String searchMeeting(Map<String, Object> map) throws RemoteException {
                    return null;
                }

                @Override
                public String searchMeeting(String meeting_name, String meeting_notes, String book_name, int people_num, int meetingroom_id, int status, String start_time, String end_time) throws RemoteException {
                    return null;
                }

                @Override
                public void add_department(String departmentname) throws RemoteException {

                }

                @Override
                public boolean modify_department(int departmentid, String modifyname) throws RemoteException {
                    return false;
                }

                @Override
                public boolean modify_department(String jsonString) throws RemoteException {
                    return false;
                }

                @Override
                public boolean delect_department(int departmentid) throws RemoteException {
                    return false;
                }

                @Override
                public String show_department() throws RemoteException {
                    return null;
                }

                @Override
                public boolean add_meeting(String bookname, String meetingname, int meeting_num, String meeting_notes, int meetingroom_id, String startTime, String endTime, List<Integer> staffid) throws RemoteException {
                    return false;
                }

                @Override
                public boolean add_meeting(String jsonString) throws RemoteException {
                    return false;
                }

                @Override
                public boolean add_meeting_room(String meetingroom_name, int capacity, String room_numbler, String remark, String atate) throws RemoteException {
                    return false;
                }

                @Override
                public boolean add_meeting_room(String jString) throws RemoteException {
                    return false;
                }

                @Override
                public boolean delete_meeting_room(int meetingroom_id) throws RemoteException {
                    return false;
                }

                @Override
                public boolean modify_meeting_room(int meetingroomid, String meetingroom_name, int capacity, String room_numbler, String remark, String atate) throws RemoteException {
                    return false;
                }

                @Override
                public boolean modify_meeting_room(String jsonString) throws RemoteException {
                    return false;
                }

                @Override
                public String show_allmeetingroom() throws RemoteException {
                    return null;
                }

                @Override
                public String show_meetingroom(int meetingroomid) throws RemoteException {
                    return null;
                }

                @Override
                public String show_personal_meeting(int staffid) throws RemoteException {
                    return null;
                }

                @Override
                public String show_personal_book_meeting(int staffid, String username) throws RemoteException {
                    return null;
                }

                @Override
                public boolean checkusername(String username) throws RemoteException {
                    return false;
                }

                @Override
                public String search_meeting_room_by_name(String name) throws RemoteException {
                    return null;
                }

                @Override
                public String search_meeting_room_by_number(String number) throws RemoteException {
                    return null;
                }
            };
            hc.gettest();
            it = hc.gettest();

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
        <p>页面访问量为: <%= hitsCount%></p>

        <div class="fh5co-counters" style="background-image: url(images/hero.jpg);" data-stellar-background-ratio="0.5" id="counter-animate">
            <div class="fh5co-narrow-content animate-box">
                <div class="row" >
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to="4" data-speed="5000" data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label">Designer</span>
                    </div>
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to=<%= hitsCount%> data-speed="5000" data-refresh-interval="50"></span>
                        <span class="fh5co-counter-label"> view counter</span>
                    </div>
                    <div class="col-md-4 text-center">
                        <span class="fh5co-counter js-counter" data-from="0" data-to="27232" data-speed="5000" data-refresh-interval="50"></span>
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

