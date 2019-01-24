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
                <p class="shop_list_f">账号列表</p>
                
                <div class="shop_list_f_form">
                    <div class="_input" style="overflow:hidden">
<!-- 	                   <ul>
	                       <li>所属商户：</li>
	                       <li>
	                           <select id="allOrgId" class="orgId">
	                           		<option value="">请选择</option>
	                           </select>
	                       </li>
	                   </ul>
 -->	               <!-- <ul>
	                       <li>账号类型：</li>
	                       <li>
	                           <select id="distributionType" class="distributionType">
	                           		<option value="">请选择</option>
	                           		<option value="10">业务员</option>
	                           		<option value="21">一级审核员</option>
	                           		<option value="22">二级审核员</option>
	                           		<option value="23">三级审核员</option>
	                           		<option value="30">代付款审核</option>
	                           		<option value="40">商户管理员</option>
	                           		<option value="50">发票审核员</option>
	                           		<option value="90">系统账号</option>
	                           </select>
	                       </li>
	                   </ul> -->
					   <!-- <ul>
	                       <li>账号ID：</li>
	                       <li><input class="username" type="text"/></li>
	                   </ul> -->
					   <ul>
	                       <li>账号名称：</li>
	                       <li><input class="name" type="text"/></li>
	                   </ul>
	                   <ul>
	                       <li>创建时间：</li>
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
                    <button id="addBtn" onclick="openAddBtn()">新增账号</button>
                    <div class="tablefat">
	                    <table class="table1">
	                        <thead>
	                            <tr>
	                                <td>创建时间</td>
	                                <td>账号名称</td>
	                                <td>账号ID</td>
	                                <td>账号类型</td>
	                                <td>从属商户</td>
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
	                        <span class="pages-list">
	                        </span>
	                        <span class="next-btn">下一页</span>
	                       <span class="pages-size"></span>
	                       <span class="goto-page">到第<input class="page_num" type="text" value="1" />页<a class="page_btn" href="javascript:void(0);">确定</a></span>
	                    </div>
                    </div>
                    <div id="show" style="display:none" class="shaow shaow3" >
                        <div class="del_shaow">
                            <div style="height:500px; margin-top:-250px;" class="del_shaow">
                            <h1 id="operation"></h1>
                            <div class="ever_text">
								<table>
									<tr class="dzzt_bod">
                                        <td>从属商户：</td>
                                        <td>
	                                        <p>
	                                        	<select id="orgId">
	                                        		<option value="">请选择</option>
	                                        	</select>
	                                        </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>账号名称：<input id="id" type="hidden"/></td>
                                        <!-- <td><p><input id="name" onchange="convert()" class="" type="text"/></p></td> -->
                                        <td><p><input id="name" class="" type="text"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>账号ID：</td>
                                        <td><p><input id="username" class="" type="text"/></p></td>
                                    </tr>
                                    <tr id="pwd">
                                        <td>账号密码：</td>
                                        <td><p><input id="password" class="" type="text"/></p></td>
                                    </tr>
                                    <tr class="dzzt_bod">
                                        <td>账号类型：</td>
                                        <td>
	                                        <p id="displays">
	                                        	<select id="distributionTypeSelect">
	                                        		<option value="">请选择</option>
	                                        		<option value="10">基础业务操作员</option>
	                                        		<option value="21">充值一级审核员</option>
	                                        		<option value="22">充值二级审核员</option>
	                                        		<!-- <option value="23">充值三级审核员</option> -->
	                                        		<option value="31">代付款一级审核员</option>
	                                        		<option value="32">代付款二级审核员</option>
	                                        		<option value="50">发票审核员</option>
	                                        		<option value="40">商户管理员</option>
	                                        	</select>
	                                        </p>
	                                        <!-- <p id="hide" style="display:none"><input id="distributionTypeSelects" readonly value="商户管理员" type="text"/></p> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>备注信息：</td>
                                        <td><p><textarea id="remark"></textarea></p></td>
                                    </tr>
                                    
                                    <tr>
                                        <td></td>
                                        <td><button class="disable back ">取消</button> <button id="saveOrUpdate" class="deld">确认</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="vshow" style="display:none" class="shaow shaow3" >
                        <div class="del_shaow">
                            <div class="del_shaow">
                            <h1>账号详情<i>×</i></h1>
                            <div class="ever_text">
								<table>
                                    <tr>
                                        <td>账号名称：</td>
                                        <td><p id="vname"></p></td>
                                    </tr>
                                    <tr>
                                        <td>账号ID：</td>
                                        <td><p id="vusername"></p></td>
                                    </tr>
                                    <tr>
                                        <td>账号密码：</td>
                                        <td><p id="vpassword"></p></td>
                                    </tr>
                                    <tr>
                                        <td>备注信息：</td>
                                        <td><p id="vremark"></p></td>
                                    </tr>
                                    <tr class="dzzt_bod">
                                        <td>从属商户：</td>
                                        <td>
	                                        <p id="vorgId"></p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="restPWD" style="display:none" class="shaow shaow5">
                        <div class="del_shaow">
                            <h1>重置密码</h1>
                            <div class="ever_text">
								<table>
									<tr>
                                        <td>新密码：<input id="pwdId" type="hidden"/></td>
                                        <td><p><input class="newpass" type="password"/></p></td>
                                    </tr>
                                    <tr>
                                        <td>确认新密码：</td>
                                        <td><p><input class="newpass1" type="password"/></p></td>
                                    </tr>
								</table>
                            </div>
                            <div class="btn_aera">
                                <button class="disable back ">取消</button> <button class="checkPassword">确认</button>
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
<script src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datetimepicker.js"></script>
<script src="../js/layer/layer.js"></script>
<script src="../js/address.js"></script>
<script src="../js/common.js"></script>
<script src="${ctx}/ad/js/md5.js"></script>

