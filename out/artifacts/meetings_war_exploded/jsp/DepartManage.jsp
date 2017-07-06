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
    if (Integer.parseInt(request.getParameter("fun")) == 0) {//修改
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("departmentid", Integer.parseInt(request.getParameter("departmentid")));
        jsonObject.put("modifyname", request.getParameter("modifyname"));
        jsonObject.put("departmentnum", Integer.parseInt(request.getParameter("departmentnum")));

        if (!itest.modify_department(jsonObject.toString())) {
            response.sendError(-1);
        } else {
            response.getWriter().write("zhangxuri");
        }
    } else if (Integer.parseInt(request.getParameter("fun")) == 1) {//删除
        if (Integer.parseInt(request.getParameter("departmentnum")) != 0) {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("data","请先安置该部门下成员");
            response.getWriter().write(jsonObject.toString());
        }
        else {
            if (itest.delect_department(Integer.parseInt(request.getParameter("departmentid")))){
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("data","删除成功");
                response.getWriter().write(jsonObject.toString());
            }
            else {
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("data","删除失败");
                response.getWriter().write(jsonObject.toString());
            }
        }
    }
    else if (Integer.parseInt(request.getParameter("fun")) == 3){
        System.out.println("ok");
        itest.add_department(request.getParameter("departmentname"));
        response.getWriter().write("zhangxuri");
    }
    else if (Integer.parseInt(request.getParameter("fun")) == 4){
        System.out.println(1);
        if(itest.checkdepartmentname(request.getParameter("departmentName"))){
            System.out.println(123);
            response.getWriter().write("{\"valid\":true}");
        }
        else{
            System.out.println(456);
            response.getWriter().write("{\"valid\":false}");
        }
    }
    else if (Integer.parseInt(request.getParameter("fun")) == 5){

        if (itest.redistribute_department_of_staff(request.getParameter("datas")))
        response.getWriter().write("ok");
        else {
            response.getWriter().write("no");
        }
    }

%>
