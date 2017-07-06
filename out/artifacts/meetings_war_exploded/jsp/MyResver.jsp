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
    System.out.println(1111);
    helloClient =new HelloClient();
    itest=helloClient.gettest();
    if (Integer.parseInt(request.getParameter("fun"))==0){//我预定的会议
        JSONObject jsonObjectname=new JSONObject();
        Cookie[] cookies=request.getCookies();
        if (cookies!=null){
            for (Cookie cookie:cookies){
                if (cookie.getName().equals("mes")){
//                    jsonObjectname= JSONObject.fromObject(cookie.getValue());
                    jsonObjectname= JSONObject.fromObject(URLDecoder.decode(cookie.getValue(),"utf-8"));
                }
            }
        }
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("bookname",jsonObjectname.getString("username"));
        System.out.println(jsonObject.toString());
        System.out.println(itest.searchMeeting(jsonObject.toString()));
        response.getWriter().write(itest.searchMeeting(jsonObject.toString()));
    }
    else if (Integer.parseInt(request.getParameter("fun"))==1){//撤销会议
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("meetingid",Integer.parseInt(request.getParameter("meetingid")));
        jsonObject.put("cancelnotes",request.getParameter("cancelnotes"));
        System.out.println(jsonObject.toString());
        itest.cancel_meeting(jsonObject.toString());
        response.getWriter().write("已经取消");
    }
    else if(Integer.parseInt(request.getParameter("fun"))==2){//撤销会议

    }


%>
