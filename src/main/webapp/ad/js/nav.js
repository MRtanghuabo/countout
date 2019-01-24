/**
 * 浏览器关闭时之心的方法
 */
/*window.onunload = function(){
	    alert("关闭浏览器");
	    $.ajax({
	        type: "POST",
	        url: ""+loction+"/logout.do",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
//	        	window.location.href=loction+"ad/html/login.jsp";
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
	};*/


$(function(){
	var navName = sessionStorage.getItem('navName');
	var	navNameArr=navName.split(" ");
	var flags = sessionStorage.getItem('flag');
	if(navName!="fat"){
		$("."+navNameArr[0]+"").show();
		$("#"+navNameArr[0]+"").find(".ud").attr("src","../images/down_icon.png")
	}
	var url2=window.location.href;
	var urlArr2 = url2.split('?');
   $(".left_nav ul li").eq(urlArr2[1]).addClass("on").siblings().removeClass("on");
   
   $(".left_nav ul li").click(function(){
	   var flags = sessionStorage.getItem('flag');
	   if($(this).attr("data-parent")=="fat"){
		   if(flags==1){
			   $(this).find(".ud").attr("src","../images/down_icon.png");
			   $("."+$(this).attr("data-name")+"").slideDown();
			   sessionStorage.setItem('flag',2);
		   }else if(flags==2){
			   $(this).find(".ud").attr("src","../images/right_icon.png")
			   $("."+$(this).attr("data-name")+"").slideUp();
			   sessionStorage.setItem('flag',1);
			  
		   }
	   }else{
		   window.location.href=$(this).attr("data-address")+"?"+$(this).index();
		   sessionStorage.setItem('navName',$(this).attr("class"));
		   if($(this).attr("data-parent")=="chl"){
			   sessionStorage.setItem('flag',2);
		   }else{
			   sessionStorage.setItem('flag',1);
		   }
	   }
   })
    
    
    $(".back").click(function(){
	    $(".shaow").hide();
	    $(".ever_text input:text").val("");
	    $(".ever_text input:password").val("");
	})

    $(".shaow h1 i").click(function(){
	    $(".shaow").hide();
	})
   $(".login_out").click(function(){
       $(this).find("em").show();
        $(this).find("b").find("img").attr("src","../images/icon_down.png")
    })
    $(".login_out").mouseleave(function(){
        $(this).find("em").hide();
        $(this).find("b").find("img").attr("src","../images/icon_up.png")
    }) 
   
    $(".logout").click(function(){
    	$.ajax({
	        type: "POST",
	        url: ""+loction+"/logout.do",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	window.location.href=loction+"ad/html/login.jsp";
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
    })
    
    $(".resetPassword").click(function(){
    	$(".shaow4").show(); 
   	   
    })
    $(".oldpass").blur(function(){
    	var pwd=hex_md5($(this).val());
    	if(pwd!=$(".olds").val()){
    		layer.tips('请输入正确密码', '.oldpass');
    		$(".checkPassword").prop("disabled","disabled").addClass("disable");
    		return false;
    	}else{
    		 $(".checkPassword").removeAttr("disabled").removeClass("disable");
    	}     	
    })
    	$(".checkPassword").click(function(){
   		if($(".newpass").val() == ""){
    		layer.tips('不能为空', '.newpass');
    		return false;
        }
   		if($(".newpass1").val() == ""){
    		layer.tips('不能为空', '.newpass1');
    		return false;
        }
   		if($(".newpass1").val() != $(".newpass").val()){
    		layer.tips('两次新密码输入不同', '.newpass1');
    		return false;
        }
   		var newpas=hex_md5($(".newpass1").val());
   		 $.ajax({
	        type: "POST",
	     	 data:JSON.stringify({"id":$(".oldsId").val(),"password":newpas}), 
	        url: ""+loction+"/authUser/resetPWD",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	layer.msg("更改成功");
	        	$(".shaow").hide();
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
   		
   	})
    $.ajax({
	        type: "POST",
	     	data:JSON.stringify({"id":oldPassid}), 
	        url: ""+loction+"/authUser/queryByUserId.do",
	        contentType: "application/json;charset=utf-8",
	        dataType: "json",//预期服务器返回的数据类型
	        success:function(data){
	        	$(".olds").val(data.authUserEntity.password);
	        	$(".oldsId").val(data.authUserEntity.id)
	        },
	        error:function(){
	        	console.log("err");
	        }
	   })
	   
	     $.ajax({
            type: "POST",
            url: ""+loction+"remind/queryMessagesCount",
            contentType: "application/json;charset=utf-8",
              data:JSON.stringify(), 
            success:function(data){
				
				if(data==0){
					$(".login_out span label").css("display","none");
				}else{
					$(".login_out span label").html(data);
				}
            },
            error:function(){
            	console.log("err");
            } 
          })
})



