<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.countout.portal.security.UserHolder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>云职结算平台</title>
</head>
<style>
    *{ margin: 0; padding: 0;}
    ul{ list-style: none;width: 1025px; height: auto; overflow: hidden; margin: 200px auto; }
    ul li{ float: left;  height: auto; color: #999; }
    ul li label{ display: block; margin-top: 15px; }
    ul li p{ font-size: 30px;}
    ul li a{ color: #FFC245; }
    button{ width: 100px; height: 35px; line-height:35px; vertical-align: middle; cursor: pointer; border-radius: 5px; border: 0; outline: none; background: #FFC245; color: #fff; font-size: 16px; }
    .nofindtext{ margin-top: 120px; }
</style>
<body>
    <div class="wrap">
        <ul>
            <li><img src="images/nofind.png"/></li>
            <li class="nofindtext">
                <p>抱歉！您所查找的页面不存在 <br/>请点击<button onclick="history.go(0)">刷新</button></p>
                <label>或试试以下方法</label>
                <label><a href="javascript: history.back(-1);">返回上一页</a> <a class="backtop" href="javascript:;">返回首页</a></label>
            </li>
        </ul>
    </div>
</body>
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/address.js"></script>
<script type="text/javascript">
	$(".backtop").click(function(){
		var distributionType = "<%=UserHolder.getDistributionType()%>";
  		if(
  			distributionType=='10' ||
  			distributionType=='21' ||
  			distributionType=='22' ||
  			distributionType=='23' || 
  			distributionType=='31' ||
  			distributionType=='32' ||
  			distributionType=='40' ||
  			distributionType=='50' 
  		){
  			window.location.href=loction+'ad/html/shopBalance_h.jsp?0';
       }else if(distributionType=='90'){
       	window.location.href=loction+'ad/html/shopList.jsp?1';
   	}
	})
</script>
</html>




