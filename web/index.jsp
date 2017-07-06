<%--
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
  String direct="login.html";
  String guide="null.jsp";
  String username;
%>
<%
  if (null!=request.getParameter("action")){
    direct=request.getParameter("action");
    guide="guide.jsp";
  }
  else{
    direct="login.html";
    guide="null.jsp";
    System.out.println("null");
  }
  if (null!=request.getParameter("username")){
    if (session.isNew()){
      session.setAttribute("username",request.getParameter("username"));
      username=request.getParameter("username");
    }
  }
  else {
    username= (String) session.getAttribute("username");
  }
%>
<jsp:include page="<%=guide%>"></jsp:include>
<jsp:include page="<%=direct%>"></jsp:include>

