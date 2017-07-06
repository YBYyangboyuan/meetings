<%@ page import="com.HelloClient" %>
<%@ page import="com.Itest" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page import="java.net.URLDecoder" %><%--
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
    if (Integer.parseInt(request.getParameter("fun")) == 0) {//查询数据
        if (request.getParameter("name").equals("") && request.getParameter("username").equals("")) {
            System.out.println(request.getParameter("pageNumber"));
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", request.getParameter("name"));
            jsonObject.put("username", request.getParameter("username"));
            if (request.getParameter("name").equals("") && request.getParameter("username").equals(""))
                jsonObject.put("fun", 0);
            if (request.getParameter("pageNumber") != null)
                jsonObject.put("pageno", Integer.parseInt(request.getParameter("pageNumber")));
            if (request.getParameter("pageSize") != null)

                jsonObject.put("pagesize", Integer.parseInt(request.getParameter("pageSize")));
            String state = request.getParameter("state");
            int statepost = -1;
            if (state.equals("")) {
                statepost = 3;
            } else if (state.equals("pass")) {
                statepost = 1;
            } else if (state.equals("close")) {
                statepost = 2;
            } else if (state.equals("all")) {
                statepost = 3;
            } else {
                response.getWriter().write("error");
            }
            jsonObject.put("state", statepost);

            String ok = itest.searchstaff(jsonObject.toString());
            if (request.getParameter("name").equals("") && request.getParameter("username").equals("")) {

            } else {

            }
            System.out.println("searchPersonnel" + ok);

            response.getWriter().write(ok);
        } else {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("name", URLDecoder.decode(request.getParameter("name"),"UTF-8"));
            jsonObject.put("username", request.getParameter("username"));
            System.out.println(request.getParameter("name"));
            System.out.println(request.getParameter("username"));

            String state = request.getParameter("state");
            int statepost = -1;
            if (state.equals("")) {
                statepost = 3;
            } else if (state.equals("pass")) {
                statepost = 1;
            } else if (state.equals("close")) {
                statepost = 2;
            } else if (state.equals("all")) {
                statepost = 3;
            } else {
                response.getWriter().write("error");
            }
            jsonObject.put("state", statepost);
            String ok=itest.searchstaff(jsonObject.toString());
            JSONArray jsonArray=JSONArray.fromObject(ok);
            JSONObject jsonObject1=new JSONObject();
            jsonObject1.put("total",jsonArray.size());
            jsonObject1.put("rows",jsonArray);
            ok=jsonObject1.toString();
            response.getWriter().write(ok);
            System.out.println("username:"+ok);
        }
    } else if (Integer.parseInt(request.getParameter("fun")) == 1) {//改变状态
        itest.reverse_staff(Integer.parseInt(request.getParameter("staffId")));
        response.getWriter().write("success");
    }
    else if (Integer.parseInt(request.getParameter("fun")) == 2){
        if (Integer.parseInt(request.getParameter("departmentid"))==0){
            System.out.println("departmentid=0");
        }
        else {
            String ok=itest.searchstaffbydepartment(Integer.parseInt(request.getParameter("departmentid")));
            System.out.println(ok);
            response.getWriter().write(ok);
        }
    }
%>
