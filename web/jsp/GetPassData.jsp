<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: zhangxuri
  Date: 2017/6/26
  Time: 下午4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String names;
    HelloClient helloClient;
    Itest itest;
%>
<%
    helloClient = new HelloClient();
    itest = helloClient.gettest();
    if (Integer.parseInt(request.getParameter("fun")) == 0) {//获取数据
        names = itest.showregistall(0);
        System.out.println(names);
        response.getWriter().write(names);
    } else if (Integer.parseInt(request.getParameter("fun")) == 1) {//通过审批

        if (itest.passregistion(Integer.parseInt(request.getParameter("staffId")))) {
            response.getWriter().write(names);
        }
        else {
            response.sendError(-1);
        }
    } else if (Integer.parseInt(request.getParameter("fun")) == 2) {//删除审批
        if (itest.refuse_regisiton(Integer.parseInt(request.getParameter("staffId")))) {
            response.getWriter().write(names);
        }
        else {
            response.sendError(-1);
        }
    }
%>
