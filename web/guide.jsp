<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>Bootstrap导航实例</title>
    <meta name="description" content="Bootstrap navbar Example">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/guide.css">
    <script src="js/jquery.min.js"></script>
    <style type="text/css">
        .socials {
            padding: 10px;
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

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <ul class="nav pull-right">
                <li><a href="index.jsp?action=Logout">注销账号</a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    var lev=<%=level%>;
    if(lev=="2"){
    }
    else{
        $('#people').hide();
        $('#add').hide();
        $('#search').hide();
    }
</script>
<table id="test-table"></table>

</body>
</html>