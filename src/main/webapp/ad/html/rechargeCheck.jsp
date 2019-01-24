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
                <p class="shop_list_f">充值审核</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>商户名称：</li>
	                       <li><input class="customerQueryName" type="text"/></li>
	                   </ul>
	
						<ul>
	                       <li>审批状态：</li>
	                       <li>
		                       <select class='rechargeStatus'>
		                       		<option value="">请选择</option>
		                       		<option value="0">审批中</option>
		                       		<option value="1">审批通过</option>
		                       		<option value="2">驳回</option>
		                       </select>
	                       </li>
	                   </ul>
	                   <ul>
	                       <li>提交时间：</li>
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
	                                <td>商户名称</td>
	                                <td>申请金额（元）</td>
	                                <td>服务费（%）</td>
	                                <td>订单号</td>
	                                <td>申请人</td>
	                                <td>审批进度</td>
	                                <td>审核人</td>
	                                <td>审核时间</td>
	                                <td>到账时间</td>
	                                <td>审批</td>
	                               	<td>凭证</td>
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
                                <button class="disable back ">取消</button> <button class="deld">确认</button>
                            </div>
                        </div>
                    </div>
                    
                      <!-- 录入收款人  -->
		                <div style="display:none;" class="shaow shaow3 checkPZ" >
		                        <div class="del_shaow">
		                            <div class="del_shaow">
		                            <h1>查看凭证<i>×</i></h1>
		                            <div class="ever_text">
		                            	<img style="width:426px; height:234px; display:block; margin:0 auto; " src="../images/f5.png"/>
		                            	<a href="javascript:;">下载</a>
		                            </div>
		                        </div>
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
                                        <td><p><input class="depositBank" type="text"/></p></td>
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
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/address.js"></script>
<script>

   
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
     	customerQueryName = $(".customerQueryName").val();
    	rechargeStatus = $(".rechargeStatus").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,rechargeStatus,customerQueryName,dateBegin,dateEnd);
     	return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	
    	$(".table1 tbody").html("");
    	customerQueryName = $(".customerQueryName").val();
    	rechargeStatus = $(".rechargeStatus").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,rechargeStatus,customerQueryName,dateBegin,dateEnd);
    	return pagestars
    })
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
            layer.msg("请输入正确页码")
        }else{
        	customerQueryName = $(".customerQueryName").val();
        	rechargeStatus = $(".rechargeStatus").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	customerId = orgPassid;
        	$(".table1 tbody").html("");
        	$(".pages-size").html("");
        	pageStart(pagestars,10,rechargeStatus,customerQueryName,dateBegin,dateEnd);;
    	    return pagestars
        }
    	
    })
    
    /* 充值审核查询 */
    pageStart(1,10);
     
    $(".findEver").on("click",function(){
    	customerQueryName = $(".customerQueryName").val();
    	rechargeStatus = $(".rechargeStatus").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,rechargeStatus,customerQueryName,dateBegin,dateEnd);
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
    function pageStart(pageNum,pageSize,rechargeStatus,customerQueryName,dateBegin,dateEnd){
		if(customerQueryName){}else{customerQueryName=""}
		if(orgPassid){}else{orgPassid=""}
		if(rechargeStatus){}else{rechargeStatus=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"recharge/queryRecharges",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"topCustomerId":mainOrgId,"customerQueryName":customerQueryName,"rechargeStatus":rechargeStatus,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	console.log(data);
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    
                    $.each(data.data.list,function(i,item){ 
                    	var str="";
                    	var rechargeStatus="";
                    	if(item.auditStatus<=3){
                        	str="待"+item.auditStatus+"级审批";
                        }else if(item.auditStatus==4){
                        	str="通过";
                        }else if(item.auditStatus==5){
                        	str="<label style='color:#f65050'>驳回 <img data-index="+item.rechargeId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>";
                        }
                    	if(item.rechargeStatus=="0"){
                    		if(item.isApprova == item.auditStatus){
                    			rechargeStatus="<button data-index="+item.rechargeId+" class='agree'>通过</button> <button data-index="+item.rechargeId+" class='disable nogg'>驳回</button>"
                    		}else{
                    			rechargeStatus="";
                    		}
                    	}else if(item.rechargeStatus=="1"){
                    		rechargeStatus="通过";
                    	}else if(item.rechargeStatus=="2"){
                    		rechargeStatus="失败";
                    	}
                   		var tr="<tr><td>"+item.applicationTime+"</td>\
                       	<td>"+isNotNullAndUndifine(item.customerName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.applySumStr)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.poundageStr)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.rechargeId)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.applicationName)+"</td>\
                       	<td>"+str+"</td>\
                       	<td>"+isNotNullAndUndifine(item.auditManName)+"</td>\
                       	<td>"+formatDateA(item.auditCompleteTime)+"</td>\
                       	<td>"+formatDateA(item.receivedTime)+"</td>\
                       	<td>"+rechargeStatus+"</td>\
                       	<td><a target='_blank' href="+imgLoction+item.imgurl+">查看</a></td></tr>";
                    	$(".table1 tbody").append(tr);
                    })
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
    
    /* 同意 */
    $(".agree").live("click",function(){
       	$.ajax({
               type: "POST",
               url: ""+loction+"recharge/updateRecharge",
               contentType: "application/json;charset=utf-8",
                 data:JSON.stringify({"rechargeId":$(this).attr("data-index"),"auditHandle":1}), 
               success:function(data){
               	$(".table1 tbody").html("");
               	pageStart(pagestars,10);
               },
               error:function(){
               	console.log("err");
               }
           }) 
    })
    /* 驳回 */
    
     $(".nogg").live("click",function(){
    	 $(".shaow_bh").show();
    	 $(".backsus").attr("data-index",$(this).attr("data-index"));
    })
    $(".backsus").click(function(){
    	 $.ajax({
             type: "POST",
             url: ""+loction+"recharge/updateRecharge",
             contentType: "application/json;charset=utf-8",
              data:JSON.stringify({"rechargeId":$(this).attr("data-index"),"auditHandle":0,"prepared1":$(".bhinfo").val()}), 
             success:function(data){
             	$(".table1 tbody").html("");
             	pageStart(pagestars,10);
             	$(".shaow").hide();
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
    	pageStart(1,10);
    })
    
    
     //显示代征主体下拉框
    $(".dzzt input").click(function(){
    	$(".dzztList").css("display","block");
    })
    
    //关闭下拉框
   $(".dzztList").mouseleave(function(){
       $(this).hide(300);
   })  
    
   //获取已选代征主体
    $(".dzzt_bod input:checkbox").live("click",function(){
    	text = $(".dzzt_bod input:checkbox:checked").map(function(index,elem) {
            return $(elem).next().next().text();
        }).get().join(',');
    	$(".dzshow").val(text);
    })
    //修改操作获取当前信息
    $(".change").live("click",function(){
    	$(".shaow2").show();
    	$(".change_info_sub").attr("data-index",$(this).attr("data-index"));
    	
	   //显示代征主体下拉框数据
	   $.ajax({
            type: "POST",
         	data:JSON.stringify(), 
            url: ""+loction+"/substitutedCollection/queryAllSubstitutedCollection",
            contentType: "application/json;charset=utf-8",
            dataType: "json",//预期服务器返回的数据类型
            success:function(data){
            	$(".dzztList").html("");
            	$.each(data.data,function(i,item){
            		str="<label for=check"+item.substitutedCollectionId+"><input id=check"+item.substitutedCollectionId+" class=check"+item.substitutedCollectionId+" value="+item.substitutedCollectionId+" type='checkbox'><b></b><p style='display:inline'>"+item.substitutedCollectionName+"</p><i>"+item.substitutedCollectionRate+"%</i></label>";
            		$(".dzztList").append(str);
            	})
            	
            },
            error:function(){
            	console.log("err");
            }
       })
       //修改操作获取当前信息
       $.ajax({
	        type: "POST",
	     	data:JSON.stringify({"customerId":$(this).attr("data-index")}), 
	        url: ""+loction+"/customer/queryCustomerDetail",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	$.each(data.data.substitutedCollectionId,function(i,item){
	        		$(".check"+item+"").prop("checked","checked");
	        	})	
	        	$(".check"+data.data.substitutedCollectionId+"").prop("checked","checked")
	        	$(".customerName").val(isNotNullAndUndifine(data.data.customerName));
	        	$(".contactName").val(isNotNullAndUndifine(data.data.contactName));
	        	$(".depositBank").val(isNotNullAndUndifine(data.data.depositBank));
	        	$(".bankNumber").val(isNotNullAndUndifine(data.data.bankNumber));
	        	$(".poundageStr").val(isNotNullAndUndifine(data.data.poundageStr));
	        	text = $("input:checkbox:checked").map(function(index,elem) {
	                return $(elem).next().next().text();
	            }).get().join(',');
	        	$(".dzshow").val(text);
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
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
                	
    	        	layer.msg(data.message);
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
	            	pageStart(newPageNume,10);
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
           	pageStart(1,10);
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
           	pageStart(1,10);
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
    	 $.ajax({
             type: "POST",
             url: ""+loction+"payee/createPayee",
             contentType: "application/json;charset=utf-8",
               data:JSON.stringify({"payeeName":$(".saveName").val(),"idCardNumber":$(".saveId").val(),"bankNumber":$(".saveyhId").val()}), 
             success:function(data){
             	$(".table1 tbody").html("");
             	 $(".register_P").hide();
             	pageStart(1,10);
             	
             },
             error:function(){
             	console.log("err");
             }
           })
     })
$("#loginName").html(name);   
   $(".copicon").html(isNotNullAndUndifine(customerName1));
   
$(".bhinfos").live("mouseover",function() {
	that=this;
	$.ajax({
		type : "POST",
		url : "" + loction + "recharge/queryRechargeDetail",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify({
			"rechargeId" : $(this).attr("data-index")
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

