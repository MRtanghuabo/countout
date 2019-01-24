<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<body>
	<div class="shop_wrap">
		<div class="header">
			<p>
				<a href="javascript:;">Y·Z云职结算平台</a>
			</p>
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
					<i class="copicon"></i> <i class="login_out"> <span>
							<img src="../images/icon_ring.png" /> <label></label>
					</span> <i id="loginName"></i> <b><img src="../images/icon_up.png" /></b> <em>
							<a class="resetPassword" style="border: 0;" href="javascript:;">重置密码</a>
							<a class="logout" href="javascript:;">退出登录</a>
					</em>
					</i>
				</p>
				<p class="shop_list_f add_invoices">新建/修改商户</p>
				<div class="shop_list_f_form shop_list_f_form_modelAd">
					<table class="invoice_form newShopform">
						<tr>
							<td>商户名称：</td>
							<td><input class="shopName inputs" type="text"/></td>
						</tr>
						<tr>
							<td>打款类型：</td>
                			<td>
	                			<select disabled="disabled" class="paymentType">
	                				<option value="0">银行卡</option>
	                				<option value="1">虚拟账户</option>
	                			</select>
	                		</td>
						</tr>
						<tr>
							<td colspan="2">
								<p class="title">银行卡信息(非必填)</p>
							</td>
						</tr>
						<tr>
							<td>账户名称：</td>
							<td><input class="zhName" type="text"/></td>
						</tr>
						<tr>
							<td>开户行：</td>
							<td><input class="bankName" type="text"/></td>
						</tr>
						<tr>
							<td>银行卡号：</td>
							<td>
								<input class="bankNum" type="text"/>
							</td>							
						</tr>
						<tr>
							<td colspan="2">
								<p class="title">服务费设定</p>
							</td>
						</tr>
						<tr>
							<td>代征主体：</td>
							<td>
								<select disabled="disabled" class="dzzt">
									
								</select>
							</td>
						</tr>
						<tr>
							<td>服务费：</td>
							<td><input class="allRa num inputs" type="text"/><b class="bfs">%</b></td>
						</tr>
						<tr>
							<td>备注信息：</td>
							<td><textarea style="width:500px;" class="bzInfo"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align:right;"><button onclick="window.history.go(-1)" class="disable">取消</button> <button class="creatShop">确认</button></td>
						</tr>
					</table>
				</div>
				<!-- 新建BD人员  -->
                <div style="display:none;" class="shaow shaow4 newBdCreat_shaow">
                      <div class="del_shaow">
                          <h1>新建BD人员</h1>
                          <div class="ever_text">
								<table>
                                    <tr>
                                        <td>姓名：</td>
                                        <td><p><input class="newBd" type="text"/></p></td>
                                    </tr>
									<tr>
                                        <td>手机号：</td>
                                        <td><p><input class="newBdPhone" type="text"/></p></td>
                                    </tr>
								</table>
								<div class="btn_aera">
	                                <button class="disable back ">清空</button> <button class="creatBd">创建</button>
	                            </div>
							</div>
                      </div>
                  </div>
                  <div style="display:none" class="shaow shaow4 shaow4_login">
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
                                <button class="disable back ">取消</button> <button disabled class="disable">确认</button>
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
<script src="../js/address.js"></script>
<script>
var oldPassid="<%=UserHolder.getId()%>";
var orgPassid="<%=UserHolder.getOrgId()%>";



/* 修改回显 */
var url=window.location.href;
var urlArr = url.split('?');

