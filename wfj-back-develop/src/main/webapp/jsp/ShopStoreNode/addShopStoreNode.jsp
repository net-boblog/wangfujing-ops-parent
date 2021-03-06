<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setAttribute("ctx", request.getContextPath());%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${ctx}/js/jquery-1.9.1.js"></script>
<script src="${ctx}/assets/js/validation/bootstrapValidator.js"></script>
<script type="text/javascript">
	__ctxPath = "${pageContext.request.contextPath}";
  	$(function(){
  		$("#save").click(function(){
  			saveFrom();
  		});
  		$("#close").click(function(){
  			$("#pageBody").load(__ctxPath+"/jsp/ShopStoreNode.jsp");
  		});
  		//获取供应商
  		var url = __ctxPath + "/supplyBrandShop/selectAllSupply3";
  		var suppId = $("#suppId");
		$.ajax({
			type: "post",
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			url: url,
			dataType: "json",
			success: function(response) {
				var result = response;
				for ( var i = 0; i < result.length; i++) {
					var ele = result[i];
					var option = $("<option value='" + ele.sid + "'>"
							+ ele.supplyName + "</option>");
					option.appendTo(suppId);
				}
				return;
			},
			error: function(XMLHttpRequest, textStatus) {		      
				var sstatus =  XMLHttpRequest.getResponseHeader("sessionStatus");
				if(sstatus != "sessionOut"){
					$("#warning2Body").text(buildErrorMessage("","系统出错！"));
					$("#warning2").show();
				}
				if(sstatus=="sessionOut"){     
	            	 $("#warning3").css('display','block');     
	             }
			}
		});
  		$('#theForm').bootstrapValidator();
	});
  	//保存数据
  	function saveFrom(){
		var url = __ctxPath + "/storeDisplay/insertOrUpdateStore";
  		$.ajax({
			type: "post",
			contentType: "application/x-www-form-urlencoded;charset=utf-8",
			url: url,
			dataType:"json",
			data: $("#theForm").serialize(),
			success: function(response) {
				if(response.success == 'true'){
					$("#modal-body-success").html("<div class='alert alert-success fade in'>"+
							"<i class='fa-fw fa fa-times'></i><strong>添加成功，返回列表页!</strong></div>");
 	     	  		$("#modal-success").attr({"style":"display:block;","aria-hidden":"false","class":"modal modal-message modal-success"});
				}else{
					$("#warning2Body").text(buildErrorMessage("","添加失败！"));
					$("#warning2").show();
				}
				return;
			},
			error: function(XMLHttpRequest, textStatus) {		      
				var sstatus =  XMLHttpRequest.getResponseHeader("sessionStatus");
				if(sstatus != "sessionOut"){
					$("#warning2Body").text(buildErrorMessage("","系统出错！"));
					$("#warning2").show();
				}
				if(sstatus=="sessionOut"){     
	            	 $("#warning3").css('display','block');     
	             }
			}
		});
  	}
  	function successBtn(){
		$("#modal-success").attr({"style":"display:none;","aria-hidden":"true","class":"modal modal-message modal-success fade"});
		$("#pageBody").load(__ctxPath+"/jsp/ShopStoreNode.jsp");
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
								<span class="widget-caption">添加门店</span>
							</div>
							<div class="widget-body">
								<form id="theForm" method="post" class="form-horizontal">
									<input type="hidden" name="username" value=""/>
									<script type="text/javascript">
										$("input[name='username']").val(getCookieValue("username"));
									</script>
									<div class="form-group">
										<label class="col-lg-3 control-label">供应商：</label>
										<div class="col-lg-6">
											<select class="form-control" id="suppId" name="supplySid">
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">门店名称：</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="shopName" name="shopName" placeholder="必填"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">联系人：</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="contactPerson" name="contactPerson" placeholder="必填"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">门店地址：</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="address" name="address" placeholder="必填"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">联系邮箱：</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="mailbox" name="mailbox" placeholder="必填"/>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">手机号：</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="phone" name="phone" placeholder="必填"/>
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