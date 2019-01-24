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
				<p class="shop_list_f add_invoices">添加模板</p>
				<div class="shop_list_f_form shop_list_f_form_modelAd">
					<div class="invoices">
					</div>
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
								<input value="0" name="check" type="radio" />一般纳税人  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input value="1" name="check" type="radio"/>小规模纳税人 
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
							<td class="ts"><input class="registedBank" type="text"/> 银行账号： <input class="bankNumber" type="text"/></td>
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
							<td style="text-align:right;"><button onClick="javascript :history.back(-1);" class="disable">取消</button> <button class="creatMod">保存</button></td>
						</tr>
					</table>
				</div>
				<!-- 模板删除  -->
                <div style="" class="shaow shaow1 voidDel">
                      <div class="del_shaow">
                          <h1>模板删除</h1>
                          <div class="ever_text">
						<p>确认删除此张模板吗？</p>
                          </div>
                          <div class="btn_aera">
                              <button class="disable back ">取消</button> <button class="deldMOD">删除</button>
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

/* 头部模板读取 */
modalCk();
function modalCk(){
	$.ajax({
        type: "POST",
        url: ""+loction+"invoiceModel/queryInvoiceModels",
        contentType: "application/json;charset=utf-8",
        success:function(data){
        	
        	var p="";
             $.each(data.data,function(i,item){
            	 p+="<p><span>"+item.modelName+"</span><i data-index="+item.invoiceModelId+"></i></p>";
            })
            if(data.data.length>=6){
            
            }else{
            	p=p+"<p class='addIon'><a href='invoiceVoid_add_h.jsp'></a></p>"
            }
            $(".invoices").append(p);
        },
        error:function(){
        	console.log("err");
        }
    }) 
}
/* 获取纳税人类型 */
$(".radios input").click(function(){
	$(".taxpayerType").val($(this).val());
	
})

/* 创建模板 */
$(".creatMod").click(function(){
	
	$.ajax({
		type : "POST",
		url : "" + loction + "invoiceModel/createInvoiceModel",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({"modelName" : $(".modelName").val(),"invoiceSumStr" : $(".invoiceSumStr").val(),"invoiceTitle" : $(".invoiceTitle").val(),"taxpayerType" : $(".taxpayerType").val(),"dutyParagraph" : $(".dutyParagraph").val(),"registeredAddress" : $(".registeredAddress").val(),"companyPhone" : $(".companyPhone").val(),"registedBank" : $(".registedBank").val(),"bankNumber" : $(".bankNumber").val(),"invoiceContent" : $(".invoiceContent").val(),"recipient" : $(".recipient").val(),"phoneNumber" : $(".phoneNumber").val(),"address" : $(".address").val(),}),
		async : false,
		success : function(data) {
			if(data.status==300){
				layer.msg(data.message);
			}else{
				window.history.go(-1);
			}
			$(".invoices").html('')
			modalCk();
			
		},
		error : function() {
			console.log("err");
		}
	})
})

  /* 删除发票模板 */
  $(".invoices p i").live("click",function(){
  	$(".voidDel").show();
  	$(".deldMOD").attr("data-dal",$(this).attr("data-index"));
  	 
  })
  $(".deldMOD").click(function(){
  	var invoiceModelId=$(this).attr("data-dal")
  	dalMmod(invoiceModelId);
  })
  
  function dalMmod(invoiceModelId){
  	$.ajax({
          type: "POST",
          url: ""+loction+"invoiceModel/deleteInvoiceModel",
          contentType: "application/json;charset=utf-8",
          data : JSON.stringify({"invoiceModelId" : invoiceModelId}),
          success:function(data){
          	$(".invoices").html('')
          	modalCk();
          	$(".shaow").hide();
          },
          error:function(){
          	console.log("err");
          }
      })  
   }

 /*是否为数字*/
 $(".num").blur(function(){
 	var re = /^[0-9]+.?[0-9]*/;
 	if(!re.test($(this).val())){
 		layer.tips('请输入正确数值', $(this));
 	} 
 	
 })
 $(".invoice_form input").blur(function(){
 	if($(this).val()==""){
 		layer.tips('不为空', $(this));
 	
 	}	
 })

$("#loginName").html(name);
$(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

