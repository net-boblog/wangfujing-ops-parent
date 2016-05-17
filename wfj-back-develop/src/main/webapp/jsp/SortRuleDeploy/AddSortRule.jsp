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
<title>添加排序规则</title>
<script type="text/javascript">
	__ctxPath = "${pageContext.request.contextPath}";
	$(function(){
  		$("#save").click(function(){
  			saveFrom();
  		});
  		$("#close").click(function(){
  			$("#pageBody").load(__ctxPath+"/jsp/SortRuleDeploy/SortRuleMessage.jsp");
  		});
	});
  	//保存数据
  	function saveFrom(){
  		var showText = $("#showText").attr("value");
  		var showOrder =	$("#showOrder").attr("value");
  		var defaultOrderBy = $("#defaultOrderBy").attr("value");
  		$.ajax({
  			 type:"post",
 	        contentType: "application/x-www-form-urlencoded;charset=utf-8",
 	        url:__ctxPath + "/back/sortRuleSave",
 	        dataType: "json",
 	        data: $("#theForm").serialize(),
	        success:function(response) {
	        	if(response.success == true){
					$("#modal-body-success").html("<div class='alert alert-success fade in'>"+
						"<i class='fa-fw fa fa-times'></i><strong>添加成功，返回列表页!</strong></div>");
  	  				$("#modal-success").attr({"style":"display:block;","aria-hidden":"false","class":"modal modal-message modal-success"});
				}else{
					alert(response.errorCode+response.message);
					/* $("#model-body-success").html("<div class='alert alert-warning fade in'><i class='fa-fw fa fa-times'></i><strong>修改失败!</strong></div>");
 	     	  		$("#modal-warning").attr({"style":"display:block;","aria-hidden":"false","class":"modal modal-message modal-warning"}); */
				}
        	}
		});
  	}
  	function successBtn(){
		$("#modal-success").attr({"style":"display:none;","aria-hidden":"true","class":"modal modal-message modal-success fade"});
		$("#pageBody").load(__ctxPath+"/jsp/SortRuleDeploy/SortRuleMessage.jsp");
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
								<span class="widget-caption">添加排序规则</span>
							</div>
							<div class="widget-body">
								<form id="theForm" method="post" class="form-horizontal">   
									<input type="hidden" id="sid" name="sid"/>
									<div class="form-group">
										<label class="col-lg-3 control-label">描述</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="showText" name="showText" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">显示顺序</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="showOrder" name="showOrder" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">默认排序规则</label>
										<div class="col-lg-6">
											<select id="orderRule" name="orderRule">
													<option selected="selected" value="asc">升序</option>
													<option value="desc">降序</option>
											</select>
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