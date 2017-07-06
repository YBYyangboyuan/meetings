<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="javax.xml.ws.Response" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="jdk.nashorn.internal.runtime.regexp.joni.EncodingHelper" %>
<%@ page import="java.beans.Encoder" %><%--
  Created by IntelliJ IDEA.
  User: zhangxuri
  Date: 2017/6/23
  Time: 上午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String username;
    String password;
    String mes;
    HelloClient helloClient;
    Itest itest;
%>
<%
    username = request.getParameter("username");
    password = request.getParameter("password");
    helloClient = new HelloClient();
    itest = helloClient.gettest();
    Cookie usernamecookie = new Cookie("username", username);
    Cookie passwordcookie = new Cookie("password", password);

    System.out.println("cookie success");
    String message = itest.login(username, password);
    System.out.println("loginmes"+message);
    Cookie mescookie=new Cookie("mes", URLEncoder.encode(message,"utf-8"));

    if (request.getParameter("rem").equals("true")) {
        usernamecookie.setMaxAge(24 * 3600 * 30);
        passwordcookie.setMaxAge(24 * 3600 * 30);
        mescookie.setMaxAge(24 * 3600 * 30);
    }
    usernamecookie.setPath("/");
    passwordcookie.setPath("/");
    mescookie.setPath("/");

    response.addCookie(usernamecookie);
    response.addCookie(passwordcookie);
    response.addCookie(mescookie);

    JSONObject jsonObject = JSONObject.fromObject(message);
    System.out.println(message);

    JSONObject respo = new JSONObject();
    if ((Boolean) jsonObject.get("ifsuccess")) {
        respo.put("state", 5);
        System.out.println("okreturn");
        response.getWriter().write(respo.toString());
    } else if ((Integer) jsonObject.get("err") == 0) {//冻结
        respo.put("state", 0);
        response.getWriter().write(respo.toString());
    } else if ((Integer) jsonObject.get("err") == 1) {//带审批
        respo.put("state", 1);
        response.getWriter().write(respo.toString());
    } else if ((Integer) jsonObject.get("err") == 2) {//拒绝审核
        respo.put("state", 2);
        response.getWriter().write(respo.toString());
    } else if ((Integer) jsonObject.get("err") == 3) {//账号密码错误
        respo.put("state", 3);
        response.getWriter().write(respo.toString());
    }


%>
