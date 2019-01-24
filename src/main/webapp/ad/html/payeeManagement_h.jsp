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
            <div class="right_dal other_p ">
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
                <p class="shop_list_f">收款人管理</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>收款人姓名：</li>
	                       <li><input class="payeeName" type="text"/></li>
	                   </ul>
	
						<ul>
	                       <li>收款人身份证号：</li>
	                       <li><input onkeyup="value=value.replace(/[\W]/g,'')" class="payeeId" type="text"/></li>
	                   </ul>
	                   <ul>
	                       <li>创建时间：</li>
	                       <li class="data_picker">
	                           <p>
	                               <input id="datetimeStart" readonly class="form_datetime" data-date-format="yyyy-mm-dd hh:ii" type="text"/><span>--</span>
	                               <input id="datetimeEnd" readonly class="form_datetime" data-date-format="yyyy-mm-dd hh:ii" type="text"/>
	                           </p>
	                       </li>
	                   </ul>
	                   <ul class="buttons">
	                       <li></li>
	                       <li><button disabled class="findEver disable">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<button class="disable reset">重置</button></li>
	                   </ul>
	                </div>	
	                <img id="images1" src="../images/tip3.png"/>
                    <img id="images2" src="../images/tip4.png"/>
                    <br/>
                    <button id="luru" class="dal_btn loadPeo">录入收款人</button>
	                <button id="shanghcuan" class="upPaypT dal_btn">上传文件</button>
                    <button id="daochu" class="dal_btn uploadText">导出模板</button>
                    <a target="blank" href="javascript:;" class="tips5"><img/><br/>右键保存二维码</a>
                    <div class="tablefat">
                    	<table class="table1">
	                        <thead>
	                            <tr>
	                                <td>收款人</td>
	                                <td>时间</td>
	                                <td>签约状态</td>
	                                <td>身份证</td>
	                                <td>身份证附件</td>
	                                <td>银行卡号</td>
	                                <td>推荐人</td>
	                                <td>认证状态</td>
	                                <td>状态</td>
	                                <td>备注</td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        </tbody>
	                    </table>
	                     <!--分页-->
	                    <div class="J_SelectPage module-pages-select" data-current-page="1" data-total-page="12">
	                        <span class="prev-btn">上一页</span>
	                        <!-- <span class="pages-list">
	                        </span> -->
	                        <span class="next-btn">下一页</span>
	                        <span class="pages-size"></span>
	                        <span class="goto-page">到第<input class="page_num" type="text" value="1" />页<a class="page_btn" href="javascript:void(0);">确定</a></span>
	                    </div>
                    </div>
                    <div class="shaow shaow1">
                        <div class="del_shaow">
                            <h1>操作</h1>
                            <div class="ever_text">
								<p>确认删除此条数据吗？</p>
                            </div>
                            <div class="btn_aera">
                                <button class="disable back">取消</button> <button class="deld">确认</button>
                            </div>
                        </div>
                    </div>
                    
                      <!-- 录入收款人  -->
                      <div style=" display:none; " class="shaow shaow3 register_P register_P2" >
                        <div class="del_shaow"> 
                          <h1>录入收款人</h1>
                          <div class="ever_text">
						<table>
                                  <tr>
                                      <td>姓名：</td>
                                      <td><p><input class="saveName" type="text"/></p></td>
                                  </tr>
                                  <tr>
                                      <td>身份证号：</td>
                                      <td><p><input onkeyup="value=value.replace(/[\W]/g,'')" class="saveId" type="text"/></p></td>
                                  </tr>
                                  <tr>
                                      <td>银行卡号：</td>
                                      <td><p><label style="display:none" class="allcards"></label><input class="saveyhId2 num" type="text"/><input class="saveyhId" type="hidden"/> <img class="addcard" src='../images/addzh.png'/></p></td>
                                  </tr>
                                  <tr>
                                      <td>推荐人：</td>
                                      <td><p><input class="savetjP" type="text"/><em>(选填)</em></p></td>
                                  </tr>
                                  <tr>
                                      <td></td>
                                      <td style="text-align:center;"><button class="disable backs">取消</button> <!-- <button class="savepeo2">保存并继续添加</button> --> <button class="savepeo">保存</button></td>
                                  </tr>
                              </table>
                      	</div>
                    </div>
                </div>	
                   <!-- 上传代付文件  -->
                <div style="display:none;" class="shaow shaow4 uploadText_s">
                        <div class="del_shaow">
                            <h1>上传代付文件<i>×</i></h1>
                            <form id="formSumbit" action="${baseUrl }/payee/uploadBatchPayee" method="post" enctype="multipart/form-data">
                            <div style="margin-top:68px;" class="ever_text">
								<table>
									<tr>
                                        <td colspan= 2>
                                        	<label>
                                        		<em class="upfiles_fa"></em>
                                        		<input class="upfiles" id="file" name="file" type="file" />
                                        		<button>选择文件</button>
                                        	</label>
                                        	
                                        </td>
                                    </tr>
								</table>
                                <div class="btn_aera">
	                            	<input class="disable back" type="button" value="取消"/>
	                            	<input class="submittex" type="submit" value="上传" />
	                           	 </div>
                            </div>
                           </form>
                        </div>
                    </div>
                    
                    
                    <div style="display:none;" class="shaow shaow2">
                        <div class="del_shaow">
                            <h1>修改</h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>商户名称：</td>
                                        <td><p><input class="customerName" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>账户名称：</td>
                                        <td><p><input class="contactName" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>开户行：</td>
                                        <td><p><input oninput = "value=value.replace(/[^\d]/g,'')" class="depositBank" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>银行卡号：</td>
                                        <td><p><input oninput = "value=value.replace(/[^\d]/g,'')" class="bankNumber" type="text"/></p></td>
                                    </tr>
                                    <tr class="dzzt_bod">
                                        <td>代征主体：</td>
                                        <td>
	                                        <p class="dzzt">
                                                <input readonly class="dzshow" value="请选择" type="text"/>
                                                <em><img src="../images/show.png"/></em>
	                                        	<span class="dzztList">
                                                     <label><input type="checkbox"><b></b>云职公司<i>11%</i></label>
	                                        	</span>
	                                        </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>服务费：</td>
                                        <td><p><input onkeyup="clearNoNum(this)" class="poundageStr" type="text"/><b class="bfs">%</b></p></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button style="margin-left:100px;" class="disable back">取消</button> <button class="change_info_sub">确认</button></td>
                                    </tr>
                                </table>
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
                                <button class="disable back ">取消</button> <button disabled class="disable checkPassword">确认</button>
                            </div>
                        </div>
                    </div>
                    <div style="display:none;" class="shaow shaow4 shaow4_login dks">
                        <div class="del_shaow">
                            <h1>打款</h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>银行卡号：</td>
                                        <td id="bankAccount" class="bknum"></td>
                                    </tr>
									<tr>
                                        <td>金额：</td>
                                        <td><p><input id="orderSum" type="text"/><input class="idCard" type="hidden"/><input class="orderName" type="hidden"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>代征主体：</td>
                                        <td><p><select id="subjectIds"><option value="">请选择</option></select></p></td>
                                    </tr>
								</table>
                            </div>
                            <div class="btn_aera">
                                <button class="disable back ">取消</button> <button id="saveOrUpdateBatch">确认</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </div>
