<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: yby
  Date: 2017/6/27
  Time: 上午8:35
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: zhangxuri
  Date: 2017/6/21
  Time: 下午1:30--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
  String direct = "login.html";
  String guide = "null.jsp";
  String username = new String();
  String password = new String();
  String msg;
  String action = "";
%>
<%
  if (request.getParameter("action") != null && request.getParameter("action").equals("Logout")) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie : cookies) {
        if (cookie.getName().equals("username")) {//从前登陆过
          username = URLDecoder.decode(cookie.getValue(),"utf-8");
          cookie.setMaxAge(-1);
          cookie.setValue(URLEncoder.encode(" ","utf-8"));

          response.addCookie(cookie);
        }
        if (cookie.getName().equals("password")) {
          cookie.setMaxAge(-1);
          cookie.setValue(URLEncoder.encode(" ","utf-8"));
          response.addCookie(cookie);
        }if (cookie.getName().equals("msg")) {
          cookie.setMaxAge(-1);
          cookie.setValue(URLEncoder.encode(" ","utf-8"));
          response.addCookie(cookie);
        }

      }
    }
    direct = "login.html";
    guide = "null.jsp";
    System.out.println("logout");

  }

%>
<jsp:include page="<%=guide%>"></jsp:include>
<jsp:include page="<%=direct%>"></jsp:include>

