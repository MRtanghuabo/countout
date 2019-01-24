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
				<p class="shop_list_f">发票管理</p>
				<div class="shop_list_f_form">
					<div class="invoices">
						
					</div>
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>订单号：</li>
	                       <li><input id="rechargeId" class="rechargeId" type="text"/></li>
	                   </ul>
	
						<ul>
	                       <li>选择模板：</li>
	                       <li>
	                       		<select class="invoiceModelId">
	                       			<option value="">请选择</option> 
	                       		</select>
	                       </li>
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
	               <div class="tablefat">
					<table class="table1">
						<thead>
							<tr>
								<td>申请时间</td>
								<td>订单号</td>
								<td>开票信息</td>
								<td>开票金额（元）</td>
								<td>充值金额（元）</td>
								<td>开票状态</td>
								<td>快递信息</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<!--分页-->
					<div>
						<div class="J_SelectPage module-pages-select" data-current-page="1" data-total-page="12">
							<span class="prev-btn">上一页</span> <span class="pages-list">
							</span> <span class="next-btn">下一页</span> <span class="pages-size"></span>
							<span class="goto-page">到第<input class="page_num"
								type="text" value="1" />页<a class="page_btn"
								href="javascript:void(0);">确定</a></span>
						</div>
						<div class="shaow shaow1">
							<div class="del_shaow">
								<h1>操作</h1>
								<div class="ever_text">
									<p>确认删除此条数据吗？</p>
								</div>
								<div class="btn_aera">
									<button class="disable back ">取消</button>
									<button class="deld">确认</button>
								</div>
							</div>
						</div>
						<div style="display: none" class="shaow shaow4 shaow_login">
							<div class="del_shaow">
								<h1>重置密码</h1>
								<div class="ever_text">
									<table>
										<tr>
											<td>原始密码：</td>
											<td><p>
													<input class="oldpass" type="password" /><input
														class="olds" type="hidden" /><input class="oldsId"
														type="hidden" />
												</p>
											</td>
										</tr>
										<tr>
											<td>新密码：</td>
											<td><p>
													<input class="newpass" type="password" />
												</p></td>
										</tr>
										<tr>
											<td>确认新密码：</td>
											<td><p>
													<input class="newpass1" type="password" />
												</p></td>
										</tr>
									</table>
								</div>
								<div class="btn_aera">
									<button class="disable back ">取消</button>
									<button disabled class="disable checkPassword">确认</button>
								</div>
							</div>
						</div>
											
						<!-- 开票详情  -->
		                <div style="display:none" class="shaow shaow3 invoics_ins showever" >
		                        <div class="del_shaow">
		                            <div class="del_shaow">
		                            <h1>开票详情<i>×</i></h1>
		                            <div class="ever_text">
										<table>
		                                    <tr>
		                                        <td>申请时间：<p class="kptime"></p></td>
		                                        
		                                    </tr>
		                                    <tr>
		                                        <td>订单号：<p class="kpnum"></p></td>
		                                        
		                                    </tr>
		                                    <tr>
		                                        <td>开票金额（元）：<p class="kpmoney"></p></td>
		                                       
		                                    </tr>
		                                    <tr>
		                                        <td>充值金额（元）：<p class="czmoney"></p></td>
		                                        
		                                    </tr>
		                                    <tr class="dzzt_bod">
		                                        <td>开票状态：<p class="kpst"></p></td>
		                                       
		                                    </tr>
		                                </table>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <!-- 快递信息 -->
		                <div style="display:none;" class="shaow shaow5 expressInfos showever">
                        <div class="del_shaow">
                            <h1>快递信息<i>×</i></h1>
                            <div class="ever_text">
								<table>
									<tr>
                                        <td>寄件时间：<p class="extime"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>快递公司：<p class="excop"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>快递单号：<p class="exnum"></p></td>
                                       
                                    </tr>
								</table>
                            </div>
		                </div>
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
if(distributionType!=10){
	$('.invoices').hide();
}

