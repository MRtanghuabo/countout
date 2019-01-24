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
				<p class="shop_list_f add_invoices">账户信息</p>
				<div class="shop_list_f_form shop_list_f_form_modelAd">
					<table class="invoice_form newShopform">
						<tr style="border:0;" class="title">
							<td>基本信息</td>
							<td></td>
						</tr>
						<tr>
							<td>商户名称：</td>
							<td id="customerName"></td>
						</tr>
						<tr>
							<td>账号ID：</td>
							<td id="username"></td>
						</tr>
						<tr class="title">
							<td>收款账户信息</td>
							<td></td>
						</tr>
						<tr>
							<td>账户名：</td>
							<td id="contactName">
								
							</td>							
						</tr>
						<tr>
							<td>开户行：</td>
							<td id="depositBank">
								
							</td>							
						</tr>
						<tr>
							<td>银行卡号：</td>
							<td id="bankNumber">
								
							</td>							
						</tr>
						<tr class="title">
							<td>代征主体</td>
							<td></td>
						</tr>
						</table>
						<table class="invoice_form newShopform" id="rate">
						</table>
						<table class="invoice_form newShopform">
							<tr class="title">
								<td>收款人签约协议</td>
								<td></td>
							</tr>
						</table>
					<div class="xieyUp">
						<form id="formSumbit" action="${baseUrl }/customer/uploadCustomerModel" method="post" enctype="multipart/form-data">
							<label class="filesf">
                          		<input id="file" name="file" type="file"/>
                          		<a style="display:none;" href="javascript:;" class="oldxy"><em id="files"></em></a>
                          	</label>
							<div id="btn_aera" class="btn_aera">
								<input id="customerId" name="customerId" type="hidden" />
								<input class="button" id="submit" type="submit" value="上传">
								<input class="button" id="resubmit" value="重新上传" style="display:none">
                          	 </div>
						</form>
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
$("#loginName").html(name);
$("#customerId").val(orgId);

//上传代付款文件
$('#formSumbit').submit(function (event) {
    //首先验证文件格式
    var fileName = $("#file").val();
    if (fileName === '') {
    	layer.msg('请选择文件');
        return false;
    }
    var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
    if (fileType !== 'doc' && fileType !== 'docx') {
    	layer.msg('文件格式不正确，word文件！');
        return false;
    }
    
    $("#files").text(fileName.substring(fileName.lastIndexOf("\\")+1));
    event.preventDefault();
    var form = $(this);
    
    // mulitipart form,如文件上传类
    var formData = new FormData(this);
    $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: formData,
        dataType: "JSON",
        mimeType: "multipart/form-data",
        contentType: false,
        cache: false,
        processData: false,
        success : function(data) {
            layer.msg(data.message);
            if(data.status==200){
            	$("#resubmit").show();
            	$("#submit").hide();
            	$(".oldxy").show();
            	
            }
        },
        error : function(XHR, textStatus, errorThrown) {
        	 layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus + "\nerrorThrown=" + errorThrown);
        }
    });
 });

$.ajax({
	type : "POST",
	url : "" + loction + "customer/queryCustomerDetail",
	contentType : "application/json;charset=utf-8",
	data : JSON.stringify({"customerId":orgId}),
	async : false,
	success : function(data) {
		var datas = data.data;
		if(data.status==200){
			$("#customerName").text(datas.customerName);
			$("#username").text(username);
			$("#subject").text(datas.substitutedCollectionName);
			$("#subjectRa").text(datas.substitutedCollectionRateStr);
			$("#contactName").text(datas.contactName);
			$("#depositBank").text(datas.depositBank);
			$("#bankNumber").text(datas.bankNumber);
			if(distributionType == 40){
				if(datas.paymentTemplate !=null && datas.paymentTemplate != ""){
					$("#submit").hide();
					$("#resubmit").show();
					$("#files").text(datas.paymentTemplate.substring(datas.paymentTemplate.lastIndexOf("/")+1));
					$(".oldxy").attr("href",loction+data.data.contractWord);
					$(".oldxy").show();
				}else{
					$("#submit").show();
					
				}
			}else{
				$("#submit").hide();
			}			
		}else{
			layer.msg(data.message);
		}
	},
	error : function() {
		console.log("err");
	}
})

$("#resubmit").click(function(){
	$(this).hide();
	$("#submit").show();
	$(".oldxy").hide();
	
})

//查询所有代征主题
$.ajax({
	type : "POST",
	url : "" + loction + "substitutedCollection/queryAllSubstitutedCollection",
	contentType : "application/json;charset=utf-8",
	data : JSON.stringify(""),
	async : false,
	success : function(data) {
		if(data.status==200){
			var str = "";
			$.each(data.data,function(i,item){
				str += "<tr><td>"+item.substitutedCollectionName+" 费率（%）：</td><td> "+item.substitutedCollectionRateStr+"</td></tr>"
			})
			$("#rate").html(str);
		}else{
			layer.msg(data.message);
		}
	},
	error : function() {
		console.log("err");
	}
})
$("#file").change(function(){
	$("#files").text("已选择");
	$(".xieyUp label a").show();
   	$(".filesf").css("background","url(../images/upload2.png) no-repeat center center");
   })
$(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

