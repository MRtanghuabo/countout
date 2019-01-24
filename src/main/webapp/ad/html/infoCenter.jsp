<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="tag.jsp"%>
<body>
	<div style="overflow:hidden;" class="shop_wrap">
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
				<p class="shop_list_f add_invoices">消息中心<button class="button goinfo">前往操作日志</button></p>
				<div class="shop_list_f_form shop_list_f_form_modelAd info_center">
				<div style="overflow:hidden;" >
					<ul class="infocen">
					</ul>
				</div>
			</div>
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
<script src="../js/address.js"></script>
<script>
var oldPassid="<%=UserHolder.getId()%>";

autoInfo();
function autoInfo(){
	$.ajax({
		type : "POST",
		url : "" + loction + "remind/queryListMsg.do",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(),
		success:function(data) {
			
			 $.each(data.remindList,function(i,item){
				 if(item.readstate==0){
					 var str="<li data-adress="+item.permissionId+" data-index="+item.id+"><em><img src='../images/info_icon.png'/></em>"+item.context+"<span>"+formatDateA(item.createTime)+"</span></li>";
				 }else{
					 var str="<li data-adress="+item.permissionId+" data-index="+item.id+"><em><img class='yd' src='../images/info_icon.png'/></em>"+item.context+"<span>"+formatDateA(item.createTime)+"</span></li>";
				 }
				
				$(".infocen").append(str);
			}) 
		},
		error : function() {
			console.log("err");
		}
	})
}

  $(".infocen li").live("click",function(){$.ajax({
		type : "POST",
		url : "" + loction +"remind/updateRemindmessageHandlestate.do",
		data:JSON.stringify({"id":$(this).attr("data-index")}), 
		contentType : "application/json;charset=utf-8",
		async : false,
		success : function(data) {
			
			$(".infocen").text("");
			autoInfo();
		},
		error : function() {
			console.log("err");
		}
	}) 
	  window.location.href=loction+$(this).attr("data-adress");
	  
 }) 
$(".goinfo").click(function(){
	window.location.href=loction+"ad/html/operateLog.jsp?7";
})


$("#loginName").html(name);
 $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

