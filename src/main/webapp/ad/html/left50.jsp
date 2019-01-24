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
            <li data-address="${baseUrl}/ad/html/tiopAdm.jsp"  data-parent="chl" id="kpgl" class="shopCenter"><b>·</b><a href="javascript:;">开票管理</a></li>
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