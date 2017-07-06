<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
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
    helloClient =new HelloClient();
    itest=helloClient.gettest();
    JSONObject jsonObjectname=new JSONObject();
    Cookie[] cookies=request.getCookies();
    if (cookies!=null){
        for (Cookie cookie:cookies){
            if (cookie.getName().equals("mes")){
                jsonObjectname= JSONObject.fromObject(URLDecoder.decode(cookie.getValue(),"utf-8"));
                System.out.println("11111"+jsonObjectname.toString());
            }
        }
    }
    if (Integer.parseInt(request.getParameter("fun"))==0){//未来7天我要参加的会议

        System.out.println(jsonObjectname.getString("username"));
        String datas=itest.search_future_7daysMeeting(jsonObjectname.getString("username"));
        System.out.println(datas);
        response.getWriter().write(datas);
    }
    else if (Integer.parseInt(request.getParameter("fun"))==1){//已取消的会议
     System.out.println(jsonObjectname.getString("staffId"));
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("staffid",Integer.parseInt(jsonObjectname.getString("staffId")));
        jsonObject.put("status",1);
        System.out.println(jsonObject.toString());
        String datas=itest.search_meeting_by_staff(jsonObject.toString());
        response.getWriter().write(datas);
    }
    else if(Integer.parseInt(request.getParameter("fun"))==2){//?


    }


%>
