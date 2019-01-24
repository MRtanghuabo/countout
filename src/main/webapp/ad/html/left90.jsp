<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="left_nav">
    <div>
        <ul>
            <li data-address="javascript:;" data-parent="fat" data-name="shopCenter" id="shopCenter" class="fat"><i><img src="../images/icon5.png"/></i>商户中心<img class="ud" src="../images/right_icon.png"/></li>
            <li data-address="${baseUrl}/ad/html/shopList.jsp" data-parent="chl" class="shopCenter"><b>·</b><a href="javascript:;">商户列表查询</a></li>
            <li data-address="${baseUrl}/ad/html/creatShop.jsp" data-parent="chl" class="shopCenter"><b>·</b><a href="javascript:;">主商户配置</a></li>
            <li data-address="${baseUrl}/ad/html/payeeCenter.jsp" data-parent="chl" class="shopCenter"><b>·</b><a href="javascript:;">收款人中心</a></li>
            <li data-address="javascript:;" data-parent="fat" data-name="payCenter" id="payCenter" class="fat"><i><img src="../images/icon2.png"/></i>交易中心<img class="ud" src="../images/right_icon.png"/></li>
            <li data-address="${baseUrl}/ad/html/incomeDetails.jsp" data-parent="chl" class="payCenter"><b>·</b><a href="javascript:;">入账及收入明细</a></li>
            <li data-address="${baseUrl}/ad/html/authUser.jsp" data-name="userAuth" class="fat"><i><img src="../images/icon3.png"/></i><a href="javascript:;">账户权限管理</a></li>
            <li data-address="${baseUrl}/ad/html/operateLog.jsp" data-name="payLog" class="fat"><i><img src="../images/icon1.png"/></i><a href="javascript:;">操作日志</a></li>
        </ul>
    </div>
</div>
</body>
</html>