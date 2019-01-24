<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tag.jsp" %>
<body>
    <div class="shop_wrap">
        <div class="header">
            <p><a href="javascript:;">Y·Z云职结算平台</a></p>
        </div>
        <div style="height: 100%;" class="shopList_wrap">
            <div class="left_nav">
                <div>
                    <ul>
                        <li data-address="shopBalance_h.jsp" class="fat"><i><img src="../images/icon1_h.png"/></i><a href="javascript:;">账户余额</a></li>
                        <li data-address="recharge_Log_h.jsp" class="fat"><i><img src="../images/icon2_h.png"/></i><a href="javascript:;">充值申请</a></li>
                        <li data-address="other_Payment_h.jsp" class="fat"><i><img src="../images/icon3_h.png"/></i><a href="javascript:;">代付款管理</a></li>
                        <li data-address="pay_checked_h.jsp" class="fat"><i><img src="../images/icon4_h.png"/></i><a href="javascript:;">付款查询</a></li>
                        <li data-address="" class="fat"><i><img src="../images/icon5_h.png"/></i><a href="javascript:;">收款人管理</a></li>
                        <li data-address="" class="fat"><i><img src="../images/icon6_h.png"/></i><a href="javascript:;">发票管理</a></li>
                        <li data-address="javascript:;" data-name="shopCenter" class="fat"><i><img src="../images/icon5.png"/></i>商户中心</li>
                        <li data-address="shopList.jsp" class="on shopCenter"><b>·</b><a href="javascript:;">商户列表查询</a></li>
                        <li data-address="creatShop.jsp" class="shopCenter"><b>·</b><a href="javascript:;">主商户配置</a></li>
                        <li data-address="payeeCenter.jsp" class="shopCenter"><b>·</b><a href="javascript:;">收款人中心</a></li>
                        <li data-address="javascript:;" data-name="payCenter" class="fat"><i><img src="../images/icon2.png"/></i>交易中心</li>
                        <li data-address="incomeDetails.jsp" class="payCenter"><b>·</b><a href="javascript:;">入账及收入明细</a></li>
                        <li data-address="authUser.jsp" data-name="userAuth" class="fat"><i><img src="../images/icon3.png"/></i><a href="javascript:;">账户权限管理</a></li>
                        <li data-address="operateLog.jsp" data-name="payLog" class="fat"><i><img src="../images/icon1.png"/></i><a href="javascript:;">操作日志</a></li>
                    </ul>
                </div>
            </div>
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
                <p class="shop_list_f">操作日志</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>账号类型：</li>
	                       <li>
	                           <select id="userLe" class="userLe">
	                           		<option value="">请选择</option>
	                           		<option value="10">基础业务操作员</option>
	                           		<option value="21">充值一级审核员</option>
	                           		<option value="22">充值二级审核员</option>
	                           		<option value="30">代付款审核员</option>
	                           		<option value="40">商户管理员</option>
	                           		<option value="50">发票审核员</option>
	                           </select>
	                       </li>
	                   </ul>					   
	                   <ul>
	                       <li>时间</li>
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
                    <table class="table1">
                        <thead>
                            <tr>
                                <td>时间</td>
                                <td>账号类型</td>
                                <td>账号名称</td>
                                <td>账号ID</td>
                                <td>IP地址</td>
                                <td>操作日志</td>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <!--分页-->
                    <div class="tablefat">
	                    <div class="J_SelectPage module-pages-select" data-current-page="1" data-total-page="12">
	                        <span class="prev-btn">上一页</span>
	                        <span class="pages-list">
	                        </span>
	                        <span class="next-btn">下一页</span>
	                        <span class="pages-size"></span>
	                        <span class="goto-page">到第<input class="page_num" type="text" value="1" />页<a class="page_btn" href="javascript:void(0);">确定</a></span>
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
    /*登录*/
    	 pageStart(1,10,orgPassid);
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
        $(this).toggle(function(){
            $(this).find("img").removeClass("status1").addClass("status0").attr("data-status","0")
        },function(){
            $(this).find("img").removeClass("status0").addClass("status1").attr("data-status","1")
        })
        $(this).trigger('click');
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
    
    
     
	//查询
    $(".findEver").on("click",function(){
    	userLe = $("#userLe").val();
    	customerId = orgPassid;
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,customerId,userLe,dateBegin,dateEnd);
    })
    
    $(".page_btn").on("click",function(){
	    if(($(".page_num").val()*1)>($(".pageAllnum").html()*1)){
		    layer.msg("请输入正确页码");
		    return false;
	    }else{
		    $(".table1 tbody").html("");
		    pagestars=$(".page_num").val();
		    customerId = $("#mainOrgId").val();
	    	customerName = $("#customerName").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
		  	$(".table1 tbody").html("");
		  	$(".pages-size").html("");
		  	pageStart(pagestars,10,customerName,userLe,dateBegin,dateEnd);
		    return pagestars
		}
	})
	
     
    function pageStart(pageNum,pageSize,customerId,operationUserType,dateBegin,dateEnd){
    	 if(customerId){}else{customerId=""}
    	if(operationUserType){}else{operationUserType=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"operationRecord/queryOperationRecords",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"customerId":customerId,"operationUserType":operationUserType,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                   
                    $.each(data.data.list,function(i,item){
                    	//TODO 主商户名称需要添加
	                    var tr="<tr><td>"+formatDateB(item.operationTime)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.operationUserType)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.operationCustomerName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.operationUserName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.operationIp)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.operationDescription)+"</td></tr>";
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
     $(".deld").click(function(){
    	$.ajax({
            type: "POST",
            url: ""+loction+"customer/updateCustomer",
            contentType: "application/json;charset=utf-8",
            success:function(data){
            	
                 $.each(data.data,function(i,item){
                	var op="<option value="+item.substitutedCollectionId+">"+item.substitutedCollectionName+"</option>";
                	
                	$(".substitutedCollectionId").append(op);
                })
            },
            error:function(){
            	console.log("err");
            }
        })  
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
    $("#loginName").html(name);
    $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

