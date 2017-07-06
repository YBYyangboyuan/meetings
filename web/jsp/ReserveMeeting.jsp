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
    //根据预计参加人数和开始时间和结束时间判断返回不冲突的会议室信息和人员信息。
    helloClient =new HelloClient();
    itest=helloClient.gettest();
    if (Integer.parseInt(request.getParameter("fun"))==0){//请求所有可参会人员
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("starttime",request.getParameter("starttime"));
        jsonObject.put("endtime",request.getParameter("endtime"));
        response.getWriter().write(itest.search_avaliable_staff(jsonObject.toString()));
    }
    else if(Integer.parseInt(request.getParameter("fun"))==1){
        JSONObject jsonObject=new JSONObject();
        jsonObject.put("bookname",Integer.parseInt(request.getParameter("bookname")));
        jsonObject.put("meetingname",request.getParameter("meetingname"));
        jsonObject.put("meetingnotes",request.getParameter("meetingnotes"));
        jsonObject.put("meetingnum",Integer.parseInt(request.getParameter("meetingnum")));
        jsonObject.put("meetingroomid",Integer.parseInt(request.getParameter("meetingroomid")));
        jsonObject.put("starttime",request.getParameter("starttime"));
        jsonObject.put("endtime",request.getParameter("endtime"));
        jsonObject.put("staffid",request.getParameter("staffid"));
        System.out.println(jsonObject.toString());
        response.getWriter().write(itest.add_meeting(jsonObject.toString()));
    }
    else if(Integer.parseInt(request.getParameter("fun"))==2){//取姓名
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
        jsonObject.put("bookname",jsonObjectname.getString("staffId"));
        System.out.println(jsonObject.toString());
        response.getWriter().write(jsonObject.toString());
    }


%>
