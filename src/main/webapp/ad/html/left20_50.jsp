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
        	<li data-address="${baseUrl}/ad/html/shopBalance_h.jsp" class="fat"><i><img src="../images/icon1_h.png"/></i><a href="javascript:;">账户余额</a></li>
            <li data-address="${baseUrl}/ad/html/recharge_Log_h.jsp" class="fat"><i><img src="../images/icon2_h.png"/></i><a href="javascript:;">充值申请</a></li>
            <li data-address="${baseUrl}/ad/html/other_Payment_h.jsp" class="fat"><i><img src="../images/icon3_h.png"/></i><a href="javascript:;">代付款管理</a></li>
            <li data-address="${baseUrl}/ad/html/payChecked_h.jsp" class="fat"><i><img src="../images/icon4_h.png"/></i><a href="javascript:;">付款查询</a></li>
            <li data-address="${baseUrl}/ad/html/payeeManagement_h.jsp" class="fat"><i><img src="../images/icon5_h.png"/></i><a href="javascript:;">收款人管理</a></li>
            <li data-address="${baseUrl}/ad/html/invoiceVoid_h.jsp" class="fat"><i><img src="../images/icon6_h.png"/></i><a href="javascript:;">发票管理</a></li>
            
            <li data-address="javascript:;" data-parent="fat" data-name="shopCenter" id="shopCenter" class="fat"><i><img src="../images/icon5.png"/></i>商户中心<img class="ud" src="../images/right_icon.png"/></li>
            
            <li data-address="javascript:;"  data-parent="chl" class="shopCenter" onclick="zczf(1)"><b>·</b><a href="javascript:;">商户列表</a></li>
            <li data-address="${baseUrl}/ad/html/rechargeCheck.jsp"  data-parent="chl" id="czsq" class="shopCenter"><b>·</b><a href="javascript:;">充值审核</a></li>
            <li data-address="${baseUrl}/ad/html/tiopAdm.jsp"  data-parent="chl" id="kpgl" class="shopCenter"><b>·</b><a href="javascript:;">开票管理</a></li>
            
            <li data-address="javascript:;" class="fat"  onclick="zczf(2)"><i><img src="../images/icon2.png"/></i>交易中心</li>
            <li data-address="${baseUrl}/ad/html/user_gly.jsp?11" class="fat"><i><img src="../images/icon3.png"/></i><a href="javascript:;">角色账号配置</a></li>
            
            <li data-address="javascript:;" data-parent="fat" data-name="payCenter" class="fat" id="payCenter"><i><img src="../images/icon8.png"/></i>数据中心<img class="ud" src="../images/right_icon.png"/></li>
            
            <li data-address="${baseUrl}/ad/html/payeeCenter2.jsp?13" id="scrzx"  data-parent="chl" class="payCenter"><b>·</b><a href="javascript:;">收款人中心</a></li>
            <li data-address="${baseUrl}/ad/html/BdCheck.jsp?14" data-parent="chl" id="bdNum" class="payCenter"><b>·</b><a href="javascript:;">BD人员</a></li>
            <li data-address="javascript:;" class="payCenter" data-parent="chl" onclick="zczf(3)" ><b>·</b><a href="javascript:;">账户信息</a></li>
            
            <li data-address="${baseUrl}/ad/html/operateLog_z.jsp?16" data-name="payLog" class="fat"><i><img src="../images/icon1.png"/></i><a href="javascript:;">操作日志</a></li>
        </ul>
    </div>
</div>

<script type="text/javascript">

function zczf(state){
	$.ajax({
	    type: "POST",
	    url: ""+loction+"customer/queryIfTopCustomer",
	    contentType: "application/json;charset=utf-8",
	    success:function(data){	
	    	if(data.data==1){
	    		if(state==1){
	    			
	    			window.location.href=loction+"ad/html/shopList2.jsp?7";
	    		}else if(state==2){
	    			window.location.href=loction+"ad/html/tradingCenter.jsp?10";
	    		}else if(state==3){
	    			window.location.href=loction+"ad/html/accountInfo_zshht.jsp?15";
	    			
	    		}
	    	}else{
	    		if(state==1){
		    		window.location.href=loction+"ad/html/shopCenter.jsp?7";
		    	}else if(state==2){
		    		window.location.href=loction+"ad/html/tradingCenter2.jsp?10";
	    		}else if(state==3){
	    			window.location.href=loction+"ad/html/accountInfo_shht.jsp?15";
	    			
	    		}
	    	}
	    },
	    error:function(){
	    	console.log("err");
	    }
	})
} 

$.ajax({
    type: "POST",
    url: ""+loction+"customer/queryIfTopCustomer",
    contentType: "application/json;charset=utf-8",
    success:function(data){
    	if(data.data!=1){
    		$("#czsq").remove();
    		$("#kpgl").remove();
    		$("#bdNum").remove();
    		$("#scrzx").remove();
    	}
    }
})


</script>


</body>
</html>