<script>

if(distributionType != 40){
	$("#addBtn").hide();
}


	var oldPassid="<%=UserHolder.getId()%>";
    /*登录*/
    	pageStart(1,10);
        
        //查询
	    $(".findEver").on("click",function(){
	    	orgIds = $(".orgId").val();
	    	distributionType = $("#distributionType").val();
	    	username = $(".username").val();
	    	name = $(".name").val();
	    	dateBegin = $("#datetimeStart").val();
	    	dateEnd = $("#datetimeEnd").val();
	    	$(".table1 tbody").html("");
	    	$(".pages-size").html("");
	    	pageStart(1,10,orgIds,distributionType,username,name,dateBegin,dateEnd);
	    })
	    
	  	//保存按钮
	    $("#saveOrUpdate").on("click",function(){
	    	var id = $.trim($("#id").val());
	    	var name = $.trim($("#name").val());
	    	if(name==""){
	    		layer.tips('不能为空', '#name');
	    		return false;
	        }
	    	var username = $.trim($("#username").val());
	    	if(username==""){
	    		layer.tips('不能为空', '#username');
	    		return false;
	        }
	    	var password = hex_md5($.trim($("#password").val()));
	    	if(password==""){
	    		layer.tips('不能为空', '#password');
	    		return false;
	        }
	    	
	    	var distributionTypeSelect = $("#distributionTypeSelect").val().trim();
	    	if(distributionTypeSelect==""){
	    		layer.tips('不能为空', '#distributionTypeSelect');
	    		return false;
	        }
	    	
	    	var remark = $("#remark").val().trim();
	    	var orgIds = $.trim($("#orgId").val());
	    	if(orgIds==""){
	    		layer.tips('不能为空', '#orgId');
	    		return false;
	        }
	    	var data={
	    			"id":id,
	    			"name":name,
	    			"username":username,
	    			"password":password,
	    			"remark":remark,
	    			"orgId":orgIds,
	    			"distributionType":distributionTypeSelect
	    	}
	    	$.ajax({
                type: "POST",
                url: ""+loction+"authUser/saveOrUpdate.do",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify(data),
                success:function(data){
                	layer.msg(data.msg);
                	$("#show").css("display","none");
                	$(".table1 tbody").html("");
                	pageStart(1,10);
                },
                error:function(){
                	layer.msg("保存出现异常");
                }
	    	})
	    })
	    
	/* function convert(){
    	var orgName = $('#orgId').find("option:selected").text();
    	if(orgName == "请选择"){
			orgName="";
		}
		var name = $("#name").val()
		var text1 = pinyin.getCamelChars(orgName);  
		var text2 = pinyin.getCamelChars(name);  
    	$('#username').val(text1.toLowerCase()+text2.toLowerCase());
    } */
    
    //获取主商户id和名称
   	$.ajax({
         type: "POST",
         url: ""+loction+"customer/queryCustomerNames",
         contentType: "application/json;charset=utf-8",
         data:"",
         async: false,
         success:function(data){
          	//为Select追加一个Option(下拉项)
          	$.each(data.data,function(i,item){
          		$("#allOrgId").append('<option value='+ item.customerId +'>'+ item.customerName +'</option>'); 
          	});
         },
         error:function(){
         	console.log("err");
         }
   	
   	})
    
    //打开新增或修改页面 --给弹出框的id赋值，用于判断是新增还是删除
    function openAddBtn(ids){
    	var id=$.trim(ids)
    	$("#operation").html("新增操作")
       	//显示页面
    	$("#show").css("display","block");
    	$("#username").removeAttr("disabled")
    	$("#pwd").show();
    	
    	if(orgId != mainOrgId){
    		var mySelect=$("#distributionTypeSelect option");
    		mySelect.each(function (i,el) {
    			if($(el).text()==num){
    	            $(this).hide();
    	        }
    	        if($(el).text()=="充值一级审核员"){
    	            $(this).hide();
    	        }
    	        if($(el).text()=="充值二级审核员"){
    	            $(this).hide();
    	        }
    	        if($(el).text()=="充值三级审核员"){
    	            $(this).hide();
    	        }
    	        if($(el).text()=="发票审核员"){
    	            $(this).hide();
    	        }
    		})
    	}
    	
    	//数据置空
    	$("#orgId").val("");
    	$("#name").val("");
    	$("#username").val("");
    	$("#password").val("");
    	$("#distributionTypeSelect").val("");
    	$("#remark").val("");
    	
    	//获取主商户id和名称
    	$.ajax({
               type: "POST",
               url: ""+loction+"customer/querySelfCustomerAndSubCustomers",
               contentType: "application/json;charset=utf-8",
               data:"",
               async: false,
               success:function(data){
	               	//为Select追加一个Option(下拉项)
	               	$("#orgId").html("<option value=''>请选择</option>")
	               	$.each(data.data,function(i,item){
	               		$("#orgId").append('<option value='+ item.customerId +'>'+ item.customerName +'</option>'); 
	               	});
               },
               error:function(){
               	console.log("err");
               }
    	})
    	
       	if(id!=""){
       		$("#operation").html("修改操作")
       		
       		var mySelect=$("#distributionTypeSelect option");
    	    var num="商户管理员";//某个值
    		/* mySelect.each(function (i,el) {
   		        if($(el).text()==num){
   		            $(this).hide();
   		        }
    		}) */
       		$.ajax({
                type: "POST",
                url: ""+loction+"authUser/queryByUserId.do",
                contentType: "application/json;charset=utf-8",
                async: false,
                data:JSON.stringify({"id":id}),
                success:function(data){
                	//为Select追加一个Option(下拉项)
                	var entity = data.authUserEntity;
                	$("#id").val(entity.id);
                	$("#name").val(entity.name);
                	$("#username").val(entity.username);
                	
                	$("#username").attr("disabled","disabled");
                	
                	$("#password").val(entity.password);
                	$("#pwd").hide();
                	$("#remark").val(entity.remark);
                	$("#orgId").val(entity.orgId);
                	if(entity.orgId != orgId){
                		$("#orgId").attr("disabled","disabled");
                	
	                	if(entity.distributionType==40){
	                		$("#orgId").removeAttr("disabled")
	                		mySelect.each(function (i,el) {
	               		        if($(el).text()==num){
	               		            $(this).show();
	               		        }
	                		})
	                		$("#distributionTypeSelect").attr("disabled","disabled");
	            			$("#distributionTypeSelect option:last-child").attr("selected", "selected");
	                	}else {
	                		$("#orgId").attr("disabled","disabled");
	                		$("#distributionTypeSelect").attr("disabled","disabled");
	                	}
                	}else{
              		    if(entity.distributionType==40){
              		    	$("#orgId").attr("disabled","disabled");
              		    	$("#distributionTypeSelect").attr("disabled","disabled");
              		    }else{
              		    	$("#orgId").removeAttr("disabled");
              		    	$("#distributionTypeSelect").removeAttr("disabled");
              		    	mySelect.each(function (i,el) {
              	   		        if($(el).text()==num){
              	   		            $(this).hide();
              	   		        }
              	    		})
              		    }
                	}
                	$("#distributionTypeSelect").val(entity.distributionType);
                },
                error:function(){
                	console.log("err");
                }
     		})
       	}else{
       		var mySelect=$("#distributionTypeSelect option");
    	    var num="商户管理员";//某个值
    		mySelect.each(function (i,el) {
   		        if($(el).text()==num){
   		            $(this).hide();
   		        }
    		})
       	}
     }
        
    //选择从属商户后的选择事件
	$("#orgId").change(function(){ 
		
		/* var orgName = $('#orgId').find("option:selected").text()
		if(orgName == "请选择"){
			orgName="";
		}
		var name = $("#name").val()
		//获取简写拼音（调用js中方法）
        var text1 = pinyin.getCamelChars(orgName);  
		var text2 = pinyin.getCamelChars(name);  
		
		
    	$('#username').val(text1.toLowerCase()+text2.toLowerCase()); */
		
		//当前选择的商户
		var orgIds = $("#orgId").val();
		var mySelect=$("#distributionTypeSelect option");
	    var num="商户管理员";//某个值
	    if(mainOrgId == orgId){//主商户与当前登录的商户
	    	if(orgIds != orgId){
			    mySelect.each(function (i,el) {
			        if($(el).text()==num){
			            $(this).show();
			        }
			    })
			    $("#distributionTypeSelect").attr("disabled","disabled");
				$("#distributionTypeSelect option:last-child").attr("selected", "selected");
			}else{
				mySelect.each(function (i,el) {
			        if($(el).text()==num){
			            $(this).hide();
			        }
			        $("#distributionTypeSelect").removeAttr("disabled")
			        $("#distributionTypeSelect").val("");
			    })
			} 
	    }else{
	    	/* $("#distributionTypeSelect").html(""); */
	    	if(orgIds == orgId){
	    		mySelect.each(function (i,el) {
			        if($(el).text()==num){
			            $(this).hide();
			        }
			        if($(el).text()=="充值一级审核员"){
			            $(this).hide();
			        }
			        if($(el).text()=="充值二级审核员"){
			            $(this).hide();
			        }
			        if($(el).text()=="充值三级审核员"){
			            $(this).hide();
			        }
			        if($(el).text()=="发票审核员"){
			            $(this).hide();
			        }
			        $("#distributionTypeSelect").removeAttr("disabled")
			        $("#distributionTypeSelect").val("");
			    })
			}else{
				mySelect.each(function (i,el) {
				        if($(el).text()==num){
				            $(this).show();
				        }
			    })
			    $("#distributionTypeSelect").attr("disabled","disabled");
				$("#distributionTypeSelect option:last-child").attr("selected", "selected"); 
			}
	    }
	}); 
    
    //查看
    function view(ids){
    	var id=$.trim(ids)
    	//显示页面
    	$("#vshow").css("display","block");
    	var org ;
    	if(id!=""){
       		$.ajax({
                type: "POST",
                url: ""+loction+"authUser/queryByUserId.do",
                contentType: "application/json;charset=utf-8",
                async: false,
                data:JSON.stringify({"id":id}),
                success:function(data){
                	//为Select追加一个Option(下拉项)
                	var entity = data.authUserEntity;
                	//$("#vid").val(entity.id);
                	$("#vname").html(entity.name);
                	$("#vusername").html(entity.username);
                	$("#vpassword").html(entity.password);
                	$("#vremark").html(entity.remark);
                	//$("#vorgId").html(entity.orgId);
                	org = entity.orgId;
                },
                error:function(){
                	console.log("err");
                }
     		})
       	}
    	
    	//获取主商户id和名称
    	$.ajax({
               type: "POST",
               url: ""+loction+"customer/queryTopCustomers",
               contentType: "application/json;charset=utf-8",
               data:"",
               async: false,
               success:function(data){
	               	//为Select追加一个Option(下拉项)
	               	$("#vorgId").html("<option value=''>请选择</option>")
	               	$.each(data.data,function(i,item){
	               		if(org == item.customerId){
		               		$("#vorgId").html(item.customerName)
	               		}
	               	});
               },
               error:function(){
               		console.log("err");
               }
    	})
    }
    
    $(".delqf").live("click",function(){
   	 var delcs=$(this).attr("data-qx").split(",");
   	 del(delcs[0],delcs[1],delcs[2]);
    })
    //删除操作
    function del(ids,usernames,delType){
    	var id=$.trim(ids)
    	if(usernames == username){
    		layer.msg("不能删除本身！");
    		return false;
    	}
    	if(delType == "90"){
    		layer.msg("不能删除系统账号！");
    		return false;
    	}

		layer.confirm('确认要删除此账户吗？', {
			btn: ['确认','取消'] //按钮
		}, function(){
			$.ajax({
	            type: "POST",
	            url: ""+loction+"authUser/delete.do",
	            contentType: "application/json;charset=utf-8",
	            data:JSON.stringify({"id":id}),
	            async: false,
	            success:function(data){
	               	//为Select追加一个Option(下拉项)
	            	layer.msg(data.msg);
	            	$(".table1 tbody").html("");
	            	pageStart(1,10);
	            },
	            error:function(){
	            	console.log("err");
	            }
	 		})
		}, function(){
			 /* layer.msg('也可以这样', {
			    time: 200 //20s后自动关闭
			  }); */
		});
		    	
    	
    	
    }
    
    //启用禁用操作
     function enabled(id,status,newPageNume){
    	$.ajax({
            type: "POST",
            url: ""+loction+"authUser/enabled.do",
            contentType: "application/json;charset=utf-8",
              data:JSON.stringify({"id":id,"enabled":status}), 
            success:function(data){
            	$(".table1 tbody").html("");
            	pageStart(newPageNume,10);
            },
            error:function(){
            	console.log("err");
            }
          })
    }
    
    //重置密码时显示页面
    function restPWD(id){
    	$("#restPWD").css("display","block");
    	$('.newpass').val("");
    	$('.newpass1').val("");
    	$("#pwdId").val(id);
    }
    $(".checkPassword").click(function(){
    	var id = $("#pwdId").val();
    	
    	var newpass = $.trim($('.newpass').val());
    	if(newpass==""){
    		layer.tips('不能为空!', '.newpass');
    		return false;
    	}
    	var newpass1 = $.trim($('.newpass1').val());
    	if(newpass1==""){
    		layer.tips('不能为空!', '.newpass1');
    		return false;
    	}
    	if(newpass != newpass1){
    		layer.msg("两次输入密码不一致");
    		return false;
    	}
    	$.ajax({
            type: "POST",
            url: ""+loction+"authUser/resetPWD",
            contentType: "application/json;charset=utf-8",
              data:JSON.stringify({"id":id,"password":hex_md5(newpass)}), 
            success:function(data){
            	$("#restPWD").css("display","none");
            	$(".table1 tbody").html("");
            	layer.msg(data.msg);
            	var newPageNume=$(".pages-size em i").first().text();
            	pageStart(newPageNume,10);
            },
            error:function(){
            	console.log("err");
            }
         })     	
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

    $("body .slid_toggle").live("click",function(){
    	newPageNume=$(".pages-size em i").first().text();
    	id=$(this).find("img").attr("data-index");
    	if($(this).find("img").attr("data-status")==0){
    		$(this).find("img").removeClass("statuss1").addClass("statuss0").attr("data-status","1")
    		enabled(id,1,newPageNume)
    	}else{
    		customerId=$(this).find("img").attr("data-index")
    		$(this).find("img").removeClass("statuss0").addClass("statuss1").attr("data-status","0")
    		enabled(id,0,newPageNume)
    	}
    	pageStart(newPageNume,10);
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
	$(".page_btn").on("click",function(){
	    if(($(".page_num").val()*1)>($(".pageAllnum").html()*1)){
		    layer.msg("请输入正确页码");
		    return false;
	    }else{
		    $(".table1 tbody").html("");
		    pagestars=$(".page_num").val();
		    orgIds = $(".orgId").val();
		 	distributionType = $("#distributionType").val();
		 	username = $(".username").val();
		 	name = $(".name").val();
		 	dateBegin = $("#datetimeStart").val();
		 	dateEnd = $("#datetimeEnd").val();
		  	mainCustomerId = $(".mainCustomerId").val();
		  	$(".table1 tbody").html("");
		  	$(".pages-size").html("");
		  	pageStart(pagestars,10,orgIds,distributionType,username,name,dateBegin,dateEnd);
		    return pagestars
		}
	})
     
    function pageStart(pageNum,pageSize,orgIds,distributionType1,username,name,dateBegin,dateEnd){
		if(orgIds){}else{orgIds=""}
		if(distributionType1){}else{distributionType1=""}
		if(username){}else{username=""}
		if(name){}else{name=""}
		if(dateBegin){}else{dateBegin=""}
		if(dateEnd){}else{dateEnd=""}
        $.ajax({
                type: "POST",
                url: ""+loction+"authUser/queryMainList.do",
                contentType: "application/json;charset=utf-8",
                data:JSON.stringify({"orgId":parseInt(orgIds),"distributionType":distributionType1,"username":username,"name":name,"beginTime":dateBegin,"endTime":dateEnd,"pageNum":parseInt(pageNum),"pageSize":parseInt(pageSize)}),
                success:function(data){
                    $(".pages-size").html("共<em><i>"+data.pageNum+"</i>/<i class='pageAllnum'>"+data.totalPage+"</i></em>页");
                    $.each(data.userList,function(i,item){
                    	//<a onclick='view("+item.id+")'>查看</a>
                    	var text = item.distributionType;
                    	if(text=='10'){
                    		text = '基础业务操作员';
                    	}else if(text=='21'){
                    		text = '充值一级审核员';
                    	}else if(text=='22'){
                    		text = '充值二级审核员';
                    	}else if(text=='23'){
                    		text = '充值三级审核员';
                    	}else if(text=='31'){
                    		text = '代付款一级审核员';
                    	}else if(text=='32'){
                    		text = '代付款二级审核员';
                    	}else if(text=='40'){
                    		text = '商户管理员';
                    	}else if(text=='50'){
                    		text = '发票审核员';
                    	}else{
                    		text = '系统账号';
                    	}
                    	if(distributionType == 40){
                    		operate = "<a onclick='openAddBtn("+item.id+")'>编辑</a> <a class='delqf' data-qx="+item.id+","+item.username+","+item.distributionType+">删除</a>";
                    		states = "<span class='slid_toggle'><img data-index="+item.id+" data-status="+item.enabled+" class='statuss"+item.enabled+"' src='../images/hoverIcon.png'/></span>";
                    	}else{
                    		operate = "";
                    		states = "";
                    	}
                    	
	                   	var tr="<tr><td>"+formatDateB(item.createTime)+"</td>\
	                   	<td>"+isNotNullAndUndifine(item.name)+"</td>\
                      	<td>"+isNotNullAndUndifine(item.username)+"</td>\
                      	<td>"+text+"</td>\
                      	<td>"+isNotNullAndUndifine(item.orgName)+"</td>\
                      	<td>"+operate+"</td>\
                      	<td>"+states+"</td>\
                      	<td>"+isNotNullAndUndifine(item.remark)+"</td></tr>";
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
    	//$("#orgId").removeAttr("disabled")
    })
    /*  $(".deld").click(function(){
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
    })  */
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
    $(".del_shaow i").click(function(){
    	$(this).parent().parent().parent().parent().hide();
    })
    $("#loginName").html(name);
    $(".copicon").html(isNotNullAndUndifine(customerName1));
</script>
</html>