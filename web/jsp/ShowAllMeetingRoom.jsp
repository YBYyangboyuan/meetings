<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %><%--
  Created by IntelliJ IDEA.
  User: zhangxuri
  Date: 2017/6/26
  Time: 下午12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String names;
    HelloClient helloClient;
    Itest itest;
    JSONArray jsonArray = new JSONArray();
    List<String> MeetingRoomName = new ArrayList<String>();
%>
<%
    helloClient = new HelloClient();
    itest = helloClient.gettest();
    if (Integer.parseInt(request.getParameter("fun")) == 0) {
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("starttime",request.getParameter("starttime"));
        jsonObject.put("endtime",request.getParameter("endtime"));
        jsonObject.put("nownumber",Integer.parseInt(request.getParameter("nownumber")));
        response.getWriter().write(itest.search_avaliable_meetingroom(jsonObject.toString()));


    } else {
        names = itest.show_allmeetingroom();
        jsonArray = JSONArray.fromObject(names);
        response.getWriter().write(names);
    }
%>