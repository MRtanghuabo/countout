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
                <p class="shop_list_f">交易中心</p>
                <div class="alltra">
                	<ul class="redmoney" >
                		<li>可用余额（元）</li>
                		<li class="allmoneyuse">暂无</li>
                	</ul>
                	<ul>
                		<li>可支配收入金额（元）</li>
                		<li class="allmoney">暂无</li>
                	</ul>
                	<button class="saiuse">提取</button>
                </div>
                <p class="shop_list_f">入账明细</p>
                <div class="shop_list_f_form">
                    <div class="tablefat">
                    	<table class="table1">
	                        <thead>
	                            <tr>
	                                <td>日期</td>
	                                <td>商户名称</td>
	                                <td>充值金额（元）</td>
	                                <td>代征主体</td>
	                                <td>服务费率差（%）</td>
	                                <td>收入金额（元）</td>
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
                    
                      <!-- 	提取金额  -->
                <div style="display:none;" class="shaow shaow4 useTra" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>提取<i>×</i></h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>可提取金额（元）：</td>
                                        <td style="text-align:left;"><label class="allmoney1"></label>元</td>
                                    </tr>
                                    <tr>
                                        <td>提取至可用余额（元）：</td>
                                        <td style="text-align:left;"><input class="lastNum" type="text"/> 元</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button class="disable back">取消</button> <button class="useTraCheck">确认</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <!--录入快递信息 -->
                <div style="display:none" class="shaow shaow4 expcheck" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>录入快递信息<i></i></h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>寄件时间：</td>
                                        <td><input id="datetimeStart1" readonly class="datetimeStart1" data-date-format="yyyy-mm-dd hh:ii" type="text"/></td>
                                    </tr>
                                    <tr>
                                        <td>快递公司：</td>
                                        <td><input class="addcopName" type="text"/></td>
                                    </tr>
                                    <tr>
                                        <td>快递单号：</td>
                                        <td><input class="addexpNum" type="text"/></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button style="margin-left:100px;" class="disable back">取消</button> <button class="luRUcheck">确认</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                    
                    <!-- 开票详情 -->
                    
                    <div style="display:none;" class="shaow shaow2 show_all">
                        <div class="del_shaow">
                            <h1>开票详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>发票金额（元）：</td>
                                        <td><p class="voidNum"></p></td>
                                    </tr>
                                    <tr>
                                        <td>发票抬头：</td>
                                        <td><p class="voidtit"></p></td>
                                    </tr>
                                    <tr>
                                        <td>纳税人类型：</td>
                                        <td><p class="nsLir"></p></td>
                                    </tr>
                                    <tr>
                                        <td>纳税人识别号：</td>
                                        <td><p class="nsNum"></p></td>
                                    </tr>
                                    <tr>
                                        <td>单位注册地址：</td>
                                        <td><p class="copAdress"></p></td>
                                    </tr>
                                    <tr>
                                        <td>单位电话：</td>
                                        <td><p class="copPhnum"></p></td>
                                    </tr>
                                    <tr>
                                        <td>开户行：</td>
                                        <td><p class="bankName"></p></td>
                                    </tr>
                                    <tr>
                                        <td>银行账号：</td>
                                        <td><p class="bankNum"></p></td>
                                    </tr>
                                    <tr>
                                    	<td>发票内容：</td>
                                    	<td><p class="voidDal"></p></td>
                                    </tr>
                                    <tr>
                                        <td>收件人：</td>
                                        <td><p class="expPop"></p></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>联系电话：</td>
                                        <td><p class="expName"></p></td>
                                    </tr>
                                    <tr>
                                        <td>收货地址：</td>
                                        <td><p class="expAdress"></p></td>
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
                                <button class="disable back">取消</button> <button disabled class="disable checkPassword">确认</button>
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
	if(distributionType != 40){
		$('.saiuse').hide();
	}
   
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
    
    $("#datetimeStart1").datetimepicker({
    	format: 'yyyy-mm-dd',
        autoclose: true,
        minView:'month',
        //todayBtn: true,
        language: 'en',
        /* pickerPosition: "bottom-left" */
    }); 
    var pagestars=1;
    
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	topCustomerId = orgPassid;
    	applyCustomerId = $(".applyCustomerId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,topCustomerId,applyCustomerId,dateBegin,dateEnd);
     	return pagestars
     })
     
     
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	topCustomerId = orgPassid;
    	applyCustomerId = $(".applyCustomerId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,topCustomerId,applyCustomerId,dateBegin,dateEnd);
    	return pagestars
    })
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
        	 layer.msg("请输入正确页码")
        }else{
        	topCustomerId = orgPassid;
        	applyCustomerId = $(".applyCustomerId").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	$(".table1 tbody").html("");
        	$(".pages-size").html("");
        	pageStart(pagestars,10,topCustomerId,applyCustomerId,dateBegin,dateEnd);
    	    return pagestars
        }
    	
    })
    
    /* 查询全部 */
    pageStart(1,10,orgPassid);
    function pageStart(pageNum,pageSize,orgPassid,applyCustomerId,dateBegin,dateEnd){
		if(applyCustomerId){}else{applyCustomerId=""}
		if(orgPassid){}else{orgPassid=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"recharge/queryEachCustomerProfit",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"applyCustomerId":applyCustomerId,"profitCustomerId":orgPassid,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    var invoiceStatus="";
                    $.each(data.data.list,function(i,item){
                   		var tr="<tr><td>"+formatDateA(item.applyTime)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.applyCustomerName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.applySumStr)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.substitutedCollectionName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.profitCustomerDifferRateStr)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.profit)+"</td></tr>";
                    	$(".table1 tbody").append(tr);
                    })
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
    /* 可支配收入 */
    allmoney();
    function allmoney(){
    	$.ajax({
            type: "POST",
         	data:JSON.stringify({"customerId" : orgPassid}), 
            url: ""+loction+"customer/queryCustomerDetail",
            contentType: "application/json;charset=utf-8",
            dataType: "json",//预期服务器返回的数据类型
            success:function(data){
            	$(".allmoney1").text(isNotNullAndUndifine(data.data.profitSumStr));	
            	$(".allmoney").text(isNotNullAndUndifine(data.data.profitSumStr));	
            	$(".allmoneyuse").text(isNotNullAndUndifine(data.data.availableBalanceStr));	
            },
            error:function(){
            	console.log("err");
            }
       })
    }

   /* 提取余额 */
   $(".saiuse").click(function(){
	   $(".useTra").show();
   })
   
    $(".useTraCheck").click(function(){
    	
    	if($(".lastNum").val()<$(".allmoney1").text()){
    		$.ajax({
                type: "POST",
             	data:JSON.stringify({"profitParameter" : $(".lastNum").val()}), 
                url: ""+loction+"customer/transferProfitToAvailableBalance",
                contentType: "application/json;charset=utf-8",
                dataType: "json",//预期服务器返回的数据类型
                success:function(data){
                	$(".shaow").hide();
                	layer.msg(data.message);
                	allmoney();
                },
                error:function(){
                	console.log("err");
                }
           })
    	}else{
    		layer.msg('输入正确金额');
    	}
    })
    
    
    
    
  $("._input input[type='text'],select").on("input change click",function(evt){
    	  if($(this).val().length){
    	    $(".findEver").removeAttr("disabled").removeClass("disable");
    	  }else{
    	    $(".findEver").prop("disabled","disabled").addClass("disable");
    	  }
   	});
  
  
    $("#loginName").html(name); 
    $(".copicon").html(isNotNullAndUndifine(customerName1));
  
</script>
</html>

