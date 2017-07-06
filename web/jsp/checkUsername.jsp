<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="sun.security.provider.MD5" %><%--
  Created by IntelliJ IDEA.
  User: zhangxuri
  Date: 2017/6/26
  Time: 下午3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String names;
    HelloClient helloClient;
    Itest itest;
%>
<%
    helloClient =new HelloClient();
    itest=helloClient.gettest();
    //checkusername变成int型,1待通过冲突（不可以用），2没通过冲突，3可以用


    if(3==itest.checkusername(request.getParameter("username"))){
        response.getWriter().write("{\"valid\":true}");
    }
    else{
    response.getWriter().write("{\"valid\":false}");
    }
%>