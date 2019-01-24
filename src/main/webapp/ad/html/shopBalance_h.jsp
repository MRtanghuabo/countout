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
        
            <div class="right_dal right_dal_bal">
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
                <div class="tablefat">
                <div class="balcenter">
                	<input class="zczf" type="hidden"/>
                	<ul class="child1">
                		<li>总金额（元）</li>
                		<li class="child1_m"></li>
                	</ul>
                	<ul class="child2">
                		<li>可用余额（元）</li>
                		<li class="child2_m"></li>
                	</ul>
                	<ul class="child3">
                		<li>冻结金额（元）<img class="tips" src="../images/alert_1.png"/></li>
                		<li class="child3_m"></li>
                	</ul>
                	<ul class="child4">
                		<li>待审核充值金额（元）</li>
                		<li class="child4_m"></li>
                	</ul>
                </div>
                <p class="bal_now">最近消费</p>
                <div class="shop_list_f_form">
                    <div class="tablefat">
                    	<table class="table1">
	                        <thead>
	                            <tr>
	                                <td>日期时间</td>
	                                <td>消费明细</td>
	                                <td>消费金额（元）</td>
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
</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/address.js"></script>
<script>
      var oldPassid="<%=UserHolder.getId()%>";
      var orgPassid="<%=UserHolder.getOrgId()%>";
      
      /* 查询头部数值  */
      	$.ajax({
              type: "POST",
              url: ""+loction+"customer/queryCustomerDetail",
              contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"customerId":orgPassid}), 
              success:function(data){
              	$(".child1_m").html(isNotNullAndUndifine(data.data.balanceStr))  
              	$(".child2_m").html(isNotNullAndUndifine(data.data.availableBalanceStr))  
              	$(".child3_m").html(isNotNullAndUndifine(data.data.freezingBalanceStr))  
              	$(".child4_m").html(isNotNullAndUndifine(data.data.unpassedSumStr))
 
              },
              error:function(){
              	console.log("err");
              }
          })  


  $(".tips").click(function(){
	  layer.tips('当执行打款操作的时,会暂时冻结批次对应的金额', '.tips');
  })

    
    
    var pagestars=1;
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	$(".table1 tbody").html("");
    	pageStart(pagestars,10,orgPassid);
     	return pagestars
     })
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	
    	$(".table1 tbody").html("");
    	pageStart(pagestars,10,orgPassid);
    	return pagestars
    })
    
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
            layer.msg('请输入正确页码');
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
        	pageStart(pagestars,10);
    	    return pagestars
        }
    	
    })
    
        
    pageStart(1,10,orgPassid);
    function pageStart(pageNum,pageSize,customerId){
    	
        $.ajax({
                type: "POST",
                url: ""+loction+"customer/queryPaymentBatches",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"customerId":customerId,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    $.each(data.data.list,function(i,item){
                   		var tr="<tr><td>"+formatDateA(item.createTime)+"</td>\
                       	<td>进行了批次号为"+isNotNullAndUndifine(item.batchId)+"的批次打款</td>\
                       	<td>"+isNotNullAndUndifine(item.paymentSumStr)+"</td></tr>";
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

