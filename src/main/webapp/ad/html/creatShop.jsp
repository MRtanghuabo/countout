<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tag.jsp" %>
<body>
    <div class="shop_wrap">
        <div class="header">
            <p><a href="javascript:;">Y·Z云职结算平台</a></p>
        </div>
        <div style="height: 100%;" class="shopList_wrap">
        	<% if(distributionType != null){
	        if(distributionType==10){ %>	
	        	<%@ include file="left10.jsp" %>
	        <% }else if(distributionType==90){ %>
	        	<%@ include file="left90.jsp" %>
	        <% }else{ %>
	        	<%@ include file="left20_50.jsp" %>
       		<% } 
	   		}%>
        	
            <div class="right_dal">
                <p class="right_tit">
                    <i class="copicon"></i>
                    <i class="login_out">
                        <span>
                            <img src="../images/icon_ring.png"/>
                            <label></label>
                        </span>
                        <i id="loginName"></i>
                        <b><img src="../images/icon_up.png"/></b>
                        <em>
                            <a class="resetPassword" style="border: 0;" href="javascript:;">重置密码</a>
                            <a class="logout" href="javascript:;">退出登录</a>
                        </em>
                </i>
                </p>
                <p class="shop_list_f">创建主商户</p>
                <table class="creat_shop">
                	<tr>
                		<td>主商户名称：</td>
                		<td><p><input class="customerName" type="text"/></p></td>
                	</tr>
                	<tr>
                		<td>账户名称：</td>
                		<td><p><input class="contactName" type="text"/></p></td>
                	</tr>
                	<tr>
                		<td>开户行：</td>
                		<td><p><input class="depositBank" type="text"/></p></td>
                	</tr>
                	<tr>
                		<td>银行卡号：</td>
                		<td><p><input oninput = "value=value.replace(/[^\d]/g,'')" class="bankNumber" type="text"/></p></td>
                	</tr>
                	<tr>
                		<td>打款类型：</td>
                		<td>
                			<select style="width:514px;" class="paymentType">
                				<option value="0">银行卡</option>
                				<option value="1">虚拟账户</option>
                			</select>
                		</td>
                	</tr>
                	<!-- <tr>
                		<td>服务费：</td>
                		<td><p><input onkeyup="clearNoNum(this)" class="poundageStr" type="text"/><b class="bfs">%</b></p></td>
                	</tr> -->
                	<tr class="dzzt_bod">
                		<td>代征主体：</td>
                		<td>
	                		<!-- <p class="dzzt">
	                			<input class="substitutedCollectionId" readonly value="请选择" type="text"/>
	                			<em><img src="../images/show.png"/></em>
                             	<span style="display:none;" class="dzztList"></span>
	                		</p> -->
	                		<select class="substitutedCollectionId">
	                			<option data-fl="" value="">请选择</option>
	                		</select>
	                		费率：<input style="text-align:center;" class="fl" readonly type="text" /><!-- <a class="dzztpz">代征主体配置</a> -->
                		</td>
                	</tr>
                	<tr>
                		<td></td>
                		<td><p style="text-align:right"><button class="disable resubs">清空</button> <button class="creat_btn">创建</button></p></td>
                	</tr>
                </table>
                <div style="display:none" class="shaow shaow4">
                        <div class="del_shaow">
                            <h1>重置密码</h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>原始密码：</td>
                                        <td><p><input class="oldpass" type="password"/><input class="olds" type="hidden"/><input class="oldsId" type="hidden"/></p></td>
                                    </tr>
									<tr>
                                        <td>新密码：</td>
                                        <td><p><input class="newpass" type="password"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>确认新密码：</td>
                                        <td><p><input class="newpass1" type="password"/></p></td>
                                    </tr>
								</table>
                            </div>
                            <div class="btn_aera">
                                <button class="disable back ">取消</button> <button disabled class="disable checkPassword">确认</button>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</body>
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/address.js"></script>
<script>
$(function(){
	//获取所有代征主体
	$.ajax({
        type: "POST",
     	data:JSON.stringify(), 
        url: ""+loction+"/substitutedCollection/queryAllSubstitutedCollection",
        contentType: "application/json;charset=utf-8",
        dataType: "json",//预期服务器返回的数据类型
        success:function(data){
        	
        	$.each(data.data,function(i,item){
        		str="<option data-fl="+item.substitutedCollectionRateStr+" value="+item.substitutedCollectionId+">"+item.substitutedCollectionName+"</option>"
        		$(".substitutedCollectionId").append(str+"%");
        	})
        },
        error:function(){
        	console.log("err");
        }
   })
   
   $(".dzztpz").click(function(){
	   window.location.href=loction+"ad/html/dzztAdd.jsp?2";
   })
   
   $(".substitutedCollectionId").change(function(){
	   
	   var ss=$(this).find("option:selected").attr("data-fl");
	   $(".fl").val(ss+"%");
   })
   	//获取已选代征主体
    $("input:checkbox").live("click",function(){
    	text = $("input:checkbox:checked").map(function(index,elem) {
            return $(elem).next().next().text();
        }).get().join(',');
    	$(".substitutedCollectionId").val(text);
    })
    //创建账号
    $(".creat_btn").click(function(){
    	if($(".customerName").val()==""){
    		layer.tips('不能为空', '.customerName');
    		return false;
    	}
    	if($(".poundageStr").val()==""){
    		layer.tips('不能为空', '.poundageStr');
    		return false;
    	}
    	if($(".poundageStr").val()>=100){
    		layer.tips('请输入正确数值', '.poundageStr');
    		return false;
    	}
    	if($(".substitutedCollectionId").val()==""){
    		layer.tips('请选择代征主体', '.substitutedCollectionId');
    		return false;
    	}
    	if($(".paymentType").val()==""){
    		layer.tips('请选择打款类型', '.paymentType');
    		return false;
    	}
    	if($(".substitutedCollectionId").val()!=""){
    		
    		$.ajax({
    	        type: "POST",
    	        data:JSON.stringify({"customerName":$(".customerName").val(),"paymentType":$(".paymentType").val(),"contactName":$(".contactName").val(),"depositBank":$(".depositBank").val(),"bankNumber":$(".bankNumber").val(),"poundageCreate":$(".poundageStr").val(),"substitutedCollectionId":$(".substitutedCollectionId").val()}), 
    	        url: ""+loction+"customer/createCustomer",
    	        contentType: "application/json;charset=utf-8",
    	        dataType: "json",//预期服务器返回的数据类型
    	        success:function(data){
    	        	
    	        	layer.msg(data.message);
    	        	if(data.status==200){
    	        		window.location.href=loction+"ad/html/shopList.jsp?1";
    	        	}
    	        },
    	        error:function(){
    	        	console.log("err");
    	        }
    	   }) 
    	}else{
    		layer.msg('请选择代征主体');
    	}
	     
   }) 

  
})

$(".resubs").click(function(){
	$(".creat_shop input").val("");
	$(".substitutedCollectionId").val("");
})
var oldPassid="<%=UserHolder.getId()%>";
   //修改小数点
   function clearNoNum(obj){ 
	    obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
	    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
	    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
	    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d).*$/,'$1$2.$3');//只能输入两个小数  
	    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
	        obj.value= parseFloat(obj.value); 
	    } 
	}
   $("#loginName").html(name);
   $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

