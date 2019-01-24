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
                <p class="shop_list_f">商户列表查询</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>商户名称：</li>
	                       <li><input class="customerQueryName" type="text"/></li>
	                   </ul>
	
	                   <ul>
	                       <li>日期</li>
	                       <li class="data_picker">
	                           <p>
	                               <input id="datetimeStart" readonly class="form_datetime" data-date-format="yyyy-mm-dd hh:ii" type="text"/><span>--</span>
	                               <input id="datetimeEnd" readonly class="form_datetime" data-date-format="yyyy-mm-dd hh:ii" type="text"/>
	                           </p>
	                       </li>
	                   </ul>
	                   
	                   <ul>
	                       <li>主商户：</li>
	                       <li>
	                           <select class="mainCustomerId">
	                              <option value=""></option> 
	                           </select>
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
	                                <td>商户名称</td>
	                                <td>主商户名称</td>
	                                <td>创建时间</td>
	                                <td>打款类型</td>
	                                <td>账户余额</td>
	                                <td>代征主体</td>
	                                <td>服务费率</td>
	                                <td>操作</td>
	                                <td>状态</td>
	                                <td>签约协议</td>
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
                                <button class="disable back ">取消</button> <button class="deld">确认</button>
                            </div>
                        </div>
                    </div>
                    <div style="display:none;" class="shaow shaow2 ">
                        <div class="del_shaow changeshop">
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
										<td>打款类型：</td>
			                			<td>
				                			<p><select style="width: 327px;height: 35px;line-height: 35px; margin-bottom:0;" class="paymentType">
				                				<option value="0">银行卡</option>
				                				<option value="1">虚拟账户</option>
				                			</select></p>
				                		</td>
									</tr>
                                    <tr>
                                        <td>开户行：</td>
                                        <td><p><input class="depositBank" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>银行卡号：</td>
                                        <td><p><input oninput = "value=value.replace(/[^\d]/g,'')" class="bankNumber" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>代征主体：</td>
                                        <td>
	                                        <p class="dzzt">
                                                <!-- <input readonly class="dzshow" value="请选择" type="text"/>
                                                <em><img src="../images/show.png"/></em>
	                                        	<span class="dzztList">
                                                     <label><input type="checkbox"><b></b>云职公司<i>11%</i></label>
	                                        	</span> -->
	                                        	<select class="dzztdal">
	                                        		<option value="" >请选择</option>
	                                        	</select>
	                                        </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>服务费：</td>
                                        <td><p><input onkeyup="clearNoNum(this)" readonly class="poundageStr" type="text"/><b class="bfs">%</b></p></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td><button style="margin-left:100px;" class="disable back">取消</button> <button class="change_info_sub">确认</button></td>
                                    </tr>
                                </table>
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
</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>

