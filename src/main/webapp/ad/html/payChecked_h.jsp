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
                <p class="shop_list_f">付款查询</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>订单号：</li>
	                       <li>
	                           <input id="orderId" class="orderId" type="text"/>
	                       </li>
	                   </ul>
					   <ul>
	                       <li>状态：</li>
	                       <li>
	                      		<select id="state">
	                           		<option value="">请选择</option>
	                           		<option value="2">待打款</option>
	                           		<option value="0">打款成功</option>
	                           		<option value="1">打款失败</option>
	                           	</select>
	                       </li>
	                   </ul>
					   
	                   <ul>
	                       <li>申请时间： </li>
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
                                <td>批次号</td>
                                <td>订单号</td>
                                <td>金额（元）</td>
                                <td>姓名</td>
                                <td>银行卡号</td>
                                <td>状态</td>
                                <td>申请时间</td>
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
    /*登录*/
	pageStart(1,10);
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
    	orderId = $("#orderId").val();
    	state = $("#state").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,orderId,state,dateBegin,dateEnd);
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
		  	pageStart(pagestars,10,customerId,customerName,dateBegin,dateEnd);
		    return pagestars
		}
	})
	
     
    function pageStart(pageNum,pageSize,orderId,state,dateBegin,dateEnd){
    	if(orderId){}else{orderId=""}
		if(state){}else{state=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"paymentBatch/queryPayment.do",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"orderId":orderId,"state":state,"beginTime":dateBegin,"endTime":dateEnd,"pageNum":parseInt(pageNum),"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.pageNum+"</i>/<i class='pageAllnum'>"+data.totalPage+"</i></em>页");
                    $.each(data.listPayOrder,function(i,item){
						var state = item.state;
						var title = "";
						if(state==0){
							title="打款成功";
						}else if(state==1){
							title="<label style='color:#f65050'>驳回 <img data-index="+item.batchId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>";
						}else{
							title="待付款";
						}
                    	var tr="<tr><td>"+isNotNullAndUndifine(item.batchId)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orderId)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orderSumStr)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orderName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.bankAccount)+"</td>\
                      	<td>"+title+"</td>\
                      	<td>"+formatDateB(item.applyTime)+"</td></tr>";
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