/* 创建 */
$(".creatShop").click(function(){
	if(typeof(urlArr[1])){
		if($(".shop_list_f_form_modelAd .inputs").val()==""){
			layer.msg('请正确填写数据');
	 		return false;
		}
		if($(".allRa").val()<Number($(".allRa").attr("data-allras"))){
			layer.tips('请输入正确数值', ".allRa");
	 		return false;
		}
		$.ajax({
			type : "POST",
			url : "" + loction + "customer/createCustomer",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({"customerName" : $(".shopName").val(),"paymentType":$(".paymentType").val(),"contactName" : $(".zhName").val(),"depositBank" : $(".bankName").val(),"bankNumber" : $(".bankNum").val(),"substitutedCollectionId" : $(".dzzt").val(),"profitRateCreate" : $(".companyRa").val(),"salesManRateCreate" : $(".BDra").val(),"poundageCreate" : $(".allRa").val(),"salesmanName" : $(".BDpop").val(),"customerComment" : $(".bzInfo").val()}),
			async : false,
			success : function(data) {
				layer.msg(data.message);
				window.location.href="javascript:history.go(-1)";
				
			},
			error : function() {
				console.log("err");
			}
		})
	}else{
		if($(".shop_list_f_form_modelAd .inputs").val()==""){
			layer.msg('请正确填写数据');
	 		return false;
		}
		if($(".allRa").val()<Number($(".allRa").attr("data-allras"))){
			layer.tips('请输入正确数值', ".allRa");
	 		return false;
		}
		$.ajax({
			type : "POST",
			url : "" + loction + "customer/updateCustomer",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({"customerId":urlArr[1],"paymentType":$(".paymentType").val(),"customerName" : $(".shopName").val(),"contactName" : $(".zhName").val(),"depositBank" : $(".bankName").val(),"bankNumber" : $(".bankNum").val(),"substitutedCollectionId" : $(".dzzt").val(),"profitRateCreate" : $(".companyRa").val(),"salesManRateCreate" : $(".BDra").val(),"poundageCreate" : $(".allRa").val(),"salesmanName" : $(".BDpop").val(),"customerComment" : $(".bzInfo").val()}),
			async : false,
			success : function(data) {
				layer.msg(data.message);
				window.location.href="javascript:history.go(-1)";
				
			},
			error : function() {
				console.log("err");
			}
		})
	}
})


$(".newBdCreat").click(function(){
	$(".newBdCreat_shaow").show();
})

 $.ajax({
		type: "POST",
		url: ""+loction+"customer/queryCustomerDetail",
		contentType: "application/json;charset=utf-8",
		data:JSON.stringify({"customerId":urlArr[1]}),
		async: false,
		success:function(data){
			console.log(data);
			if(data.message!="此处无返回！"){
				$(".shopName").val(isNotNullAndUndifine(data.data.customerName));
	  			$(".zhName").val(isNotNullAndUndifine(data.data.contactName));
	  			$(".bankName").val(isNotNullAndUndifine(data.data.depositBank));
	  			$(".bankNum").val(isNotNullAndUndifine(data.data.bankNumber));
	  			$(".bzInfo").val(isNotNullAndUndifine(data.data.customerComment));
	  			$(".paymentType").val(isNotNullAndUndifine(data.data.paymentType));
	  			$(".allRa").val(data.data.poundageStr);
			}
		},
		error:function(){
			console.log("err");
		}
	})
	
	/* 固定回显 */
	 $.ajax({
		type: "POST",
		url: ""+loction+"customer/queryCurrentCustomerDetail",
		contentType: "application/json;charset=utf-8",
		data:JSON.stringify({"customerId":orgPassid}),
		async: false,
		success:function(data){
			console.log(data);
  			$(".dzzt").append("<option value="+isNotNullAndUndifine(data.data.substitutedCollectionId)+">"+isNotNullAndUndifine(data.data.substitutedCollectionName)+"</option>");
  			$(".allRa").attr({"placeholder":"≥"+isNotNullAndUndifine(data.data.poundageStr)+"%","data-allras":isNotNullAndUndifine(data.data.poundageStr)});
  			$(".paymentType").val(data.data.paymentType)
		},
		error:function(){
			console.log("err");
		}
	})
	
	

$("#loginName").html(name);
 $(".copicon").html(isNotNullAndUndifine(customerName1));
 
 /*是否为数字*/
 $(".num").blur(function(){
 	var re = /^[0-9]+.?[0-9]*/;
 	if(!re.test($(this).val())){
 		layer.tips('请输入正确数值', $(this));
 		return false;
 	} 
 	
 })
 
 $(".shop_list_f_form_modelAd .inputs").blur(function(){
 	if($(this).val()==""){
 		layer.tips('不为空', $(this));
 		return false;
 	}	
 })
 $(".allRa").blur(function(){
	 if($(this).val()<Number($(this).attr("data-allras"))){
		 layer.tips('请填入正确服务费', $(this));
		 return false;
	 }
 })
</script>
</html>

