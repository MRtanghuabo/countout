<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%
	pageContext.setAttribute("ctx", request.getContextPath());
	pageContext.setAttribute("baseUrl", "http://127.0.0.1:8080/countout");
%>
<%@ page import="com.countout.portal.security.UserHolder" %>
<%
	Integer id=UserHolder.getId();
	Integer distributionType = UserHolder.getDistributionType();
%>
<%
	HttpSession sessions = request.getSession();
	Object loginState = sessions.getAttribute("loginState");
	System.out.println("loginState==="+loginState);
%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta name="format-detection" content="telephone=no">
	<meta http-equiv="expires" content="0">   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="odsp">
    <title>云职结算平台</title>
    <link rel='stylesheet' href="${ctx}/ad/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/ad/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="${ctx}/ad/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="${ctx}/ad/css/style.css">
	<link rel="icon" type="image/x-icon" href="../favicon.ico" />
</head>
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/address.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/nav.js"></script>
<script src="../js/ajaxfileupload.js"></script>
<script src="../js/Convert_Pinyin.js"></script>
<script type="text/javascript">
	var _ctx = '${ctx}';
	var loginState = <%=loginState%>;
	if(loginState){
		alert("当前用户已在别处登录，请重新登录！")
		$.ajax({
	        type: "POST",
	        url: _ctx+"/logoutSession.do",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	window.location.href=loction+"ad/html/login.jsp";
	        },
	        error:function(){}
	   })
	}
	var id = <%=id%>; 
	if(id==null){
		 window.location.href=loction+'ad/html/login.jsp';
	}
	var username = "<%=UserHolder.getUsername()%>";
	var name = "<%=UserHolder.getName()%>";
	var orgId = "<%=UserHolder.getOrgId()%>";
	var mainOrgId = "<%=UserHolder.getMainOrgId()%>";
	var distributionType = "<%=UserHolder.getDistributionType()%>";
	var customerName1 = "<%=UserHolder.getCustomerName()%>";
	
function delinfo(){
	$.ajax({
        type: "POST",
        url: _ctx+"/remind/changePendingMessagesAlert",
        contentType: "application/json;charset=utf-8",
        dataType: "json",//预期服务器返回的数据类型
        success:function(data){
        },
        error:function(){}
   })
}
	    
	   
	  
</script>