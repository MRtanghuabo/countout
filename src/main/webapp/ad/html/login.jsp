<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%pageContext.setAttribute("ctx", request.getContextPath());
%>
<%-- <%@ include file="tag.jsp"%> --%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="odsp">
    <title>云职结算平台</title>
    <link rel='stylesheet' href="${ctx}/ad/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/ad/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="${ctx}/ad/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="${ctx}/ad/css/style.css">
</head>
<body>
    <div class="wrap">
        <div class="">
            <div class="login">
                <h1>云职<i>·</i>结算平台</h1>
                <div class="login_dal">
                    <p><i>用户名 :</i><input class="userName" type="text"/></p>
                    <p><i>密&nbsp;&nbsp;&nbsp;码 :</i><input class="pasword" type="password"/></p>
                    <!-- <div class="drag">
				        <div class="bg"></div>
				        <div class="text">请拖动滑块解锁</div>
				        <button class="btns">&gt;&gt;</button>
				    </div> -->
                    <button class="loginButton">登录</button>
                </div>
            </div>
        </div>
    </div>
</body >
<script src="${ctx}/ad/js/jquery-1.7.2.min.js"></script>
<script src="${ctx}/ad/js/md5.js"></script>
<script src="${ctx}/ad/js/layer/layer.js"></script>
<script src="${ctx}/ad/js/address.js"></script>
<script>
	var _ctx = '${ctx}';
   $(function(){
	   if (!$.support.leadingWhitespace) {
		   alert("浏览器版本过低，请更新IE浏览器或使用其他浏览器");
       }
   	document.body.addEventListener('keyup', function (e) {
           if (e.keyCode == '13') {
        	   $(".loginButton").click();
           }
       })
        $(".loginButton").click(function(){
      		var pwd=hex_md5($(".pasword").val());
            $(this).attr("disabled","disabled");
            $.ajax({
              	 url:_ctx+"/login.do",
                   type:"post",
                   data:JSON.stringify({
              		username:$(".userName").val(),
              		password:pwd
              	}),
                   contentType : 'application/json;charset=utf-8', //设置请求头信息  
                   dataType: "json",//预期服务器返回的数据类型
                   success:function(data){
                  	 window.location.href=_ctx+'/ad/html/authUser.jsp?0';
                   },
                   error:function(e){
                       //window.clearInterval(timer);
                       $(".loginButton").removeAttr("disabled");
                   }
               });
          
        })
    })

</script>
</html>