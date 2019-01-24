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
				<p id="title" class="shop_list_f">充值申请</p>
				<div class="shop_list_f_form">
					<div id="_input" class="_input">
						<form id="formSumbit" action="${baseUrl}/recharge/uploadProof" method="post" enctype="multipart/form-data">
							<p class="rech_form">
								<input class="cz_num1 num" type="text" placeholder="请输入申请金额" />
								<a href="javascript:;" class="czbtn1">充值申请</a>
								<span id="span"> <label class="titles"><img src="../images/num1.png" />请核对充值金额</label> 
									<input id="poundage" type="hidden" name="poundageStr">
									<label class="chd chd1">申请充值：
										<i></i><b></b>
										<input id="applicationSum" type="hidden" name="applicationSum">
									</label>
									<label class="chd chd2">申请成功后将到账：
										<i></i>元 
										<input id="receiveSum" type="hidden" name="receiveSum">
									</label> 
									<label class="titles"><img src="../images/num2.png" />请上传凭证</label>
									<label class="chd files">
										<img id="pic3" src="../images/input_file.png" width="106" alt=""/>
											<input style="display:none;" id="input-file" name="file" type="file"/>
											<input value="1" name="pageNum" type="hidden"/>
											<input value="10" name="pageSize" type="hidden"/>
									</label>
									<label class="titles"><img src="../images/num3.png" />请核对信息并确认提交</label>
									<label style="margin-top: 30px; text-align: center; margin-right: 20px;" class="chd btnaeras">
										<input class="disable" id="cancle" type="button" value="取消" />
										<input class="" type="submit" value="确定" />
									</label>
								</span>
							</p>
						</form>
					</div>
					
					<div class="jsk">
							<p>充值/到账金额换算</p>
						<table>
							<tr>
								<td>若实际到账：</td>
								<td><input class="mymoney" type="number" /></td>
							</tr>
							<tr>
								<td>需充值：</td>
								<td><input class="needmoney" readonly type="number" /></td>
							</tr>
						</table>
						<span class="jsktog"><img src="../images/cop.png"></span>
					</div>
					<p style="margin-left: 0" class="shop_list_f">充值记录</p>
					<div class="tablefat">
					
					<table class="table1">
						<thead>
							<tr>
								<td>日期</td>
								<td>订单号</td>
								<td>充值申请金额（元）</td>
								<td>手续费（%）</td>
								<td>到账金额（元）</td>
								<td>充值状态</td>
								<td>发票申请</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<!--分页-->
					<div>
						<div class="J_SelectPage module-pages-select"
							data-current-page="1" data-total-page="12">
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
						<!-- 汇款账户 -->
						<div style="display: none" class="shaow shaow4 rechar_bank">
							<div class="del_shaow">
								<h1>汇款账户<i>×</i></h1>
								<div class="ever_text">
									<table>
										<tr>
											<td>账号名称：</td>
											<td style='text-align:left' class="zhName">暂无数据</td>
										</tr>
										<tr>
											<td>开户行：</td>
											<td style='text-align:left' class="khName">暂无数据</td>
										</tr>
										<tr>
											<td>银行卡号：</td>
											<td style='text-align:left' class="bankNume">暂无数据</td>
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
	$('#_input').hide();
	$('#title').hide();
}

//上传代付款文件
$('#formSumbit').submit(function (event) {
    //首先验证文件格式
    var fileName = $(this).find("input[name=file]").val();
    
    event.preventDefault();
    var form = $(this);
    
    // mulitipart form,如文件上传类
    var formData = new FormData(this);
    $.ajax({
        type: form.attr('method'),
        url: form.attr('action'),
        data: formData,
        dataType: "JSON",
        mimeType: "multipart/form-data",
        contentType: false,
        cache: false,
        processData: false,
        success : function(data) {
        	layer.msg(data.message, {
	    	    time: 20000, //20s后自动关闭
	    	    btn: ['知道了']
	    	  });
            $('#pic3').attr("src","../images/input_file.png");
            $('#span').hide();
            $(".cz_num1").val("");
            pageStart(1, 10);
        },
        error : function(XHR, textStatus, errorThrown) {
        	 layer.msg("网络错误！XHR=" + XHR + "\ntextStatus=" + textStatus + "\nerrorThrown=" + errorThrown);
        }
    });
 });


