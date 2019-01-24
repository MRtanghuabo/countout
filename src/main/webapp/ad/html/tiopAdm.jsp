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
	        <% }else if(distributionType==50){ %>
	        	<%@ include file="left50.jsp" %>
       		<% } else{ %>
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
                <p class="shop_list_f">开票管理</p>
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
	                   <ul>
	                       <li>商户名称：</li>
	                       <li><input class="customerQueryName" type="text"/></li>
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
                    <div class="tablefat">
                    	<table class="table1">
	                        <thead>
	                            <tr>
	                                <td>商户名称</td>
	                                <td>代征主体</td>
	                                <td>申请订单</td>
	                                <td>申请时间</td>
	                                <td>审核人员</td>
	                                <td>是否开票</td>
	                                <td>开票详情</td>
	                                <td>发票快递信息</td>
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
                    
                      <!-- 	快递详情  -->
                <div style="display:none;" class="shaow shaow4 expDal showever" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>快递详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>寄件时间：<p class="exptime"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>快递公司：<p class="expcop"></p></td>
                                       
                                    </tr>
                                    <tr>
                                        <td>快递单号：<p class="expnum"></p></td>
                                        
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                 <!--录入快递信息 -->
                <div style="display:none" class="shaow shaow4 expcheck" >
                        <div style="height:300px;" class="del_shaow">
                            <div class="del_shaow">
                            <h1>录入快递信息<i></i></h1>
                            <div class="ever_text">
								<table style="margin-top:20px;">
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
                    
                    <div style="display:none;" class="shaow shaow2 show_all showever kpxqs">
                        <div style="height:620px;" class="del_shaow">
                            <h1>开票详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
									<tr>
                                        <td style="color:#FFC245;">发票信息</td>
                                    </tr>
                                    <tr>
                                        <td>发票金额（元）：<p class="voidNum"></p></td>
                                    </tr>
                                    <tr>
                                        <td>发票抬头：<p class="voidtit"></p></td>
                                        
                                    </tr>
                                     <tr class="line">
                                        <td></td>  
                                    </tr>
                                    <tr>
                                        <td style="color:#FFC245;">纳税信息</td>
                                    </tr>
                                    <tr>
                                        <td>纳税人类型：<p class="nsLir"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>纳税人识别号：<p class="nsNum"></p></td>
                                        
                                    </tr>
                                    <tr class="line">
                                        <td></td>  
                                    </tr>
                                    <tr>
                                        <td style="color:#FFC245;">单位信息</td>
                                    </tr>
                                    <tr>
                                        <td>单位注册地址：<p class="copAdress"></p></td>
                                       
                                    </tr>
                                    <tr>
                                        <td>单位电话：<p class="copPhnum"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>开户行：<p class="bankName"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>银行账号：<p class="bankNum"></p></td>
                                        
                                    </tr>
                                    <tr class="line">
                                        <td></td>  
                                    </tr>
                                    <tr>
                                        <td style="color:#FFC245;">收件信息</td>
                                    </tr>
                                    <tr>
                                    	<td>发票内容：<p class="voidDal"></p></td>
                                    	
                                    </tr>
                                    <tr>
                                        <td>收件人：<p class="expPop"></p></td>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <td>联系电话：<p class="expName"></p></td>
                                        
                                    </tr>
                                    <tr>
                                        <td>收货地址：<p class="expAdress"></p></td>
                                        
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
     	customerQueryName = $(".customerQueryName").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,orgPassid,customerQueryName,dateBegin,dateEnd);
     	return pagestars
     })
     
     
    $(".prev-btn").on("click",function(){
    	pagestars--;
    	if(pagestars <= 1){
    		pagestars=1;
    	}
    	customerQueryName = $(".customerQueryName").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(pagestars,10,orgPassid,customerQueryName,dateBegin,dateEnd);
    	return pagestars
    })
    
    $(".page_btn").on("click",function(){
        if($(".page_num").val()>$(".pageAllnum").html()){
        	 layer.msg("请输入正确页码")
        }else{
        	customerQueryName = $(".customerQueryName").val();
        	dateBegin = $("#datetimeStart").val();
        	dateEnd = $("#datetimeEnd").val();
        	customerId = orgPassid;
        	$(".table1 tbody").html("");
        	$(".pages-size").html("");
        	pageStart(pagestars,10,orgPassid,customerQueryName,dateBegin,dateEnd);
    	    return pagestars
        }
        
    })
    
    /* 查询全部 */
    pageStart(1,10,orgPassid);
    function pageStart(pageNum,pageSize,orgPassid,customerQueryName,dateBegin,dateEnd){
		if(customerQueryName){}else{customerQueryName=""}
		if(orgPassid){}else{orgPassid=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"invoice/queryInvoices",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"customerQueryName":customerQueryName,"topCustomerId":orgPassid,"dateBegin":dateBegin,"dateEnd":dateEnd,"pageNum":pageNum,"pageSize":pageSize}),
                success:function(data){
                    $(".pages-size").html("共<em><i>"+data.data.pageNum+"</i>/<i class='pageAllnum'>"+data.data.pages+"</i></em>页");
                    var invoiceStatus="";
                    $.each(data.data.list,function(i,item){
						if(distributionType == 50){
	                    	if(item.invoiceStatus==0){
	                    		invoiceStatus="<button data-index="+item.invoiceId+" class='agreeVoid'>通过</button> <button class='disable removeVoid ' data-index="+item.invoiceId+">驳回</button>"
	                    	}else if(item.invoiceStatus==1){
	                    		invoiceStatus="已开票"
	                    	}else if(item.invoiceStatus==2){
	                    		invoiceStatus="<label style='color:#f65050'>驳回 <img data-index="+item.invoiceId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>"
	                    	}
	                    	luru = "<a class='expcheckbtn' data-index="+item.invoiceId+" href='javascript:;'>录入</a>";
						}else{
							if(item.invoiceStatus==1){
	                    		invoiceStatus="已开票"
	                    	}else if(item.invoiceStatus==2){
	                    		invoiceStatus="<label style='color:#f65050'>驳回 <img data-index="+item.invoiceId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>"
	                    	}
							luru="";
						}
                    	
                    	
                    	
                   		var tr="<tr><td>"+item.customerName+"</td>\
                       	<td>"+isNotNullAndUndifine(item.substitutedCollectionName)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.rechargeId)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.applicationTime)+"</td>\
                       	<td>"+isNotNullAndUndifine(item.auditUserName)+"</td>\
                       	<td>"+invoiceStatus+"</td>\
                       	<td><a class='showall' data-index="+item.invoiceId+" href='javascript:;'>查看</a></td>\
                       	<td><a class='checkexp' data-index="+item.invoiceId+" href='javascript:;'>查看</a> "+luru+"</tr>";
                    	$(".table1 tbody").append(tr);
                    })
                },
                error:function(){
                	console.log("err");
                }
            })  
    }
     
     
    
    /* 开票管理查询 */
    $(".findEver").on("click",function(){
    	customerQueryName = $(".customerQueryName").val();
    	dateBegin = $("#datetimeStart").val();
    	dateEnd = $("#datetimeEnd").val();
    	customerId = orgPassid;
    	$(".table1 tbody").html("");
    	$(".pages-size").html("");
    	pageStart(1,10,orgPassid,customerQueryName,dateBegin,dateEnd);
    })
    
    
    /* 重置 */
    $(".reset").click(function(){
    	$(".findEver").prop("disabled","disabled").addClass("disable");
    	$("input[type='text'],select").val("");
    	$(".table1 tbody").html("");
    	pageStart(1,10,orgPassid);
    })
    
   /* 是否开票 */
    $(".agreeVoid").live("click",function(){
    	$.ajax({
            type: "POST",
            url: ""+loction+"invoice/updateInvoice",
            contentType: "application/json;charset=utf-8",
            data:JSON.stringify({"invoiceId":$(this).attr("data-index"),invoiceStatus:1}),
            success:function(data){
            	$(".table1 tbody").html("");
            	$(".pages-size").html("");
            	pageStart(pagestars,10,orgPassid);
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
  
  /* 查看 */
  $(".showall").live("click",function(){
	  $.ajax({
          type: "POST",
          url: ""+loction+"invoice/queryInvoiceDetail",
          contentType: "application/json;charset=utf-8",
          data:JSON.stringify({"invoiceId":$(this).attr("data-index")}),
          success:function(data){
          	
          	if(data.data.taxpayerType==1){
          		taxpayerType="小规模纳税人";
          	}else{
          		taxpayerType="一般纳税人";
          	}
          	$(".voidNum").text(isNotNullAndUndifine(data.data.invoiceSumStr));
          	$(".voidtit").text(isNotNullAndUndifine(data.data.invoiceTitle));
          	$(".nsLir").text(taxpayerType);
          	$(".nsNum").text(isNotNullAndUndifine(data.data.dutyParagraph));
          	$(".copAdress").text(isNotNullAndUndifine(data.data.registeredAddress));
          	$(".copPhnum").text(isNotNullAndUndifine(data.data.companyPhone));
          	$(".bankName").text(isNotNullAndUndifine(data.data.registedBank));
          	$(".bankNum").text(isNotNullAndUndifine(data.data.bankNumber));
          	$(".voidDal").text(isNotNullAndUndifine(data.data.invoiceContent));
          	$(".expPop").text(isNotNullAndUndifine(data.data.recipient));
          	$(".expName").text(isNotNullAndUndifine(data.data.phoneNumber));
          	$(".expAdress").text(isNotNullAndUndifine(data.data.address));
          },
          error:function(){
          	console.log("err");
          }
      }) 
	  $(".show_all").show();
  })
 
  /* 查看发票快递信息 */
  $('.checkexp').live("click",function(){
	  $.ajax({
          type: "POST",
          url: ""+loction+"invoice/queryInvoiceDetail",
          contentType: "application/json;charset=utf-8",
          data:JSON.stringify({"invoiceId":$(this).attr("data-index")}),
          success:function(data){
          	
          	$(".exptime").text(isNotNullAndUndifine(data.data.expressTime));
          	$(".expcop").text(isNotNullAndUndifine(data.data.expressCompany));
          	$(".expnum").text(isNotNullAndUndifine(data.data.expressNumber));
          },
          error:function(){
          	console.log("err");
          }
      })
	  $(".expDal").show();
  })
  /* 录入快递信息 */
  $('.expcheckbtn').live("click",function(){
	  $(".expcheck").show();
	  $(".luRUcheck").attr("data-index",$(this).attr("data-index"));
  })
  $(".luRUcheck").click(function(){
	  $.ajax({
          type: "POST",
          url: ""+loction+"invoice/updateInvoice",
          contentType: "application/json;charset=utf-8",
          data:JSON.stringify({"invoiceId":$(this).attr("data-index"),"expressTime":$(".datetimeStart1").val(),"expressCompany":$(".addcopName").val(),"expressNumber":$(".addexpNum").val()}),
          success:function(data){
          	
          	$(".expcheck input").val("");
          	$(".shaow").hide();
          },
          error:function(){
          	console.log("err");
          }
      })
  })
  $(".del_shaow i").click(function(){
	$(".shaow").hide();
})
 $(".removeVoid").live("click",function(){
  	 $(".shaow_bh").show();
  	 $(".backsus").attr("data-index",$(this).attr("data-index"));
 })


$(".backsus").live("click",function(){
    	$.ajax({
            type: "POST",
            url: ""+loction+"invoice/updateInvoice",
            contentType: "application/json;charset=utf-8",
            data:JSON.stringify({"invoiceId":$(this).attr("data-index"),invoiceStatus:2,"prepared1":$(".bhinfo").val()}),
            success:function(data){
            	$(".shaow").hide();
            	$(".table1 tbody").html("");
            	$(".pages-size").html("");
            	pageStart(pagestars,10,orgPassid);
            },
            error:function(){
            	console.log("err");
            }
        }) 
    })

$(".bhinfos").live("mouseover",function() {
		that=this;
		$.ajax({
			type : "POST",
			url : "" + loction + "invoice/queryInvoiceDetail",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({
				"invoiceId" : $(this).attr("data-index")
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


$("#loginName").html(name);
  $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>

