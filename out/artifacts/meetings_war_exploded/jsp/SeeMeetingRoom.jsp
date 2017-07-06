<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="java.net.URLDecoder" %>
<%--
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
        names = itest.show_allmeetingroom();
        response.getWriter().write(names);
    } else if (Integer.parseInt(request.getParameter("fun")) == 1) {//修改数据

        JSONObject jsonObject=new JSONObject();
        jsonObject.put("roomnumber",request.getParameter("roomnumber"));
        jsonObject.put("meetingroomname",request.getParameter("meetingroomname"));
        jsonObject.put("capacity",Integer.parseInt(request.getParameter("capacity")));
        jsonObject.put("remark",request.getParameter("remark"));
        jsonObject.put("state",request.getParameter("state"));
        jsonObject.put("meetingroomid",Integer.parseInt(request.getParameter("meetingRoomId")));
        if (!itest.modify_meeting_room(jsonObject.toString())){
            response.sendError(-1);
        }
        else{
            response.getWriter().write("zhangxuri");
        }
    }
    else if (Integer.parseInt(request.getParameter("fun")) == 2){
        JSONObject jsonObjectname=new JSONObject();
        Cookie[] cookies=request.getCookies();
        if (cookies!=null){
            for (Cookie cookie:cookies){
                if (cookie.getName().equals("mes")){
                    jsonObjectname= JSONObject.fromObject(URLDecoder.decode(cookie.getValue(),"utf-8"));
                }
            }
        }
        String level=jsonObjectname.getString("level");
        JSONObject jsonObject =new JSONObject();
        jsonObject.put("level",level);
        response.getWriter().write(jsonObject.toString());
    }
%>
