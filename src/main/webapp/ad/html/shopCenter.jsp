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
                <p class="shop_list_f">商户列表</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>代征主体：</li>
	                       <li>
	                       <select class="dzzt substitutedCollectionId">
	                       		<option value="">请选择</option>
	                       	</select>
	                       </li>
	                   </ul>	
	                   <ul>
	                       <li>日期：</li>
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
                   <button class="dal_btn newShop">新建商户</button>
                    <div class="tablefat">
                    	<table class="table1">
	                        <thead>
	                            <tr>
	                                <td>商户名称</td>
	                                <td>创建时间</td>
	                                <td>打款类型</td>
	                                <td>代征主体</td>
	                                <td>服务费设置(%)</td>
	                                <td>操作</td>
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
                                <button class="disable back ">取消</button> <button class="deld">确认</button>
                            </div>
                        </div>
                    </div>
                    
                      <!-- 录入收款人  -->
                <div style=" display:none; " class="shaow shaow3 register_P" >
                        <div class="del_shaow">
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
                                        <td><p><input  onkeyup="value=value.replace(/[\W]/g,'')" class="saveId" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>银行卡号：</td>
                                        <td><p><input class="saveyhId" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>推荐人：</td>
                                        <td><p><input class="savetjP" type="text"/><em>(选填)</em></p></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;" colspan="2"><button class="disable back">取消</button> <button>保存并继续添加</button> <button class="savepeo">保存</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- 查看详情 -->
                    <div style="display:none;" class="shaow shaow2 show_all showever fpxxxl">
                        <div style="height:446px; margin-top:-223px;" class="del_shaow">
                            <h1>查看详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
									<tr>
                                        <td style="color:#FFC245;">商户信息</td>
                                    </tr>
                                    <tr>
                                        <td>商户名称：<p class="shopName"></p></td>
                                    </tr>
                                    <tr>
                                        <td>打款类型：<p class="paymentType"></p></td>
                                    </tr>
                                    <tr class="line">
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color:#FFC245;">账户信息</td>
                                    </tr>
                                    <tr>
                                        <td>账户名称：<p class="copName"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>开户行：<p class="bankName"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>银行卡号：<p class="bankNum"></p></td>
                                        
                                    </tr>
                                    <tr class="line">
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="color:#FFC245;">费率信息</td>
                                    </tr>
                                    <tr>
                                        <td>代征主体：<p class="dzztShow"></p></td>
                                       
                                    </tr>
                                    <tr>
                                    	<td>服务费：<p class="allRa"></p></td>
                                    	
                                    </tr>
                                    
                                    <tr>
                                        <td>备注信息：<p class="copRa"></p></td>
                                      
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 删除 -->
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
                    <!-- 充值密码 -->
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
</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/md5.js"></script>
<script src="../js/address.js"></script>
<script>

	if(distributionType != 40){
		$(".newShop").hide();
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


    
    
    var pagestars=1;
    
     $(".next-btn").on("click",function(){
    	 pagestars++;
    	maxPage=$(".pageAllnum").html()*1;
     	if(pagestars>=maxPage){
     		pagestars=maxPage;
     	}
     	$(".table1 tbody").html("");
    	$(".pages-size").html("");
     	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	pageStart(pagestars,10,orgPassid,substitutedCollectionId,dateBegin,dateEnd);
     	return pagestars
     })
     
     
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	
    	pageStart(pagestars,10,orgPassid,substitutedCollectionId,dateBegin,dateEnd);
    	return pagestars
    })
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
        	 layer.msg("请输入正确页码")
        }else{
            $(".table1 tbody").html("");
            pagestars=$(".page_num").val();
            substitutedCollectionId = $(".substitutedCollectionId").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	customerId = orgPassid;
        	pageStart(pagestars,10,orgPassid,substitutedCollectionId,dateBegin,dateEnd);
    	    return pagestars
        }
    	
    })
    
    /* 查询全部 */
    pageStart(1,10,orgPassid);
    function pageStart(pageNum,pageSize,orgPassid,substitutedCollectionId,dateBegin,dateEnd){
		if(substitutedCollectionId){}else{substitutedCollectionId=""}
		if(orgPassid){}else{orgPassid=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"customer/queryCustomers",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"substitutedCollectionId":substitutedCollectionId,"parentCustomerId":orgPassid,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                	
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                   
                    $.each(data.data.list,function(i,item){
                    	 var textOption = "";
                         var textDisable = ""; 
                         if(distributionType == 40){
                         	textOption = "<a class='showall' data-index="+item.customerId+" href='javascript:;'>查看</a>&nbsp;<a href='newShopcreat2.jsp?"+item.customerId+"'>修改</a>&nbsp;<a data-index="+item.customerId+" class='dels' href='javascript:;'>删除</a>";
                         	textDisable = "<span class='slid_toggle'><img class='status"+item.status+"' src='../images/hoverIcon.png'  data-index="+item.customerId+" data-status="+item.status+"></span>";
                         }
                         if(item.paymentType=='0'){
                     		paytype='银行卡'
                     	}else if(item.paymentType=='1'){
                     		paytype='虚拟商户'
                     	}
                   		var tr="<tr><td>"+item.customerName+"</td>\
                       	<td>"+formatDateA(item.createTime)+"</td>\
                       	<td>"+paytype+"</td>\
                       	<td>"+isNotNullAndUndifine(item.substitutedCollectionName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.poundageStr)+"%</td>\
                       	<td>"+textOption+"</td>\
                       	<td>"+textDisable+"</td>\
                       	<td>"+isNotNullAndUndifine(item.customerComment)+"</td></tr>";
                    	$(".table1 tbody").append(tr);
                    })
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
     
   //显示代征主体下拉框数据
	   $.ajax({
          type: "POST",
       	  data:JSON.stringify(), 
          url: ""+loction+"/substitutedCollection/queryAllSubstitutedCollection",
          contentType: "application/json;charset=utf-8",
          dataType: "json",//预期服务器返回的数据类型
          success:function(data){
        	  
          	$.each(data.data,function(i,item){
          		str="<option value="+item.substitutedCollectionId+">"+item.substitutedCollectionName+"</option>";
          		$(".dzzt").append(str);
          	})
          	
          },
          error:function(){
          	console.log("err");
          }
     })
     
    
    /* 收款人管理查询 */
    $(".findEver").on("click",function(){
    	substitutedCollectionId = $(".substitutedCollectionId").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,orgPassid,substitutedCollectionId,dateBegin,dateEnd);
    })
   
    /* 重置 */
    $(".reset").click(function(){
    	$(".findEver").prop("disabled","disabled").addClass("disable");
    	$("input[type='text'],select").val("");
    	$(".table1 tbody").html("");
    	pageStart(1,10,orgPassid);
    })
    
    /* 状态 */
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
            	pageStart(newPageNume,10,orgPassid);
            },
            error:function(){
            	console.log("err");
            }
          })
    }

  $("._input input[type='text'],select").on("input change click",function(evt){
    	  if($(this).val().length){
    	    $(".findEver").removeAttr("disabled").removeClass("disable");
    	  }else{
    	    $(".findEver").prop("disabled","disabled").addClass("disable");
    	  }
   	});
  $(".newShop").click(function(){
	  window.location="newShopcreat2.jsp";
  })
  
  /* 查看 */
  $(".showall").live("click",function(){
	  
	  customerId=$(this).attr("data-index");
	  	$.ajax({
	  		type: "POST",
	  		url: ""+loction+"customer/queryCustomerDetail",
	  		contentType: "application/json;charset=utf-8",
	  		data:JSON.stringify({"customerId":customerId}),
	  		async: false,
	  		success:function(data){
	  			 if(data.data.paymentType=='0'){
              		paytype='银行卡'
              	}else if(data.data.paymentType=='1'){
              		paytype='虚拟商户'
              	}
	  			$(".shopName").text(isNotNullAndUndifine(data.data.customerName));
	  			$(".paymentType").text(isNotNullAndUndifine(paytype));
	  			$(".copName").text(isNotNullAndUndifine(data.data.contactName));
	  			$(".bankName").text(isNotNullAndUndifine(data.data.depositBank));
	  			$(".bankNum").text(isNotNullAndUndifine(data.data.bankNumber));
	  			$(".dzztShow").text(isNotNullAndUndifine(data.data.substitutedCollectionName));
	  			$(".allRa").text(isNotNullAndUndifine(data.data.poundageStr)+"%");
	  			$(".copRa").text(isNotNullAndUndifine(data.data.customerComment));
	  			$(".show_all").show();
	  		},
	  		error:function(){
	  			console.log("err");
	  		}
	  	})
  })
  
  /* 删除操作 */
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
            	pageStart(pagestars,10,orgPassid,substitutedCollectionId,dateBegin,dateEnd);
            	$(".shaow1").hide();
            },
            error:function(){
            	console.log("err");
            }
        })  
    }) 
$(".del_shaow i").click(function(){
	$(".shaow").hide();
})
$("#loginName").html(name);
  $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

