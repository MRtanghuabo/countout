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
                <p class="shop_list_f">BD人员管理</p>
                
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>BD人员</li>
	                       <li>
	                           	<select id="BdNum">
	                           		<option value="">请选择</option>
	                           	</select>
	                       </li>
	                   </ul>                 
	                   <ul>
                            <li>充值日期</li>
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
	                                <td>日期</td>
	                                <td>BD人员</td>
	                                <td>联系方式</td>
	                                <td>商户名称</td>
	                                <td>充值金额（元）</td>
	                                <td>BD人员提成</td>
	                                <td>提成金额（元）</td>
	                            </tr>
	                        </thead>
	                        <tbody>
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
<script src="../js/common.js"></script>
<script src="${ctx}/ad/js/md5.js"></script>

<script>
	var oldPassid="<%=UserHolder.getId()%>";
	var orgPassid="<%=UserHolder.getOrgId()%>";
    /*登录*/
    $(function(){
    	
        //查询
	    $(".findEver").on("click",function(){
	    	//bd人员
			salesmanId = $("#BdNum").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
	    	topCustomerId=orgPassid;
	    	$(".table1 tbody").html("");
	    	$(".pages-size").html("");
	    	pageStart(1,10,topCustomerId,salesmanId,dateBegin,dateEnd)
	    })
    })
    
    
    $(".page_btn").on("click",function(){
	    if(($(".page_num").val()*1)>($(".pageAllnum").html()*1)){
		    layer.msg("请输入正确页码");
		    return false;
	    }else{
	    	salesmanId = $("#BdNum").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
	    	topCustomerId=orgPassid;
	    	$(".table1 tbody").html("");
	    	$(".pages-size").html("");
	    	pageStart(pagestars,10,topCustomerId,salesmanId,dateBegin,dateEnd)
		    return pagestars
		}
	})
    
	//获取所有商户id和名称
	$.ajax({
		type: "POST",
		url: ""+loction+"salesman/queryAllSalesman",
		contentType: "application/json;charset=utf-8",
		data:JSON.stringify({"topCustomerId":orgPassid}),
		async: false,
		success:function(data){
			//为Select追加一个Option(下拉项)
			$.each(data.data,function(i,item){
				$("#BdNum").append('<option value='+ item.salesmanId +'>'+ item.salesmanName +'</option>'); 
			});
		},
		error:function(){
			console.log("err");
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

    var pagestars=1;
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	salesmanId = $("#BdNum").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	topCustomerId=orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,topCustomerId,salesmanId,dateBegin,dateEnd)
	    return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars<1){
    		pagestars=1;
    	}
    	salesmanId = $("#BdNum").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	topCustomerId=orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,topCustomerId,salesmanId,dateBegin,dateEnd)
	    return pagestars
    })
    
    pageStart(1,10,orgPassid); 
    function pageStart(pageNum,pageSize,topCustomerId,salesmanId,dateBegin,dateEnd){
		if(topCustomerId){}else{topCustomerId=""}
		if(salesmanId){}else{salesmanId=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"recharge/queryRechargeSalesmanProfit",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"topCustomerId":topCustomerId,"salesmanId":salesmanId,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                	//　表达式1?表达式2:表达式3;
                    $.each(data.data.list,function(i,item){
	                    var tr="<tr><td>"+isNotNullAndUndifine(item.applicationTime)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.salesmanName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.salesmanPhone)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.customerName)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.applySumStr)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.salesmanRateStr)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.salesmanProfit)+"</td></tr>";
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
    $("#loginName").html(name);
    $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>