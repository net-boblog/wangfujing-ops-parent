<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setAttribute("ctx", request.getContextPath());%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${ctx}/js/jquery-1.9.1.js"></script>
<script src="${ctx}/js/jquery.form.js"></script>
<script src="${ctx}/assets/js/validation/bootstrapValidator.js"></script>
<title>区间信息</title>
<script type="text/javascript">
	__ctxPath = "${pageContext.request.contextPath}";
	$(function(){
  		$("#save").click(function(){
  			saveFrom();
  		});
  		$("#close").click(function(){
  			$("#pageBody").load(__ctxPath+"/jsp/search/Interval/IntervalMessage.jsp");
  		});
	});
	
	$(function() {
			var channel1=$("#channel1").val();
			$.ajax({
				type: "post",
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				url: __ctxPath+"/back/channelsList",
				dataType: "json",
				success: function(response) {
					var result = response;
					var groupSid = $("#groupSid_select");
					for ( var i = 0; i < result.list.length; i++) {
						var ele = result.list[i];
						var option;
						if(channel1 == ele.channelCode){
							option = $("<option value='" + ele.channelCode + "'selected='selected'>"
									+ ele.channelName + "</option>");
							option.appendTo(groupSid);
						}else{
						option = $("<option value='" + ele.channelCode + "'>"
								+ ele.channelName + "</option>");
						option.appendTo(groupSid);
						}
					}
					return;
				}
		});
		
	});
  	//保存数据
  	function saveFrom(){
  		$.ajax({
  			 type:"post",
 	        contentType: "application/x-www-form-urlencoded;charset=utf-8",
 	        url:__ctxPath + "/back/intervalUpdate",
 	        dataType: "json",
 	        data: $("#theForm").serialize(),
	        success:function(response) {
	        	if(response.success == true){
					$("#modal-body-success").html("<div class='alert alert-success fade in'>"+
						"<i class=''></i><strong>修改成功，返回列表页!</strong></div>");
  	  				$("#modal-success").attr({"style":"display:block;","aria-hidden":"false","class":"modal modal-message modal-success"});
				}else{
					$("#model-body-warning").html("<div class='alert alert-warning fade in'><i class='fa-fw fa fa-times'></i><strong>"+response.message+"</strong></div>");
					$("#modal-warning").attr({"style":"display:block;","aria-hidden":"false","class":"modal modal-message modal-warning"});
				}
        	}
		});
  	}
  	function successBtn(){
		$("#modal-success").attr({"style":"display:none;","aria-hidden":"true","class":"modal modal-message modal-success fade"});
		$("#pageBody").load(__ctxPath+"/jsp/search/Interval/IntervalMessage.jsp");
	}
	</script> 
</head>
<body>
	<div class="page-body">
		<div class="row">
			<div class="col-lg-12 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-lg-12 col-sm-12 col-xs-12">
						<div class="widget radius-bordered">
							<div class="widget-header">
								<span class="widget-caption">修改</span>
							</div>
							<div class="widget-body">
								<form id="theForm" method="post" class="form-horizontal">   
									<input type="hidden" id="sid" name="sid" value="${param.sid }"/>
									<input type="hidden" id="channel1" name="channel1" value="${param.channel }"/>
									<div class="form-group">
										<label class="col-lg-3 control-label">渠道</label>
										<div class="col-lg-6">
											<select id="groupSid_select" name="channel" style="width:200px;padding: 0px 0px">
										</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">field</label>
										<div class="col-lg-6">
										<span  class="form-control">currentPrice</span>
											</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">描述</label>
										<div class="col-lg-6">
										<span  class="form-control">价格区间</span>
											</div>
									</div>
         							<div class="form-group">
										<div class="col-lg-offset-4 col-lg-6">
											<input class="btn btn-success" style="width: 25%;" id="save" type="button" value="保存" />&emsp;&emsp;
											<input class="btn btn-danger" style="width: 25%;" id="close" type="button" value="取消" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 <!-- /Page Body -->
	<script>
    </script>
</body>
</html>