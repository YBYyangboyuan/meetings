<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %><%--
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
    //根据预计参加人数和开始时间和结束时间判断返回不冲突的会议室信息和人员信息。

    helloClient = new HelloClient();
    itest = helloClient.gettest();
    if (Integer.parseInt(request.getParameter("fun")) == 0) {//请求所有可参会人员

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("state", 1);
        response.getWriter().write(itest.searchstaff(jsonObject.toString()));
    } else if (Integer.parseInt(request.getParameter("fun")) == 1) {//请求所有会议室
        response.getWriter().write(itest.search_avaliable_meetingroom("{}"));
    } else if (Integer.parseInt(request.getParameter("fun")) == 2) {//请求所有会议
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("meetingname", request.getParameter("meetingname"));
        jsonObject.put("meetingroomid", Integer.parseInt(request.getParameter("meetingroonname")));
        String bookstarttime, bookendtime, starttime, endtime;
        bookstarttime = request.getParameter("bookstarttime");
        bookendtime = request.getParameter("bookendtime");
        starttime = request.getParameter("starttime");
        endtime = request.getParameter("endtime");
        if (!bookstarttime.equals(""))
            jsonObject.put("bookstarttime", bookstarttime + " 00:00:00");
        if (!bookendtime.equals(""))
            jsonObject.put("bookendtime", bookendtime + " 23:59:59");
        if (!starttime.equals(""))
            jsonObject.put("starttime", starttime + " 00:00:00");
        if (!endtime.equals(""))
            jsonObject.put("endtime", endtime + " 23:59:59");
        if (request.getParameter("staff").equals("-1"))
            jsonObject.put("bookname","");
        else
            jsonObject.put("bookname",request.getParameter("staff"));

        System.out.println(jsonObject.toString());
        response.getWriter().write(itest.searchMeeting(jsonObject.toString()));
    }

%>
