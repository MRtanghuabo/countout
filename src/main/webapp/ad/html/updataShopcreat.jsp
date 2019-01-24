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
				<p class="shop_list_f add_invoices">修改商户</p>
				<div class="shop_list_f_form shop_list_f_form_modelAd">
					<table class="invoice_form newShopform">
						<tr>
							<td>商户名称：</td>
							<td><input class="shopName" type="text"/></td>
						</tr>
						<tr class="title">
							<td>银行卡信息</td>
							<td></td>
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
						<tr class="title">
							<td>服务费设定</td>
							<td></td>
						</tr>
						<tr>
							<td>代征主体：</td>
							<td>
								<select class="dzzt" >
									<option value="">请选择</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>公司手续费：</td>
							<td><input class="companyRa" type="text"/></td>
						</tr>
						<tr>
							<td>BD人员提成比例：</td>
							<td><input class="BDra" type="text"/></td>
						</tr>
						<tr>
							<td>总服务费：</td>
							<td><input class="allRa" type="text"/></td>
						</tr>
						<tr>
							<td>BD人员：</td>
							<td><input class="BDpop" type="text"/><a class="newBdCreat" href="javascript:;">新建BD人员</a></td>
						</tr>
						<tr>
							<td>备注信息：</td>
							<td><textarea style="width:500px;" class="bzInfo"></textarea></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align:right;"><button class="disable">取消</button> <button class="creatShop">确认</button></td>
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



/* 新建BD人员 */

$(".creatBd").click(function(){
	
	$.ajax({
		type : "POST",
		url : "" + loction + "salesman/createSalesman",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({"salesmanName" : $(".newBd").val(),"salesmanPhone" : $(".newBdPhone").val()}),
		async : false,
		success : function(data) {
			
			layer.msg(data.message);
			if(data.message==""){
				
			}
		},
		error : function() {
			console.log("err");
		}
	})
})

$(".newBdCreat").click(function(){
	$(".newBdCreat_shaow").show();
})

  /* 修改回显 */
 var url=window.location.href;
 var urlArr = url.split('?');
 $.ajax({
		type: "POST",
		url: ""+loction+"customer/queryCustomerDetail",
		contentType: "application/json;charset=utf-8",
		data:JSON.stringify({"customerId":urlArr[1]}),
		async: false,
		success:function(data){
			
			$(".shopName").val(isNotNullAndUndifine(data.data.customerName));
  			$(".zhName").val(isNotNullAndUndifine(data.data.contactName));
  			$(".bankName").val(isNotNullAndUndifine(data.data.depositBank));
  			$(".bankNum").val(isNotNullAndUndifine(data.data.bankNumber));
  			$(".dzzt").val(isNotNullAndUndifine(data.data.substitutedCollectionName));
  			$(".companyRa").val(isNotNullAndUndifine(data.data.profitRateStr));
  			$(".bdRa").val(isNotNullAndUndifine(data.data.salesmanRate));
  			$(".allRa").val(isNotNullAndUndifine(data.data.poundageStr));
  			$(".BDpop").val(isNotNullAndUndifine(data.data.salesmanId));
  			$(".bzInfo").val(isNotNullAndUndifine(data.data.customerComment));
			
		},
		error:function(){
			console.log("err");
		}
	})
	
$(".creatShop").click(function(){
	$.ajax({
		type : "POST",
		url : "" + loction + "customer/updateCustomer",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({"customerId":urlArr[1],"customerName" : $(".shopName").val(),"contactName" : $(".zhName").val(),"depositBank" : $(".bankName").val(),"bankNumber" : $(".bankNum").val(),"substitutedCollectionId" : $(".dzzt").val(),"profitRateCreate" : $(".companyRa").val(),"salesManRateCreate" : $(".BDra").val(),"poundageCreate" : $(".allRa").val(),"salesmanName" : $(".BDpop").val(),"customerComment" : $(".bzInfo").val()}),
		async : false,
		success : function(data) {
			layer.msg(data.message);
			
		},
		error : function() {
			console.log("err");
		}
	})
})
$("#loginName").html(name);
 $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

