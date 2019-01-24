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
	                			<select class="paymentType">
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
							<td class="dzztDAL"><select id="dzzt" class="dzztdal substitutedCollectionId inputs"><option value="">请选择</option></select> 费率：<input style="text-align:center;" class="fl" readonly type="text" /></td>
						</tr>
						<tr>
							<td>公司手续费：</td>
							<td><input class="companyRa" type="text"/><b class="bfs">%</b></td>
						</tr>
						<tr>
							<td>BD人员提成比例：</td>
							<td><input class="Bdra" id="bdRa" type="text"/><b class="bfs">%</b></td>
						</tr>
						<tr>
							<td>总服务费：</td>
							<td><input readonly class="allRa num inputs" type="text"/><b class="bfs">%</b>	</td>
						</tr>
						<tr>
							<td>BD人员：</td>
							<td><select class="BDpop inputs BDpop1"><option value="">请选择</option></select> 联系方式：<input style="text-align:center;" class="bdphone" readonly type="text" /><a class="newBdCreat" href="javascript:;">新建BD人员</a></td>
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
	                                <button class="disable back ">取消</button> <button class="creatBd">创建</button>
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

dzztShow();
function dzztShow(){
	
}

//显示代征主体下拉框数据
$.ajax({
   type: "POST",
	  data:JSON.stringify(), 
   url: ""+loction+"/substitutedCollection/queryAllSubstitutedCollection",
   contentType: "application/json;charset=utf-8",
   dataType: "json",//预期服务器返回的数据类型
   async : false,
   success:function(data){
   	$.each(data.data,function(i,item){
   		str="<option id='xz"+item.substitutedCollectionId+"' data-fl="+item.substitutedCollectionRateStr+" value="+item.substitutedCollectionId+">"+item.substitutedCollectionName+"</option>";
   		$(".dzztdal").append(str);
   	})
   	
   },
   error:function(){
   	console.log("err");
   }
})

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
			if(data.status==200){
				$(".bdphone").val($(".newBdPhone").val())
				$(".shaow input").val("");
				$(".shaow").hide();
				$(".BDpop").empty();
			    bdCheck();
			}
		},
		error : function() {
			console.log("err");
		}
	})
})
bdCheck();
/* 读取BD */
	function bdCheck(){
		$.ajax({
			type : "POST",
			url : "" + loction + "salesman/queryAllSalesman",
			data : JSON.stringify({"topCustomerId" : orgPassid}),
			contentType : "application/json;charset=utf-8",
			async : false,
			success : function(data) {
				
				$.each(data.data,function(i,item){
					str="<option data-phone="+item.salesmanPhone+" value="+item.salesmanId+">"+item.salesmanName+"</option>";
			   		$(".BDpop").append(str);
			   	})
			},
			error : function() {
				console.log("err");
			}
		})
	}

$(".newBdCreat").click(function(){
	$(".newBdCreat_shaow").show();
})

  /* 修改回显 */
 var url=window.location.href;
 var urlArr = url.split('?');
 backfront();
 function backfront(){
	 $.ajax({
			type: "POST",
			url: ""+loction+"customer/queryCustomerDetail",
			contentType: "application/json;charset=utf-8",
			data:JSON.stringify({"customerId":urlArr[1]}),
			async: false,
			success:function(data){
				console.log(data);
				$(".shopName").val(isNotNullAndUndifine(data.data.customerName));
	  			$(".zhName").val(isNotNullAndUndifine(data.data.contactName));
	  			$(".bankName").val(isNotNullAndUndifine(data.data.depositBank));
	  			$(".bankNum").val(isNotNullAndUndifine(data.data.bankNumber));
	  			$(".dzztdal").val(isNotNullAndUndifine(data.data.substitutedCollectionId));
	  			$(".fl").val(isNotNullAndUndifine(data.data.substitutedCollectionRateStr)+"%");
	  			$(".companyRa").val(isNotNullAndUndifine(data.data.profitRateStr));
	  			$(".Bdra").val(isNotNullAndUndifine(data.data.salesmanRateStr));
	  			$(".allRa").val(isNotNullAndUndifine(data.data.poundageStr));
	  			$(".BDpop").val(isNotNullAndUndifine(data.data.salesmanId));
	  			$(".bdphone").val(isNotNullAndUndifine(data.data.salesmanPhone));
	  			$(".bzInfo").val(isNotNullAndUndifine(data.data.customerComment));	
	  			$(".paymentType").val(data.data.paymentType);
			},
			error:function(){
				console.log("err");
			}
		})
 }
	/* 创建修改 */
$(".creatShop").click(function(){
	 var re = /^[0-9]+.?[0-9]*/;
	 if(!re.test($(".num").val())){
		 layer.msg('请输入正确数值');
	 		return false;
	 }
	 
	 if($(".newShopform .inputs").val()==""){
		 layer.msg('不为空');
	 		return false;
	 }
	$.ajax({
		type : "POST",
		url : "" + loction + "customer/createCustomer",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({"paymentType":$(".paymentType").val(),"customerId":urlArr[1],"customerName" : $(".shopName").val(),"contactName" : $(".zhName").val(),"depositBank" : $(".bankName").val(),"bankNumber" : $(".bankNum").val(),"substitutedCollectionId" : $(".dzztdal").val(),"profitRateCreate" : $(".companyRa").val(),"salesManRateCreate" : $(".Bdra").val(),"poundageCreate" : $(".allRa").val(),"salesmanId" : $(".BDpop").val(),"customerComment" : $(".bzInfo").val()}),
		async : false,
		success : function(data) {
			layer.msg(data.message);
			if(data.status==200){
				  window.location.href=loction+"ad/html/shopList2.jsp?7";
			}
		},
		error : function() {
			console.log("err");
		}
	})
})
$("#loginName").html(name);
 $(".copicon").html(isNotNullAndUndifine(customerName1));
 
 $(".substitutedCollectionId").change(function(){
	   var ss=$(this).find("option:selected").attr("data-fl");
	   $(".fl").val(ss+"%");
 })
  $(".BDpop").change(function(){
	   var ss=$(this).find("option:selected").attr("data-phone");
	   $(".bdphone").val(ss);
 })
 
 /*是否为数字*/
 $(".num").blur(function(){
 	var re = /^[0-9]+.?[0-9]*/;
 	if(!re.test($(this).val())){
 		layer.tips('请输入正确数值', $(this));
 		return false;
 	} 
 	
 })
 
 $(".newShopform .inputs").blur(function(){
 	if($(this).val()==""){
 		layer.tips('不为空', $(this));
 		return false;
 	}	
 })
 
  $(".newShopform input").blur(function(){
	  var confv=$(".companyRa").val();
	  var bdfv=$(".Bdra").val();
	  if(confv==""){
		  confv=0;
	  }
	  if(bdfv==""){
		  bdfv=0;
	  }
	  var allcas=$(".dzztdal option:selected").attr("data-fl")*1+confv*1+bdfv*1;
	  allcas=allcas.toFixed(1);
	  if(isNaN(allcas)){
		  allcas="";
	  }
	  $(".allRa").val(allcas);
  }) 
</script>
</html>

