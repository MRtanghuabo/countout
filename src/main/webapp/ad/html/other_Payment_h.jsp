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
                <p class="shop_list_f">代付款管理</p>
                
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>批次号</li>
	                       <li>
	                           <input id="batchId" class="batchId" type="text"/>
	                       </li>
	                   </ul>
	                   <ul>
	                       <li>审批状态</li>
	                       <li>
	                           <select id="approvalStatus" class="approvalStatus">
	                           		<option value="">请选择</option>
	                           		<option value="0">待审核</option>
	                           		<option value="1">审核通过</option>
	                           		<option value="2">驳回</option>
	                           </select>
	                       </li>
	                   </ul>   
	                   <ul>
	                       <li>申请时间：</li>
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
                    <button id="danci" class="dal_btn singlePay">单次代付</button>
                    <button id="wenjian" onclick="download()" class="dal_btn">导出模板</button>
                    <button id="shangchuan" onclick="showUploadText_s()" class="dal_btn uploadText">上传代付文件</button>
                    <img id="tupian" src="../images/tips.png"/>
                    <div class="tablefat">
	                    <table class="table1">
	                        <thead>
	                            <tr>
	                                <td>批次号</td>
	                                <td>上传文件名</td>
	                                <td>代付总金额（元）</td>
	                                <td>代付总笔数</td>
	                                <td>申请人</td>
	                                <td>审核状态</td>
	                                <td>审核人</td>
	                                <td>申请时间</td>
	                                <td>审核时间</td>
	                                <td>备注</td>
	                                <td>审核</td>
	                                <td>操作</td>
	                            </tr>
	                            
	                        </thead>
	                        <tbody>
	                        	<tr>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <!--分页-->
	                    <div class="J_SelectPage module-pages-select" data-current-page="1" data-total-page="12">
	                        <span class="prev-btn">上一页</span>
	                        <span class="pages-list">
	                        </span>
	                        <span class="next-btn">下一页</span>
	                       <span class="pages-size"></span>
	                       <span class="goto-page">到第<input class="page_num" type="text" value="1" />页<a class="page_btn" href="javascript:void(0);">确定</a></span>
	                    </div>
                    </div>
                    
                    <!-- 文件详情  -->
                    <div style="display:none;" class="shaow shaow3 textDal" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>文件详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
                                    <thead>
                                    	<tr>
                                    		<td>批次号</td>
                                    		<td>代付总笔数</td>
                                    		<td>总金额（元）</td>
                                    		<td>备注</td>
                                    	</tr>
                                    </thead>
                                    <tbody>
                                    	<tr id="batchs">
                                    		
                                    	</tr>
                                    </tbody>
                                </table>
                                <table>
                                	<thead>
                                		<tr>
                                			<td>商户订单号</td>
                                			<td>收款账号</td>
                                			<td>收款户名</td>
                                			<td>身份证号</td>
                                			<!-- <td>联系电话</td> -->
                                			<td>打款金额（元）</td>
                                		</tr>
                                	</thead>
                                	<tbody id="listOrder">
                                		<tr>
                                			
                                		</tr>
                                	</tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                 <!-- 确认付款第一次  -->
                <div style="" class="shaow shaow1 firQe">
                      <div class="del_shaow">
                          <h1>确认付款</h1>
                          <div class="ever_text">
						<p>确认同意此批次付款吗？</p>
                          </div>
                          <div class="btn_aera">
                              <button class="disable back">取消</button> <button class="deld firsta">同意</button>
                          </div>
                      </div>
                  </div>
                  
                   <!-- 确认付款第二次  -->
                <div style="" class="shaow shaow1 secQe">
                      <div class="del_shaow">
                          <h1>二次确认</h1>
                          <div class="ever_text">
						<p>同意后，将从您的账户支付<i class="secpayNum">100.00</i>元</p>
                          </div>
                          <div class="btn_aera">
                              <button class="disable back ">取消</button> <button class="deld fanpay">同意</button>
                          </div>
                      </div>
                  </div>
                
                <!-- 单次代付  -->
                <div style="display:none;" class="shaow shaow3 singlePay_s" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>单次代付</h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>收款户名：</td>
                                        <td><p><input id="orderName" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>身份证号：</td>
                                        <td><p><input onkeyup="value=value.replace(/[\W]/g,'')" id="idCard" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>收款账号：</td>
                                        <td><p><input oninput = "value=value.replace(/[^\d]/g,'')" id="bankAccount" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>代付金额（元）：</td>
                                        <td><p><input id="orderSum" type="text"/></p></td>
                                    </tr>
                                    <tr class="dzzt_bod">
                                        <td>代征主体：</td>
                                        <td>
	                                        <p>
	                                        	<select id="subjectIds">
	                                        		<option value="">请选择</option>
	                                        	</select>
	                                        </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                        	<button class="disable back">取消</button> 
                                        	<button id="saveOrUpdateBatch">申请打款</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <!-- 上传代付文件  -->
                <div style="display:none;" class="shaow shaow5 uploadText_s">
                        <div class="del_shaow">
                            <h1>上传代付文件<i>×</i></h1>
                            <form id="formSumbit" action="${baseUrl }/paymentBatch/uploadBatch.do" method="post" enctype="multipart/form-data">
                            <div class="ever_text">
								
								<table>
									<tr>
                                        <td colspan= 2>
                                        	<label>
                                        		<em class="upfiles_fa"></em>
                                        		<input class="upfiles" name="file" type="file"/>
                                        		<button>选择文件</button>
                                        	</label>
                                        	
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>代征主体：</td>
                                        <td>
                                        	<p>
	                                        	<select id="subjectId" name="subjectId">
	                                        		<option value="">请选择</option>
	                                        	</select>
                                        	</p>
                                        </td>
                                    </tr>
								</table>
                                <div class="btn_aera">
	                            	<input class="disable back" type="button" value="取消"/>
	                            	<input class="submittex" type="submit" value="确认"/>
	                           	 </div>
                            </div>
                           </form>
                        </div>
                    </div>
                    
                     <!-- 重置密码(右上 -->
                    <div style="display:none;" class="shaow shaow4">
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
                    <div style="display:none;" class="shaow shaow_bh">
                        <div class="del_shaow">
                            <h1>驳回原因</h1>
                            <div class="ever_text">
                               <p>驳回原因：<textarea class="bhinfo" maxlength="30"></textarea></p>
                            </div>
                            <div class="btn_aera">
                                <button class="disable back ">取消</button> <button class="backsus">确认</button>
                            </div>
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
<script src="../js/common.js"></script>
<script src="${ctx}/ad/js/md5.js"></script>

<script>
if(distributionType != 10){
	$('#danci').hide();
	$('#wenjian').hide();
	$('#shangchuan').hide();
	$('#tupian').hide();
}
	
	var oldPassid="<%=UserHolder.getId()%>";
	
	pageStart(1,10);
	
	//上传代付款文件
	$('#formSumbit').submit(function (event) {
		$(".submittex").attr("disabled","disabled");
	    //首先验证文件格式
	    var fileName = $(this).find("input[name=file]").val();
	    if (fileName === '') {
	    	layer.msg('请选择文件', {
	    	    time: 20000, //20s后自动关闭
	    	    btn: ['知道了']
	    	  });
	    	$(".submittex").removeAttr("disabled")
	        return false;
	    }
	    var fileType = (fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length)).toLowerCase();
	    if (fileType !== 'xls' && fileType !== 'xlsx') {
	    	$(".submittex").removeAttr("disabled")
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
            	$(".submittex").removeAttr("disabled")
            	layer.close(loadings);
            	console.log(data)
            	layer.msg(data.msg, {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
                pageStart($(".page_num").val(),10);
                $(".shaow").hide();
                $(".upfiles_fa").text("");
                $(".upfiles").val("");
            },
            error : function(XHR, textStatus, errorThrown) {
            	$(".submittex").removeAttr("disabled")
            	layer.close(loadings);
            	 layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus + "\nerrorThrown=" + errorThrown, {
     	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            }
        });
	 });
	
	
	$(".fksqz").live("click",function(){
		$(".firQe").show();
		$(".fanpay").attr("data-index",$(this).attr("data-index"));
		$(".secpayNum").text($(this).attr("data-num"))
	})
	
	$(".firsta").click(function(){
		$(".firQe").hide();
		$(".secQe").show();
		
	})
	
	$(".fanpay").click(function(){
		topApproval($(this).attr("data-index"),1);
	})
	
	$(".singlePay").click(function(){
		$(".singlePay_s").show();
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
	})
	
	//查询
	$(".findEver").on("click",function(){
		batchId = $("#batchId").val();
		approvalStatus = $("#approvalStatus").val();
		dateBegin = $("#datetimeStart").val();
		dateEnd = $("#datetimeEnd").val();
		$(".table1 tbody").html("");
		pageStart(1,10,batchId,approvalStatus,dateBegin,dateEnd);
	})
	
	//下载模板
	function download(){
    	window.location=""+loction+"paymentBatch/download.do";
	}
	
	//打开上传代付文件页面
	function showUploadText_s(){
		$(".uploadText_s").css("display", "block");
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
					$("#subjectId").empty();
					$.each(data.listSubjects, function(i, item) {
						$("#subjectId").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
					});
				}else{
					$("#subjectId").html("");
					$.each(data.listSubjects, function(i, item) {
						$("#subjectId").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
					});
					//$("#subjectId").append('<option value='+ item.substitutedCollectionId +'>' + item.substitutedCollectionName + '</option>');
				}
			},
			error : function() {
				console.log("err");
			}
		})
	}
	
	//单次代付保存
	$("#saveOrUpdateBatch").on("click",function(){
		var orderName = $("#orderName").val();
		if($("#idCard").val()){
	   		 var idCard=$("#idCard").val().toUpperCase()
	   	 }
		var bankAccount = $("#bankAccount").val();
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
            		$(".table1 tbody").html("");
            		$(".singlePay_s input").val("");
                	pageStart($(".page_num").val(),10);
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
	
	
	//批次审批 付款，取消
	function topApproval(batchId,approvalStatus){
		$(".fanpay").attr("disabled","disabled");
		var data={
			"batchId":parseInt(batchId),
			"approvalStatus":parseInt(approvalStatus)
		}
		$.ajax({
            type: "POST",
            url: ""+loction+"paymentBatch/topApproval.do",
            contentType: "application/json;charset=utf-8",
            data:JSON.stringify(data),
            success:function(data){
            	layer.msg(data.msg, {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            	if(data.state){
            		$(".fanpay").removeAttr("disabled")
            		$(".table1 tbody").html("");
                	pageStart($(".page_num").val(),10);
                	$(".secQe").hide();
            	}
            },
            error:function(){
            	$(".fanpay").removeAttr("disabled")
            	layer.msg("保存出现异常", {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            }
    	})
	}
	
	//文件详情
	function queryListOrder(batchId){
		$(".textDal").css("display", "block");
		var data={
			"batchId":batchId
		}
		$.ajax({
            type: "POST",
            url: ""+loction+"paymentBatch/queryListOrder.do",
            contentType: "application/json;charset=utf-8",
            data:JSON.stringify(data),
            success:function(data){
            	$("#listOrder").html("");
            	if(data.state==0){
            		var batchVo = data.batchVo;
            		var batchs = "";
                	batchs += "<td>"+isNotNullAndUndifine(batchVo.batchId)+"</td>";
                	batchs += "<td>"+isNotNullAndUndifine(batchVo.paymentNumber)+"</td>";
                	batchs += "<td>"+isNotNullAndUndifine(batchVo.paymentSumStr)+"</td>";
                	batchs += "<td>"+isNotNullAndUndifine(batchVo.paymentComment)+"</td>";
                	$("#batchs").html(batchs);	
                	
            		//循环订单
                	$.each(data.listOrder,function(i,item){
                		var listOrder="<tr><td>"+isNotNullAndUndifine(item.orderId)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.bankAccount)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orderName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.idCard)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orderSumStr)+"</td>\
                      	</tr>";
                      	$("#listOrder").append(listOrder);
                	})
            	}
            },
            error:function(){
            	layer.msg("查询文件详情出错", {
    	    	    time: 20000, //20s后自动关闭
    	    	    btn: ['知道了']
    	    	  });
            }
    	})
	}
	
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

    $("body .slid_toggle").live("click",function(){
    	newPageNume=$(".pages-size em i").first().text();
    	id=$(this).find("img").attr("data-index");
    	if($(this).find("img").attr("data-status")==0){
    		$(this).find("img").removeClass("statuss1").addClass("statuss0").attr("data-status","1")
    		enabled(id,1,newPageNume)
    	}else{
    		customerId=$(this).find("img").attr("data-index")
    		$(this).find("img").removeClass("statuss0").addClass("statuss1").attr("data-status","0")
    		enabled(id,0,newPageNume)
    	}
    })
    
    var pagestars=1;
    $(".next-btn").on("click",function(){
   		pagestars++;
   		maxPage=$(".pageAllnum").html()*1;
    	if(pagestars>=maxPage){
    		pagestars=maxPage;
    	}
    	$(".table1 tbody").html("");
    	pageStart(pagestars,10);
    	return pagestars
    })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars<1){
    		pagestars=1;
    	}
    	$(".table1 tbody").html("");
    	pageStart(pagestars,10);
    	return pagestars
    })
	$(".page_btn").on("click",function(){
	    if(($(".page_num").val()*1)>($(".pageAllnum").html()*1)){
		    layer.msg("请输入正确页码");
		    return false;
	    }else{
		    $(".table1 tbody").html("");
		    batchId = $("#batchId").val();
			approvalStatus = $("#approvalStatus").val();
			dateBegin = $("#datetimeStart").val();
			dateEnd = $("#datetimeEnd").val();
		  	$(".table1 tbody").html("");
		  	$(".pages-size").html("");
		  	pageStart(pagestars,10,batchId,approvalStatus,dateBegin,dateEnd);
		    return pagestars
		}
	})
     
    function pageStart(pageNum,pageSize,batchId,approvalStatus,beginTime,endTime){
		if(batchId){}else{batchId=""}
		if(approvalStatus){}else{approvalStatus=""}
		if(beginTime){}else{beginTime=""}
		if(endTime){}else{endTime=""}
		var data = {
			"batchId":batchId,
			"approvalStatus":approvalStatus,
			"pageNum":parseInt(pageNum),
			"pageSize":parseInt(pageSize),
			"beginTime":beginTime,
			"endTime":endTime
		}
        $.ajax({
                type: "POST",
                url: ""+loction+"paymentBatch/queryListBath.do",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(data),
                success:function(data){
                   	$(".table1 tbody").html("");
                    $(".pages-size").html("共<em><i>"+data.pageNum+"</i>/<i class='pageAllnum'>"+data.totalPage+"</i></em>页");
                    $.each(data.listBatch,function(i,item){
                    	var approvalStatus = item.approvalStatus;
                    	var flag="";
                    	if(approvalStatus==2){
                    		flag = "<label style='color:#f65050'>驳回 <img data-index="+item.batchId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>";
                    	}else if(approvalStatus==1){
                    		flag = "通过";             		
                    	}else{
                    		if(item.state==0){
	                    		flag = "待审核";
                    		}else if(item.state==1){
                    			flag = "待二级审核";
                    		}
                    	}
                    	var text = "";
                    	
                    	if(distributionType == 31){
                    		text = (item.approvalStatus==0 && item.state==0) ? "<a data-num="+item.paymentSumStr+" data-index="+item.batchId+" class='fksqz' >付款</a>  <a class='nogg' data-index="+item.batchId+">驳回</a></span>":"";
                    	}else if(distributionType == 32){
                    		text = (item.approvalStatus==0 && item.state==1) ? "<a data-num="+item.paymentSumStr+" data-index="+item.batchId+" class='fksqz' >付款</a>  <a class='nogg' data-index="+item.batchId+">驳回</a></span>":"";
                    	}
	                    var tr="<tr><td>"+item.batchId+"</td>\
                      	<td>"+isNotNullAndUndifine(item.excelName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.paymentSumStr)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.paymentNumber)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.applicationName)+"</td>\
                      	<td>"+flag+"</td>\
                      	<td>"+isNotNullAndUndifine(item.auditorName)+"</td>\
                      	<td>"+formatDateB(item.createTime)+"</td>\
                      	<td>"+formatDateB(item.auditTime)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.paymentComment)+"</td>\
                      	<td>"+text+"</td>\
                      	<td><a onclick='queryListOrder("+item.batchId+")'>详情</a></td>\
                      	</tr>";
                      	$(".table1 tbody").append(tr);
                    });
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
    
     $(".dels").live("click",function(){
    	 $(".shaow1").show();
     })
    
    $(".back").click(function(){
    	$(".shaow").hide();
    })
    $(".disable").click(function(){
    	$(".shaow").hide();
    })
    
    $("._input input[type='text'],select").on("input change",function(evt){
    	  if($(this).val().trim().length){
    	    $(".findEver").removeAttr("disabled").removeClass("disable");
    	  }else{
    	    $(".findEver").prop("disabled","disabled").addClass("disable");
    	  }
   	});
    $(".reset").click(function(){
    	$(".findEver").prop("disabled","disabled").addClass("disable");
    	$("input[type='text'],select").val("");
    	$(".table1 tbody").html("");
    	pageStart(1,10);
    })
    
    
    $(".upfiles").change(function(){
    	$(".upfiles_fa").text("已选择");
    })
    $("#loginName").html(name);
    $(".copicon").html(isNotNullAndUndifine(customerName1));
    
    /* 驳回 */
    
    $(".nogg").live("click",function(){
   	 $(".shaow_bh").show();
   	 $(".backsus").attr("data-index",$(this).attr("data-index"));
   })
   $(".backsus").click(function(){
	   var data={
				"batchId":parseInt($(this).attr("data-index")),
				"approvalStatus":2,
				"prepared1":$(".bhinfo").val()
			}
			$.ajax({
	            type: "POST",
	            url: ""+loction+"paymentBatch/topApproval.do",
	            contentType: "application/json;charset=utf-8",
	            data:JSON.stringify(data),
	            success:function(data){
	            	layer.msg(data.msg, {
	    	    	    time: 20000, //20s后自动关闭
	    	    	    btn: ['知道了']
	    	    	  });	            	
	            	if(data.state){
	            		$(".table1 tbody").html("");
	                	pageStart($(".page_num").val(),10);
	                	$(".shaow").hide();
	            	}
	            },
	            error:function(){
	            	$(".fanpay").removeAttr("disabled")
	            	layer.msg("保存出现异常", {
	    	    	    time: 20000, //20s后自动关闭
	    	    	    btn: ['知道了']
	    	    	  });
	            }
	    	})
   })
    $(".bhinfos").live("mouseover",function() {
		that=this;
		$.ajax({
			type : "POST",
			url : "" + loction + "paymentBatch/queryPaymentBatchDetail",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({
				"batchId" : $(this).attr("data-index")
			}),
			async : false,
			success : function(data) {
				if(isNotNullAndUndifine(data.data.prepared1)!=""){
					layer.tips(isNotNullAndUndifine(data.data.prepared1),that)
				}			 
			},
			error : function() {
				console.log("err");
			}
		})
	})
    
    
</script>
</html>