var oldPassid="<%=UserHolder.getId()%>";
var orgPassid="<%=UserHolder.getOrgId()%>";
	/*登录*/
	pageStart(1, 10);
	//获取主商户id和名称
	$.ajax({
		type : "POST",
		url : "" + loction + "customer/queryTopCustomers",
		contentType : "application/json;charset=utf-8",
		data : "",
		async : false,
		success : function(data) {
			//为Select追加一个Option(下拉项)
			$.each(data.data, function(i, item) {
				$("#mainOrgId").append(
				'<option value='+ item.customerId +'>'+ item.customerName + '</option>');
			});
		},
		error : function() {
			console.log("err");
		}
	})
	$("#datetimeStart").datetimepicker({
		format : 'yyyy-mm-dd',
		autoclose : true,
		minView : 'month',
		//todayBtn: true,
		language : 'en',
	/* pickerPosition: "bottom-left" */
	});

	$("#datetimeEnd").datetimepicker({
		format : 'yyyy-mm-dd',
		minView : 'month',
		language : 'en',
		autoclose : true,
		startDate : new Date()
	}).on("click", function() {
		var startime = $("#datetimeStart").val()
		$("#datetimeEnd").datetimepicker("setStartDate", startime)
	});

	$("body .slid_toggle").live("click",function() {
		$(this).toggle(function() {
					$(this).find("img").removeClass("status1")
							.addClass("status0").attr("data-status",
									"0")
				},function() {
					$(this).find("img").removeClass("status0")
							.addClass("status1").attr("data-status",
									"1")
				})
		$(this).trigger('click');
	})

	var pagestars = 1;
	$(".next-btn").on("click", function() {
		pagestars++;
		maxPage = $(".pageAllnum").html() * 1;
		if (pagestars >= maxPage) {
			pagestars = maxPage;
		}
		$(".table1 tbody").html("");
		pageStart(pagestars, 10);
		return pagestars
	})
	$(".prev-btn").on("click", function() {
		pagestars--;
		if (pagestars < 1) {
			pagestars = 1;
		}
		$(".table1 tbody").html("");
		pageStart(pagestars, 10);
		return pagestars
	})
	//图片上传
	$("input[type='file']").on('change', function() {
		var oFReader = new FileReader();
		//路径
		var file = document.getElementById('input-file').files[0];
		oFReader.readAsDataURL(file);
		oFReader.onloadend = function(oFRevent) {
			var src = oFRevent.target.result;
			$('#pic3').attr("src",src);
		}
	});

	//关闭
	$("#cancle").on("click", function() {
		$("#span").css("display", "none");
	})

	$(".page_btn").on("click",
		function() {
			if (($(".page_num").val() * 1) > ($(".pageAllnum")
					.html() * 1)) {
				layer.msg("请输入正确页码");
				return false;
			} else {
				$(".table1 tbody").html("");
				pagestars = $(".page_num").val();
				customerId = $("#mainOrgId").val();
				customerName = $("#customerName").val();
				dateBegin = $("#datetimeStart").val();
				dateEnd = $("#datetimeEnd").val();
				$(".table1 tbody").html("");
				$(".pages-size").html("");
				pageStart(pagestars, 10, customerId, customerName,
						dateBegin, dateEnd);
				return pagestars
			}
		})

	//初次查询
	function pageStart(pageNum, pageSize, customerId, customerName, dateBegin,dateEnd) {
		if (customerId) {
		} else {
			orgId = ""
		}
		if (customerName) {
		} else {
			customerName = ""
		}
		if (dateBegin) {
		} else {
			dateBegin = ""
		}
		if (dateEnd) {
		} else {
			dateEnd = ""
		}
		$.ajax({type : "POST",
			url : "" + loction + "recharge/queryRecharges",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify({
				"customerId" : orgPassid,
				"customerName" : customerName,
				"dateBegin" : dateBegin,
				"dateEnd" : dateEnd,
				"pageNum" : pageNum,
				"pageSize" : pageSize
			}),
			success : function(data) {
				$(".table1 tbody").html("");
				$(".pages-size").html(
						"共<em><i>" + data.data.pageNum
								+ "</i>/<i class='pageAllnum'>"
								+ data.data.pages + "</i></em>页");
				var kptips = "";
				var cztips = "";
				
			$.each(data.data.list,function(i, item) {
				if (item.rechargeStatus == 1) {
					cztips = "<i>已到账</i>";
				} else if (item.rechargeStatus == 0) {
					kptips = "-------";
					cztips = "<i>审批中</i>";
				} else {
					cztips = "<label style='color:#f65050'>驳回 <img data-index="+item.rechargeId+" class='bhinfos' style='position: relative; top: -1px;' src='../images/bhimg.png'/></label>"
					kptips = "-------";
				}
				if(distributionType == 10){
					if (item.invoiceStatus == 3) {
						kptips = "<a href='payInvoice_h.jsp?"+item.rechargeId+"'>申请开票</a>";
					} else if (item.invoiceStatus == 2) {
						kptips = " <a data-id="+item.invoiceId+" class='kpag'><重新开票></a> <b style='color:#f65050; font-weight:100;'>驳回 <img data-index="+item.invoiceId+" class='bhinfos2' style='position: relative; top: -1px;' src='../images/bhimg.png'/></b>";
					} else if (item.invoiceStatus == 1) {
						kptips = "已开票<a data-id="+item.invoiceId+" class='kdinfo'><快递信息></a>";
					} else if (item.invoiceStatus == 0) {
						kptips = "已申请";
					}
				}else{
						kptips = "";
				}
						
						var tr = "<tr><td>"
								+ item.applicationTime+ "</td>\
			              	<td>"
								+ isNotNullAndUndifine(item.rechargeId)
								+ "</td>\
			              	<td>"
								+ isNotNullAndUndifine(item.applySumStr)
								+ "</td>\
			              	<td>"
								+ isNotNullAndUndifine(item.poundageStr)
								+ "</td>\
			              	<td>"
								+ isNotNullAndUndifine(item.receiveSumStr)
								+ "</td>\
			              	<td>"
								+ cztips
								+ "</td>\
			              	<td>"
								+ kptips + "</td></tr>";
								
						$(".table1 tbody").append(tr);
					});
				},
					error : function() {
						console.log("err");
					}
				})
	}

	//快递信息
	$(".kdinfo").live(
			"click",
			function() {
				that=this;
				$.ajax({
					type : "POST",
					url : "" + loction + "invoice/queryInvoiceDetail",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify({
						"invoiceId" : $(this).attr("data-id")
					}),
					async : false,
					success : function(data) {
						layer.tips('寄件时间:' + isNotNullAndUndifine(data.data.expressTime)
								+ '<br> 快递公司:' + isNotNullAndUndifine(data.data.expressCompany)
								+ '<br> 快递单号' + isNotNullAndUndifine(data.data.expressNumber) + '',
								that)
					},
					error : function() {
						console.log("err");
					}
				})
			})

	$(".dels").live("click", function() {
		$(".shaow1").show();
	})

	$(".back").click(function() {
		$(".shaow").hide();
	})
	$(".deld").click(
		function() {
			
			$.ajax({
				type : "POST",
				url : "" + loction
						+ "customer/updateCustomer",
				contentType : "application/json;charset=utf-8",
				success : function(data) {

					$.each(data.data,function(i, item) {var op = "<option value="+item.substitutedCollectionId+">"
							+ item.substitutedCollectionName
								+ "</option>";
								$(
								".substitutedCollectionId")
								.append(op);
							})
				},
				error : function() {
					console.log("err");
				}
			})
		})
	$("._input input[type='text'],select").on("input change", function(evt) {
		if ($(this).val().trim().length) {
			$(".findEver").removeAttr("disabled").removeClass("disable");
		} else {
			$(".findEver").prop("disabled", "disabled").addClass("disable");
		}
	});
	$(".reset").click(function() {
		$(".findEver").prop("disabled", "disabled").addClass("disable");
		$("input[type='text'],select").val("");
		$(".table1 tbody").html("");
		pageStart(1, 10);
	})
	//input输入 
	$(".czbtn1").click(
			function() {
				var re = /^[0-9]+.?[0-9]*/;
			 	if(!re.test($(".cz_num1").val())){
			 		layer.tips('请输入正确数值', $(".cz_num1"));
			 		return false;
			 	} 
				
				if($(".cz_num1").val()!=""){
					$.ajax({
						type : "POST",
						url : "" + loction + "customer/queryCustomerDetail",
						data : JSON.stringify({
							"customerId" : orgPassid
						}),
						contentType : "application/json;charset=utf-8",
						success : function(data) {
							$(".chd1 b").text("扣除服务费" + data.data.poundageStr + "%")
							//费率
							$("#poundage").val(data.data.poundageStr);
							$(".chd1 i").text($(".cz_num1").val());
							var newnum = $(".cz_num1").val() - ($(".cz_num1").val()*data.data.poundageStr*0.01)*1
							$(".chd2 i").text(newnum.toFixed(2));
							//计算后的金额
							$("#receiveSum").val(newnum.toFixed(2));
							//计算前的金额
							$("#applicationSum").val($(".cz_num1").val());
						},
						error : function() {
							console.log("err");
						}
					})
					$(".jsk").animate({right: '-302px'},500);
					 $(".rech_form span").show();
					$(".chd1 i").text($(".cz_num1").val());
					var newnum = $(".cz_num1").val() - $(".cz_num1").val() * 1
					console.log(newnum)
					 $(".chd2 i").text(newnum.toFixed(2)); 
				}else{
					layer.tips('请输入金额', '.cz_num1');
				}

			})
				
		$(".company_zh").click(function(){
			$.ajax({
		        type: "POST",
		     	data:JSON.stringify({"customerId" : orgPassid,"huiKuan":"1"}), 
		        url: ""+loction+"customer/queryCustomerDetail",
		        contentType: "application/json;charset=utf-8",
		        dataType: "json",//预期服务器返回的数据类型
		        success:function(data){
		        	
					$(".zhName").text(isNotNullAndUndifine(data.data.contactName));
					$(".khName").text(isNotNullAndUndifine(data.data.depositBank));
					$(".bankNume").text(isNotNullAndUndifine(data.data.bankNumber));
		        },
		        error:function(){
		        	console.log("err");
		        }
		   })
			$(".rechar_bank").show();
		})
		
		$(".del_shaow h1 i").click(function(){
			$(".shaow").hide()
		})
		
	$("#loginName").html(name);	
	$(".copicon").html(isNotNullAndUndifine(customerName1));
	$.ajax({
		type : "POST",
		url : "" + loction + "customer/queryCustomerDetail",
		data : JSON.stringify({
			"customerId" : orgPassid
		}),
		contentType : "application/json;charset=utf-8",
		success : function(data) {
			$(".mymoney").attr("data-fl",data.data.poundageStr);
		},
		error : function() {
			console.log("err");
		}
	})
	
	$(".kpag").live("click",function(){
		window.location.href=loction+"ad/html/payInvoice_htow.jsp?"+$(this).attr("data-id"); 
	})
	
	$(".mymoney").keyup(function(){
		console.log($(".mymoney").attr('data-fl')/100);
		var newnum=$(".mymoney").val()/(1-($(".mymoney").attr('data-fl')/100));
		$(".needmoney").val(newnum.toFixed(2));
		$(".cz_num1").val(newnum.toFixed(2));
	})
	$(".jsktog").toggle(function(){
		$(".jsk").animate({right: '0px'},500);
	},function(){
		$(".jsk").animate({right: '-302px'},500);
	})
	
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
	$(".bhinfos2").live("mouseover",function() {
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
	
</script>
</html>