</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/address.js"></script>
<script>
if(distributionType!=10){
	$('#luru').css("visibility","hidden")
	$('#shanghcuan').css("visibility","hidden")
	$('#daochu').css("visibility","hidden")
	$('#images1').css("visibility","hidden")
	$('#images2').css("visibility","hidden")
}

//导出收款人模板
$('#daochu').on("click",function(){
	//下载模板
   	window.location=""+loction+"payee/downloadPayeeModel";
})

//上传收款人
$('#formSumbit').submit(function (event) {
    //首先验证文件格式
    var fileName = $('#file').val();
    if (fileName === '') {
    	layer.msg('请选择文件', {
    	    time: 20000, //20s后自动关闭
    	    btn: ['知道了']
    	  });
        return false;
    }
    var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
    if (fileType !== 'xls' && fileType !== 'xlsx') {
    	layer.msg('文件格式不正确，excel文件！', {
    	    time: 20000, //20s后自动关闭
    	    btn: ['知道了']
    	  });
        return false;
    }
    var loadings = layer.load(1, {
		  shade: [0.1,'#fff'] //0.1透明度的白色背景
		});
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
        	   layer.close(loadings);
               layer.msg(data.message, {
	    	    time: 20000, //20s后自动关闭
	    	    btn: ['知道了']
	    	  });
               $(".shaow").hide();
               pageStart(1,10,orgPassid);
           },
           error : function(XHR, textStatus, errorThrown) {
        	   layer.close(loadings);
           	 layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus + "\nerrorThrown=" + errorThrown, {
	    	    time: 20000, //20s后自动关闭
	    	    btn: ['知道了']
	    	  });
           }
       });
 });
   
      var oldPassid="<%=UserHolder.getId()%>";
      var orgPassid="<%=UserHolder.getOrgId()%>";
     $("#datetimeStart").datetimepicker({
    	format: 'yyyy-mm-dd',
        autoclose: true,
        minView:'month',
        //todayBtn: true,
        language: 'en',
        /* pickerPosition: "bottom-left" */
    }); 
    
    $("#datetimeEnd").datetimepicker({
        format: 'yyyy-mm-dd',
        minView:'month',
        language: 'en',
        autoclose:true,
        startDate:new Date()
    }).on("click",function(){
        var startime=$("#datetimeStart").val()
        $("#datetimeEnd").datetimepicker("setStartDate",startime)
    });


    
    
    var pagestars=1;
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	payeeQueryName = $(".payeeName").val();
    	idCardNumber = $(".payeeId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,orgPassid,payeeQueryName,idCardNumber,dateBegin,dateEnd);
     	return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	payeeQueryName = $(".payeeName").val();
    	idCardNumber = $(".payeeId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,orgPassid,payeeQueryName,idCardNumber,dateBegin,dateEnd);
    	return pagestars
    })
    
    //下载凭证
    function downLoadIdCardImag(payeeIds){
    	var payeeId=$.trim(payeeIds);
    	//window.location=URLS.exports+"?id="+id;
    	window.location=""+loction+"payee/downLoadIdCardImag"+"?payeeId="+payeeId;
    }
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
            layer.msg("请输入正确页码")
        }else{
        	payeeQueryName = $(".payeeName").val();
        	idCardNumber = $(".payeeId").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	customerId = orgPassid;
        	$(".table1 tbody").html("");
        	$(".pages-size").html("");
        	pageStart(pagestars,10,orgPassid,payeeQueryName,idCardNumber,dateBegin,dateEnd);
    	    return pagestars
        }
    	
    })
    
    /* 收款人管理查询 */
    pageStart(1,10,orgPassid);
     
    $(".findEver").on("click",function(){
    	payeeQueryName = $(".payeeName").val();
    	idCardNumber = $(".payeeId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,orgPassid,payeeQueryName,idCardNumber,dateBegin,dateEnd);
    })
    
        $.ajax({
            type: "POST",
            url: ""+loction+"customer/queryTopCustomers",
            contentType: "application/json;charset=utf-8",
            success:function(data){
                 $.each(data.data,function(i,item){
                	var op="<option value="+item.customerId+">"+item.customerName+"</option>";
                	
                	$(".mainCustomerId").append(op);
                })
            },
            error:function(){
            	console.log("err");
            }
        })  
    function pageStart(pageNum,pageSize,orgPassid,payeeQueryName,idCardNumber,dateBegin,dateEnd){
		if(payeeQueryName){}else{payeeQueryName=""}
		if(orgPassid){}else{orgPassid=""}
		if(idCardNumber){}else{idCardNumber=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
		$(".table1 tbody").html("");
        $.ajax({
                type: "POST",
                url: ""+loction+"payee/queryFrontPayees",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"payeeQueryName":payeeQueryName,"customerId":orgPassid,"idCardNumber":idCardNumber,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    $.each(data.data.list,function(i,item){
                    	var contractWord2="";
                    	
                    	var changebtn="";
                    	var idcrd="";
                    	
                    	if(distributionType == 10){
                    		var banknums="";
                    		$.each(item.bankNumberList,function(i,item){
			            		 $(".allcards span").eq(item).css({"border-color":"red","color":"red"});
			            		   banknums+="<option val="+isNotNullAndUndifine(item)+">"+isNotNullAndUndifine(item)+"</option>";
			            	 })
			            	 banknums="<select class='yhsel'>"+banknums+"</select> <button class='fkzs'>付款</button>"
                    		/* var banknums="<select class='yhsel'><option val="+isNotNullAndUndifine(item.bankNumber)+">"+isNotNullAndUndifine(item.bankNumber)+"</option></select> <button class='fkzs'>付款</button>"; */
                    	}else{
                    		var banknums="";
                    		$.each(item.bankNumberList,function(i,item){
			            		 $(".allcards span").eq(item).css({"border-color":"red","color":"red"});
			            		 banknums+="<option val="+isNotNullAndUndifine(item)+">"+isNotNullAndUndifine(item)+"</option>";
			            	 })
			            	 banknums="<select class='yhsel'>"+banknums+"</select>"
                    		
                    	}
                    	if(item.contractWord=="null" || item.contractWord==null){
                    		contractWord2="";
                    	}else{
                    		contractWord2="<a href="+item.contractWord+">下载</a>";
                    	}
                    	if(item.customerName==null){item.customerName=""};
                    	if(item.principalName==null){item.principalName=""};
                    	if(item.commonTime==null){item.commonTime=""};
                    	if(item.updateTime==null){item.updateTime=""};
                    	if(item.balance==null){item.balance=""};
                    	if(item.substitutedCollectionName==null){item.substitutedCollectionName=""};
                    	if(item.poundage==null){item.poundage=""};
                    	if(item.LevelFlag==null){item.LevelFlag=""};
                    	if(item.customerComment==null){item.customerComment=""};    
                    	if(item.authenticatedStatus=="1"){
                    		changebtn="已认证";
                    	}else if(item.authenticatedStatus=="2"){
                    		changebtn="<i style='color:#FF5F67;'>认证失败<em data-index="+item.payeeId+" class='backrz'><img src='../images/f5.png'/></em></i>";
                    	}else if(item.authenticatedStatus=="0"){
                    		changebtn="<button data-index="+item.payeeId+" class='remake'>认证</button> <button data-index="+item.payeeId+" class='delscl'>取消</button>"
                    	}
                    	if(item.signedStatus=='1'){
                    		contractWord2='已签约'
                    	}else{
                    		contractWord2='未签约'
                    	}
                    	if(distributionType ==10){
                    		states = "<span class='slid_toggle'><img class='status"+item.usefulStatus+"' src='../images/hoverIcon.png'  data-index="+item.payeeId+" data-status="+item.usefulStatus+"></span>";
                    	}else{
                    		states = "";
                    	}
                    	if(isNotNullAndUndifine(item.idCardUp)==""|| isNotNullAndUndifine(item.idCardDown)==""){
                    		idcrd=""
                    	}else{
                    		idcrd="<span class='downloads' onclick='downLoadIdCardImag("+item.payeeId+")'></span>"
                    	}
                   		var tr="<tr><td id='orderName'>"+item.payeeName+"</td>\
                       	<td>"+formatDateA(item.createTime)+"</td>\
                       	<td>"+isNotNullAndUndifine(contractWord2)+"</td>\
                       	<td id='idCard'>"+isNotNullAndUndifine(item.idCardNumber)+"</td>\
                       	<td>"+idcrd+"</td>\
                       	<td>"+banknums+"</td>\
                       	<td>"+isNotNullAndUndifine(item.recommendPayeeName)+"</td>\
                       	<td>"+changebtn+"</td>\
                       	<td>"+states+"</td>\
                       	<td>"+isNotNullAndUndifine(item.payeeComment)+"</td></tr>";
                    	$(".table1 tbody").append(tr);
                    })
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
    
    
     $(".dels").live("click",function(){
    	 $(".shaow1").show(); 
    	 $(".deld").attr("data-del",$(this).attr("data-index"))
     })
    
    
     $(".deld").click(function(){
    	$.ajax({
            type: "POST",
            url: ""+loction+"customer/updateCustomer",
            contentType: "application/json;charset=utf-8",
              data:JSON.stringify({"customerId":$(".deld").attr("data-del"),"flag":0}), 
            success:function(data){
            	$(".table1 tbody").html("");
            	pageStart(1,10);
            	$(".shaow1").hide();
            },
            error:function(){
            	console.log("err");
            }
        })  
        
    }) 
    $("._input input[type='text'],select").on("input change click",function(evt){
    	  if($(this).val().length){
    	    $(".findEver").removeAttr("disabled").removeClass("disable");
    	  }else{
    	    $(".findEver").prop("disabled","disabled").addClass("disable");
    	  }
    	});
     
    $(".reset").click(function(){
    	$(".findEver").prop("disabled","disabled").addClass("disable");
    	$("input[type='text'],select").val("");
    	$(".table1 tbody").html("");
    	pageStart(1,10,orgPassid);
    })
    

       //修改操作获取当前信息
       $.ajax({
	        type: "POST",
	     	data:JSON.stringify({"customerId":orgId}),
	        url: ""+loction+"/customer/queryCustomerDetail",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	$(".tips5").attr("href",data.data.twoDimensionCode)
	        	$(".tips5 img").attr("src",data.data.twoDimensionCode);
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
    
    $(".change_info_sub").click(function(){
    	num=$(this).attr("data-index");
    	if($(".customerName").val()==""){
    		layer.tips('不能为空', '.customerName');
    		return false;
    	}
    	if($(".contactName").val()==""){
    		layer.tips('不能为空', '.contactName');
    		return false;
    	}
    	if($(".depositBank").val()==""){
    		layer.tips('不能为空', '.depositBank');
    		return false;
    	}
    	if($(".bankNumber").val()==""){
    		layer.tips('不能为空', '.bankNumber');
    		return false;
    	}
    	if($(".bankNumber").val().length>19 || $(".bankNumber").val().length<16){
    		layer.tips('请输入正确卡号', '.bankNumber');
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
    	ChangeInfo(num);
    })
    
    function ChangeInfo(customerId,status,newPageNume){
		   	text = $(".dzzt_bod input:checkbox:checked").map(function(index,elem) {
		           return $(elem).val();
		       }).get().join(',');	
        	$.ajax({
                type: "POST",
                url: ""+loction+"customer/updateCustomer",
                contentType: "application/json;charset=utf-8",
                  data:JSON.stringify({"customerId":customerId,"customerName":$(".customerName").val(),"contactName":$(".contactName").val(),"depositBank":$(".depositBank").val(),"bankNumber":$(".bankNumber").val(),"substitutedCollectionId":text,"poundageCreate":$(".poundageStr").val()}), 
                success:function(data){
                	
    	        	layer.msg(data.message, {
    		    	    time: 20000, //20s后自动关闭
    		    	    btn: ['知道了']
    		    	  });
                },
                error:function(){
                	console.log("err");
                }
            }) 
        } 
    

    /* 修改状态 */
    $("body .slid_toggle").live("click",function(){
    	newPageNume=$(".pages-size em i").first().text();
    	customerId=$(this).find("img").attr("data-index");
    	if($(this).find("img").attr("data-status")==0){
    		$(this).find("img").removeClass("status0").addClass("status1").attr("data-status","1")
    		statusChange(customerId,1,newPageNume)
    	}else{
    		customerId=$(this).find("img").attr("data-index")
    		$(this).find("img").removeClass("status1").addClass("status1").attr("data-status","0")
    		statusChange(customerId,0,newPageNume)
    	}
})

	function statusChange(customerId,status,newPageNume){
	    	$.ajax({
	            type: "POST",
	            url: ""+loction+"payee/updatePayee",
	            contentType: "application/json;charset=utf-8",
	              data:JSON.stringify({"payeeId":customerId,"usefulStatus":status}), 
	            success:function(data){
	            	$(".table1 tbody").html("");
	            	pageStart(pagestars,10,orgPassid);
	            },
	            error:function(){
	            	console.log("err");
	            }
	          })
	    }
    
   $(".remake").live("click",function(){
	   $.ajax({
           type: "POST",
           url: ""+loction+"payee/updatePayee",
           contentType: "application/json;charset=utf-8",
             data:JSON.stringify({"payeeId":$(this).attr("data-index"),"authenticatedStatus":1}), 
           success:function(data){
           	$(".table1 tbody").html("");
           	pageStart(1,10,orgPassid);
           },
           error:function(){
           	console.log("err");
           }
         })
   })
	$(".delscl").live("click",function(){
	   $.ajax({
           type: "POST",
           url: ""+loction+"payee/updatePayee",
           contentType: "application/json;charset=utf-8",
             data:JSON.stringify({"payeeId":$(this).attr("data-index"),"authenticatedStatus":2}), 
           success:function(data){
           	$(".table1 tbody").html("");
           	pageStart(1,10,orgPassid);
           },
           error:function(){
           	console.log("err");
           }
         })
     })
     
     $(".backrz").live("click",function(){
	   $.ajax({
           type: "POST",
           url: ""+loction+"payee/updatePayee",
           contentType: "application/json;charset=utf-8",
             data:JSON.stringify({"payeeId":$(this).attr("data-index"),"authenticatedStatus":0}), 
           success:function(data){
           	$(".table1 tbody").html("");
           	pageStart(1,10,orgPassid);
           },
           error:function(){
           	console.log("err");
           }
         })
     })
     
     $(".loadPeo").click(function(){
    	 $(".register_P").show();
     })
     
     $(".savepeo").click(function(){
    	 if($(".saveId").val()){
    		 var idCardNumber=$(".saveId").val().toUpperCase()
    	 }
    	 if($(".saveyhId").val()){
    		 var saveyhidArr=$(".saveyhId").val().split(",")
    	 }
    	 $(this).attr("disabled","disabled");
    	 $.ajax({
             type: "POST",
             url: ""+loction+"payee/createPayee",
             contentType: "application/json;charset=utf-8",
               data:JSON.stringify({"payeeName":$(".saveName").val(),"idCardNumber":idCardNumber,"bankNumberList":saveyhidArr}), 
             success:function(data){
            	 $(".savepeo").removeAttr("disabled");
            	 $.each(data.data,function(i,item){
            		 console.log(item);
            		 $(".allcards span").eq(item).css({"border-color":"red","color":"red"});
            	 })
            	 if(data.status==200){
            		 $(".table1 tbody").html("");
                 	 $(".register_P").hide();
                 	 $(".register_P input").val("");
                 	$(".allcards").hide();
           		 	$(".saveyhId").val("");
           		 	$(".saveyhId2").val("").show();
                 	pageStart(1,10,orgPassid);
            	 }else{
            		 layer.msg(data.message, {
         	    	    time: 20000, //20s后自动关闭
        	    	    btn: ['知道了']
        	    	  })
            	 }
             	
             },
             error:function(){
            	$(".savepeo").removeAttr("disabled");
             	console.log("err");
             }
           })
     })
    /*  $(".savepeo2").click(function(){
    	 if($(".saveId").val()){
    		 var idCardNumber=$(".saveId").val().toUpperCase()
    	 }
    	 $(this).attr("disabled","disabled");
    	 $.ajax({
             type: "POST",
             url: ""+loction+"payee/createPayee",
             contentType: "application/json;charset=utf-8",
               data:JSON.stringify({"payeeName":$(".saveName").val(),"idCardNumber":idCardNumber,"bankNumber":$(".saveyhId").val()}), 
             success:function(data){
            	 $(".savepeo2").removeAttr("disabled");
            	 if(data.status==200){
            		 $(".table1 tbody").html("");
                 	 $(".register_P input").val("");
                 	pageStart(1,10,orgPassid);
            	 }else{
            		 layer.msg(data.message, {
         	    	    time: 20000, //20s后自动关闭
        	    	    btn: ['知道了']
        	    	  })
            	 }
             },
             error:function(){
            	$(".savepeo2").removeAttr("disabled");
             	console.log("err");
             }
           })
     }) */
     
 /*是否为数字*/
 $(".num").blur(function(){
 	var re = /^[0-9]+.?[0-9]*/;
 	if(!re.test($(this).val())){
 		layer.tips('请输入正确数值', $(this));
 	} 
 	
 })
$(".upPaypT").click(function(){
	$(".uploadText_s").show();
})

$(".upfiles").change(function(){
   	$(".upfiles_fa").text("已选择");
   })
   
   
$(".fkzs").live("click",function(){
	$(".orderName").val($(this).parent().parent().find("#orderName").text())
	$(".idCard").val($(this).parent().parent().find("#idCard").text())
	$(".bknum").text($(this).prev().val());
	$.ajax({
		type : "POST",
		url : "" + loction + "substitutedCollection/querySubjects.do",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(""),
		async : false,
		success : function(data) {
			var flg = isMainOrgId();
			if(flg==0){
				//为Select追加一个Option(下拉项)
				$("#subjectIds").empty()
				$.each(data.listSubjects, function(i, item) {
					$("#subjectIds").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
				});
			}else{
				$("#subjectIds").html("");
				$.each(data.listSubjects, function(i, item) {
					$("#subjectIds").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
				})
				//$("#subjectIds").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
			}
		},
		error : function() {
			console.log("err");
		}
	})
	$(".dks").show();
}) 

//单次代付保存
	$("#saveOrUpdateBatch").on("click",function(){
		var orderName = $(".orderName").val();
		if($(".idCard").val()){
	   		 var idCard=$(".idCard").val().toUpperCase()
	   	 }
		var bankAccount = $("#bankAccount").text();
		var subjectId = $("#subjectIds").val();
		var orderSum = $("#orderSum").val();
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
		var pattern =/^[1-9]\d*$/;
		 if(orderName==""){
    		layer.tips('不能为空', '#orderName');
    		return false;
        }
		if(reg.test(idCard) === false) {  
	       layer.tips("请输入正确的身份证","#idCard");  
	       return  false;  
		}
		if(pattern.test(bankAccount) === false){
    		layer.tips('请输入正确数值', '#bankAccount');
    		return false;
        }
		if(subjectId==""){
    		layer.tips('不能为空', '#subjectIds');
    		return false;
        }
		 if(orderSum==""){
    		layer.tips('不能为空', '#orderSum');
    		return false;
        }  
		if(!/^[-]?[0-9]*\.?[0-9]+(eE?[0-9]+)?$/.test(orderSum)){
			layer.tips('请输入正确数值', '#orderSum');
	        return false;
	    }
		var data={
   			"orderName":orderName,
   			"idCard":idCard,
   			"bankAccount":bankAccount,
   			"subjectId":subjectId,
   			"orderSum":orderSum
    	}
		$(this).attr("disabled","disabled");
		$.ajax({
            type: "POST",
            url: ""+loction+"paymentBatch/saveOrUpdateBatch.do",
            contentType: "application/json;charset=utf-8",
            data:JSON.stringify(data),
            success:function(data){
            	console.log(data.msg);
            	layer.msg(data.msg, {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            	$("#saveOrUpdateBatch").removeAttr("disabled");
            	if(data.flg){
            		$(".dks input").val("");
                	$(".shaow").hide();
                	
            	}
            },
            error:function(){
            	layer.msg("保存出现异常", {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            	$("#saveOrUpdateBatch").removeAttr("disabled");
            }
    	})
	})
 
	 $(".addcard").click(function(){
		 if($(".saveyhId2").val()!=""){
			 layer.prompt({title: '添加银行卡', formType: 3}, function(text, index){
				$(".allcards").html("");
			    layer.close(index);
			    $(".saveyhId").val($('.saveyhId').val()+","+text)
			    text1=$('.saveyhId').val().split(",");	   
			    $.each(text1,function(i, item){
			    	item2=item.substring(0,4);
		    	   $(".allcards").append("<span title="+item+">"+item2+"</span>")
		    	});
			    $(".saveyhId2").hide();
			    $(".allcards").show();
			  })
		 }
		  
	 })
	 
	 $(".backs").click(function(){
		 $(".shaow").hide();
		 $(".register_P2 input").val("");
		 $(".allcards").hide();
		 $(".saveyhId").val("");
		 $(".saveyhId2").val("").show();
	 })
	 
 
 $("#loginName").html(name); 
 $(".copicon").html(isNotNullAndUndifine(customerName1));
  $(".layui-layer-input").live("input",function(){
	  $(this).val($(this).val().replace(/[^\d]/g,''))
  })
  $(".saveyhId2").live("input",function(){
	  $(this).val($(this).val().replace(/[^\d]/g,''))
	  $(".saveyhId").val($(this).val())
  })
  $(".allcards span").live("click",function(){
	  var indexs=$(this).index();
	  layer.prompt({title: '修改银行卡', formType: 3, value:$(this).attr('title')}, function(text, index){
	    layer.close(index);
	    console.log($(this).index())
	    var arr=$(".saveyhId").val().split(",")
	    arr.splice(indexs,1,text);
	    $(".allcards").html("");
	    $.each(arr,function(i, item){
	    	item2=item.substring(0,4);
    	   $(".allcards").append("<span title="+item+">"+item2+"</span>")
    	});
	   $(".saveyhId").val(arr.join(","))
	   if ($('.allcards').is(":empty")) {
			$(".allcards").hide();
			$(".saveyhId").val("");
			$(".saveyhId2").val("").show();
		 }
	  })
	  
	  
	 /*  console.log($(this).index());
	  index=$(this).index();
	  var arr=$(".saveyhId").val().split(",")
	   arr.splice(index,1);
	   $(".saveyhId").val(arr.join(","))
	  $(this).remove();
	  if ($('.allcards').is(":empty")) {
		$(".allcards").hide();
		$(".saveyhId").val("");
		$(".saveyhId2").val("").show();
	 } */
  })
 </script>
 </html>

