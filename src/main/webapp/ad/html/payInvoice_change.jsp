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
					</span> <i id="loginName"></i><b><img src="../images/icon_up.png" /></b> <em>
							<a class="resetPassword" style="border: 0;" href="javascript:;">重置密码</a>
							<a class="logout" href="javascript:;">退出登录</a>
					</em>
					</i>
				</p>
				<p class="shop_list_f add_invoices">修改模板</p>
				<div class="shop_list_f_form shop_list_f_form_modelAd add_invoicesuse">
					<table class="invoice_form">
						<tr>
							<td>模板名称：</td>
							<td><input class="modelName" type="text"/></td>
						</tr>
						<tr>
							<td>发票金额（元）：</td>
							<td><input class="invoiceSumStr num" type="text"/></td>
						</tr>
						<tr>
							<td>发票抬头：</td>
							<td><input class="invoiceTitle" type="text"/></td>
						</tr>
						<tr>
							<td>纳税人类型：</td>
							<td class="ts radios">
								<input class="ybns" value="0" name="check" type="radio" checked />一般纳税人  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="xgmns" value="1" name="check" type="radio"/>小规模纳税人 
								<input class="taxpayerType" type="hidden" />
							</td>							
						</tr>
						<tr>
							<td>纳税人识别号：</td>
							<td><input class="dutyParagraph num" type="text"/></td>
						</tr>
						<tr>
							<td>单位注册地址：</td>
							<td><input class="registeredAddress" type="text"/></td>
						</tr>
						<tr>
							<td>单位电话：</td>
							<td><input class="companyPhone num" type="text"/></td>
						</tr>
						<tr>
							<td>开户行：</td>
							<td class="ts"><input class="registedBank" type="text"/> 银行账号： <input class="bankNumber num" type="text"/></td>
						</tr>
						<tr>
							<td>发票内容：</td>
							<td>
								<select class="invoiceContent">
									<option value="">请选择</option>
									<option value="*信息技术服务*信息服务">*信息技术服务*信息服务</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>收件人：</td>
							<td><input class="recipient" type="text"/></td>
						</tr>
						<tr>
							<td>联系电话：</td>
							<td><input class="phoneNumber num" type="text"/></td>
						</tr>
						<tr>
							<td>收货地址：</td>
							<td><input class="address" type="text"/></td>
						</tr>
						<tr>
							<td></td>
							<td style="text-align:right;"><button onclick="window.history.go(-1)" class="disable backfat">取消</button> <button class="creatMod">修改开票</button></td>
						</tr>
					</table>
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
                                <button class="disable back">取消</button> <button disabled class="disable">确认</button>
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

/* 回显 */
var url2=window.location.href;
var urlArr2 = url2.split('?');
$(".creatMod").attr("data-id",urlArr2[1]);
$.ajax({
       type: "POST",
       url: ""+loction+"invoiceModel/queryInvoiceModelDetail",
       contentType: "application/json;charset=utf-8",
       data:JSON.stringify({"invoiceModelId":urlArr2[1]}),
       success:function(data){
       	$(".modelName").val(isNotNullAndUndifine(data.data.modelName))
       	$(".invoiceTitle").val(isNotNullAndUndifine(data.data.invoiceTitle))
       	$(".taxpayerType").val(isNotNullAndUndifine(data.data.taxpayerType))
       	$(".dutyParagraph").val(isNotNullAndUndifine(data.data.dutyParagraph))
       	$(".registeredAddress").val(isNotNullAndUndifine(data.data.registeredAddress))
       	$(".companyPhone").val(isNotNullAndUndifine(data.data.companyPhone))
       	$(".registedBank").val(isNotNullAndUndifine(data.data.registedBank))
       	$(".bankNumber").val(isNotNullAndUndifine(data.data.bankNumber))
       	$(".invoiceContent").val(isNotNullAndUndifine(data.data.invoiceContent))
       	$(".recipient").val(isNotNullAndUndifine(data.data.recipient))
       	$(".phoneNumber").val(isNotNullAndUndifine(data.data.phoneNumber))
       	$(".address").val(isNotNullAndUndifine(data.data.address))
       	$(".payInvoice").attr("data-index",isNotNullAndUndifine(data.data.invoiceModelId))
       	if(data.data.taxpayerType=="0"){
       		$(".ybns").attr('checked','true');
       	}else{
       		$(".xgmns").attr('checked','true');
       	}
           
       },
       error:function(){
       	console.log("err");
       }
   })

 /* 获取纳税人类型 */
$(".radios input").click(function(){
	$(".taxpayerType").val($(this).val());
	
})
   
   
   /* 修改模板 */
$(".creatMod").click(function(){
	$.ajax({
		type : "POST",
		url : "" + loction + "invoiceModel/createInvoiceModel",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({"invoiceModelId":$(this).attr("data-id"),"modelName" : $(".modelName").val(),"invoiceSumStr" : $(".invoiceSumStr").val(),"invoiceTitle" : $(".invoiceTitle").val(),"taxpayerType" : $(".taxpayerType").val(),"dutyParagraph" : $(".dutyParagraph").val(),"registeredAddress" : $(".registeredAddress").val(),"companyPhone" : $(".companyPhone").val(),"registedBank" : $(".registedBank").val(),"bankNumber" : $(".bankNumber").val(),"invoiceContent" : $(".invoiceContent").val(),"recipient" : $(".recipient").val(),"phoneNumber" : $(".phoneNumber").val(),"address" : $(".address").val(),}),
		async : false,
		success : function(data) {
		    window.history.go(-1)
			layer.msg(data.message)
		},
		error : function() {
			console.log("err");
		}
	})
})
   
   
   
   



 /*是否为数字*/
 $(".num").blur(function(){
 	var re = /^[0-9]+.?[0-9]*/;
 	if(!re.test($(this).val())){
 		layer.tips('请输入正确数值', $(this));
 		return false;
 	} 
 	
 })
 $(".invoice_form input").blur(function(){
 	if($(this).val()==""){
 		layer.tips('不为空', $(this));
 		return false;
 	}	
 })
$("#loginName").html(name);
$(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