var oldPassid="<%=UserHolder.getId()%>";
var orgPassid="<%=UserHolder.getOrgId()%>";
	/*登录*/
    $(function(){
    	
        //查询
	    $(".findEver").on("click",function(){
	    	//订单号
			rechargeId = $("#rechargeId").val();
	    	//选择模板
			invoiceModelId = $(".invoiceModelId").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
	    	$(".table1 tbody").html("");
	    	$(".pages-size").html("");
	    	pageStart(1,10,rechargeId,invoiceModelId,dateBegin,dateEnd);
	    })
    })
    
    
    $(".page_btn").on("click",function(){
	    if(($(".page_num").val()*1)>($(".pageAllnum").html()*1)){
		    layer.msg("请输入正确页码");
		    return false;
	    }else{
		    $(".table1 tbody").html("");
		    pagestars=$(".page_num").val();
		  //订单号
			rechargeId = $("#rechargeId").val();
	    	//选择模板
			invoiceModelId = $(".invoiceModelId").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
	    	$(".table1 tbody").html("");
	    	$(".pages-size").html("");
	    	pageStart(1,10,rechargeId,invoiceModelId,dateBegin,dateEnd);
		    return pagestars
		}
	})
    
    
    
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

    var pagestars = 1;
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	//订单号
		rechargeId = $("#rechargeId").val();
    	//选择模板
		invoiceModelId = $(".invoiceModelId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,rechargeId,invoiceModelId,dateBegin,dateEnd);
     	return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars<1){
    		pagestars=1;
    	}
    	//订单号
		rechargeId = $("#rechargeId").val();
    	//选择模板
		invoiceModelId = $(".invoiceModelId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,rechargeId,invoiceModelId,dateBegin,dateEnd);
    	return pagestars
    })
    
    pageStart(1,10);
     
    function pageStart(pageNum,pageSize,rechargeId,invoiceModelId,dateBegin,dateEnd){
    	//主商户名称
		if(rechargeId){}else{rechargeId=""}
    	//商户名称
		if(invoiceModelId){}else{invoiceModelId=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"invoiceModel/queryInvoiceWithModel",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"rechargeId":rechargeId,"invoiceModelId":invoiceModelId,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                	$(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    var authenticatedStatus="";
                    var fpgl="";
                    $.each(data.data.list,function(i,item){
                    	if(item.invoiceStatus=="1"){
                    		invoiceStatus="已开票 "
                    	    fpgl="<a class='express' href='javascript:;' data-index="+item.invoiceId+"><快递信息></a>"
                    	}else if(item.invoiceStatus=="2"){
                    		invoiceStatus="失败 ";
                    		fpgl="";
                    	}else if(item.invoiceStatus=="0"){
                    		invoiceStatus="开票中";
                    		fpgl="";
                    	}
	                    var tr="<tr><td>"+isNotNullAndUndifine(item.applicationTime)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.rechargeId)+"</td>\
                      	<td><a class='invoics' href='javascript:;' data-index="+item.invoiceId+">查看</a></td>\
                      	<td>"+isNotNullAndUndifine(item.invoiceSum)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.rechargeApplicationSumStr)+"</td>\
                      	<td>"+isNotNullAndUndifine(invoiceStatus)+"</td>\
                      	<td>"+fpgl+"</td></tr>";
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
    
    /* 查看开票信息 */
    $(".invoics").live("click",function(){
    	invoiceId=$(this).attr("data-index");
    	$.ajax({
    		type: "POST",
    		url: ""+loction+"invoice/queryInvoiceDetail",
    		contentType: "application/json;charset=utf-8",
    		data:JSON.stringify({"invoiceId":invoiceId}),
    		async: false,
    		success:function(data){
    			
    			$.each(data,function(i,item){
    				if(item.invoiceStatus=="1"){
                		invoiceStatus="已开票 "
                	}else if(item.invoiceStatus=="2"){
                		invoiceStatus="失败 "
                	}else if(item.invoiceStatus=="0"){
                		invoiceStatus="开票中"
                	}
    				$(".kptime").text(isNotNullAndUndifine(item.applicationTime));
    				$(".kpnum").text(isNotNullAndUndifine(item.rechargeId));
    				$(".kpmoney").text(isNotNullAndUndifine(item.invoiceSum));
    				$(".czmoney").text(isNotNullAndUndifine(item.rechargeApplicationSumStr));
    				$(".kpst").text(invoiceStatus);
    			});
    			$(".invoics_ins").show();
    		},
    		error:function(){
    			console.log("err");
    		}
    	})
    	
    	
    })
    
    $(".shaow h1 i").click(function(){
		$(".shaow").hide();
	})
	/* 快递信息 */
	$(".express").live("click",function(){
		$.ajax({
			type : "POST",
			url : "" + loction + "invoice/queryInvoiceDetail",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({"invoiceId" : $(this).attr("data-index")}),
			async : false,
			success : function(data) {
				$(".extime").text(data.data.expressTime);
				$(".excop").text(data.data.expressCompany);
				$(".exnum").text(data.data.expressNumber);
				$(".expressInfos").show();
				
			},
			error : function() {
				console.log("err");
			}
		})
		
	})
	/* 选择模板select*/
	modalCk();
    function modalCk(){
    	$.ajax({
            type: "POST",
            url: ""+loction+"invoiceModel/queryInvoiceModels",
            contentType: "application/json;charset=utf-8", 
            success:function(data){
            	
            	var p="";
                 $.each(data.data,function(i,item){
                	var op="<option value="+item.invoiceModelId+">"+item.modelName+"</option>";
                	 p+="<p><span>"+item.modelName+"</span><i data-index="+item.invoiceModelId+"></i></p>";
                	$(".invoiceModelId").append(op);
                	
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
       /* 删除发票模板 */
    $(".invoices p i").live("click",function(){
    	$(".voidDel").show();
    	$(".deldMOD").attr("data-dal",$(this).attr("data-index"));
    	return false;
    	 
    })
    /* 修改发票模板 */
    $(".invoices p").live("click",function(){
    	window.location.href=loction+"ad/html/payInvoice_change.jsp?"+$(this).find("i").attr("data-index"); 
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
    $("#loginName").html(name);
    $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

