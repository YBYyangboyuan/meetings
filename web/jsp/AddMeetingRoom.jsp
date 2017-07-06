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
    if (request.getParameter("type").equals("roomnumber")){//门牌号不能重复
        if(itest.search_meeting_room_by_number(request.getParameter("roomnumber")).equals("[]")){
            System.out.println(123);
            response.getWriter().write("{\"valid\":true}");
        }
        else{
            System.out.println(456);

            response.getWriter().write("{\"valid\":false}");
        }
    }
    else if(request.getParameter("type").equals("meetingroomname")){//会议室名称不能重复

        if(itest.search_meeting_room_by_name(request.getParameter("meetingroomname")).equals("[]")){
            response.getWriter().write("{\"valid\":true}");
        }
        else{
            response.getWriter().write("{\"valid\":false}");
        }
    }
    else if (request.getParameter("type").equals("regist")){//注册

        JSONObject jsonObject=new JSONObject();
        jsonObject.put("roomnumber",request.getParameter("roomnumber"));
        jsonObject.put("meetingroomname",request.getParameter("meetingroomname"));
        jsonObject.put("capacity",Integer.parseInt(request.getParameter("capacity")));
        jsonObject.put("remark",request.getParameter("remark"));
        jsonObject.put("state",request.getParameter("state"));
        System.out.println(jsonObject.toString());
        if (!itest.add_meeting_room(jsonObject.toString())){
            response.sendError(-1);
        }
        else{
            response.getWriter().write("zhangxuri");
        }
    }
%>