<script src="../js/address.js"></script>
<script>

	
   
      var oldPassid="<%=UserHolder.getId()%>";
      
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
            url: ""+loction+"customer/updateCustomer",
            contentType: "application/json;charset=utf-8",
              data:JSON.stringify({"customerId":customerId,"status":status}), 
            success:function(data){
            	$(".table1 tbody").html("");
            	pageStart(newPageNume,10);
            },
            error:function(){
            	console.log("err");
            }
          })
    }

    
    
    var pagestars=1;
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	$(".table1 tbody").html("");
     	customerQueryName = $(".customerQueryName").val();
    	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	mainCustomerId = $(".mainCustomerId").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,substitutedCollectionId,mainCustomerId,customerQueryName,dateBegin,dateEnd);
     	return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	$(".table1 tbody").html("");
    	customerQueryName = $(".customerQueryName").val();
    	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	mainCustomerId = $(".mainCustomerId").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,substitutedCollectionId,mainCustomerId,customerQueryName,dateBegin,dateEnd);
    	return pagestars
    })
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
            layer.msg("请输入正确页码")
        }else{
            $(".table1 tbody").html("");
            pagestars=$(".page_num").val();
            customerQueryName = $(".customerQueryName").val();
        	substitutedCollectionId = $(".substitutedCollectionId").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	mainCustomerId = $(".mainCustomerId").val();
        	$(".table1 tbody").html("");
        	$(".pages-size").html("");
        	pageStart(pagestars,10,substitutedCollectionId,mainCustomerId,customerQueryName,dateBegin,dateEnd);
    	    return pagestars
        }
    	
    })
    
    pageStart(1,10);
    $(".findEver").on("click",function(){
    	customerQueryName = $(".customerQueryName").val();
    	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	mainCustomerId = $(".mainCustomerId").val();
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,substitutedCollectionId,mainCustomerId,customerQueryName,dateBegin,dateEnd);
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
    function pageStart(pageNum,pageSize,substitutedCollectionId,mainCustomerId,customerQueryName,dateBegin,dateEnd){
		if(substitutedCollectionId){}else{substitutedCollectionId=""}
		if(mainCustomerId){}else{mainCustomerId=""}
		if(customerQueryName){}else{customerQueryName=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"customer/queryCustomers",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"substitutedCollectionId":substitutedCollectionId,"mainCustomerId":mainCustomerId,"customerQueryName":customerQueryName,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    $.each(data.data.list,function(i,item){
                    	var contractWord2="";
                    	if(item.contractWord=="null" || item.contractWord==null){
                    		contractWord2="";
                    	}else{
                    		contractWord2="<a href=/distribution"+item.contractWord+">下载</a>";
                    	}
                    	//根据权限隐藏按钮
                    	if(distributionType == 90){
                    		if(item.customerLevel=="1"){
                        		changebtn="<button data-index="+item.customerId+" class='change'>修改</button> <button data-index="+item.customerId+" class='dels'>删除</button>"
                        	}else{
                        		changebtn="<button data-index="+item.customerId+" class='dels'>删除</button>"	
                        	}
                    		states = "<span class='slid_toggle'><img class='status"+item.status+"' src='../images/hoverIcon.png'  data-index="+item.customerId+" data-status="+item.status+"></span>";
                    	}else{
                    		changebtn="";
                    		states="";
                    	}
                    	if(item.paymentType=='0'){
                    		paytype='银行卡'
                    	}else if(item.paymentType=='1'){
                    		paytype='虚拟商户'
                    	}
                   		var tr="<tr><td>"+item.customerName+"</td>\
                       	<td>"+isNotNullAndUndifine(item.principalName)+"</td>\
                       	<td>"+formatDateA(item.createTime)+"</td>\
                       	<td>"+paytype+"</td>\
                       	<td>"+isNotNullAndUndifine(item.balanceStr)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.substitutedCollectionName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.poundageStr)+"%</td>\
                       	<td>"+changebtn+"</td>\
                       	<td>"+states+"</td>\
                       	<td>"+contractWord2+"</td>\
                       	<td>"+isNotNullAndUndifine(item.customerComment)+"</td></tr>";
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
    	$(".pages-size").html("");
    	$("input[type='text'],select").val("");
    	$(".table1 tbody").html("");
    	pageStart(1,10);
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
            	console.log(data);
            	$(".dzztdal").empty();
            	$.each(data.data,function(i,item){
            		str="<option data-fl="+item.substitutedCollectionRateStr+" value="+item.substitutedCollectionId+">"+item.substitutedCollectionName+"</option>"
            		$(".dzztdal").append(str);
            	})
            	
            },
            error:function(){
            	console.log("err");
            }
       })
       
        $(".dzztdal").change(function(){
		   var ss=$(this).find("option:selected").attr("data-fl");
		   $(".poundageStr").val(ss);
	   })
       //修改操作获取当前信息
       $.ajax({
	        type: "POST",
	     	data:JSON.stringify({"customerId":$(this).attr("data-index")}), 
	        url: ""+loction+"/customer/queryCustomerDetail",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	$(".dzztdal option[value="+data.data.substitutedCollectionId+"]").attr("selected",true);
	        	$(".check"+data.data.substitutedCollectionId+"").prop("checked","checked")
	        	$(".customerName").val(isNotNullAndUndifine(data.data.customerName));
	        	$(".contactName").val(isNotNullAndUndifine(data.data.contactName));
	        	$(".depositBank").val(isNotNullAndUndifine(data.data.depositBank));
	        	$(".bankNumber").val(isNotNullAndUndifine(data.data.bankNumber));
	        	$(".poundageStr").val(isNotNullAndUndifine(data.data.poundageStr));
	        	$(".paymentType").val(isNotNullAndUndifine(data.data.paymentType));
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
    	if($(".dzztdal").val()==""){
    		layer.tips('请选择代征主体', '.dzztdal');
    		return false;
    	}
    	ChangeInfo(num);
    })
    
    function ChangeInfo(customerId,status,newPageNume){
        	$.ajax({
                type: "POST",
                url: ""+loction+"customer/updateCustomer",
                contentType: "application/json;charset=utf-8",
                  data:JSON.stringify({"customerId":customerId,"customerName":$(".customerName").val(),"paymentType":$(".paymentType").val(),"contactName":$(".contactName").val(),"depositBank":$(".depositBank").val(),"bankNumber":$(".bankNumber").val(),"substitutedCollectionId":$(".dzztdal").val(),"poundageCreate":$(".poundageStr").val()}), 
                success:function(data){
    	        	layer.msg(data.message);
    	        	if(data.status==200){
    	        		$(".shaow").hide();
    	        		$(".table1 tbody").html("");
    	        		pageStart(pagestars,10);
    	        	}
                },
                error:function(){
                	console.log("err");
                }
            }) 
        } 
    

    
   //修改小数点
   function clearNoNum(obj){ 
	    obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符  
	    obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的  
	    obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
	    obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d).*$/,'$1$2.$3');//只能输入两个小数  
	    if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额 
	        obj.value= parseFloat(obj.value); 
	    } 
	} 

$("#loginName").html(name);
$(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

