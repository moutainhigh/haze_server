<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert saveUpdateUser.jspr</title>
	</head>
	<body>
		<div class="pageContent">
			<form id="frm" method="post" enctype="multipart/form-data"
				action="channel/saveUpdateChannelSuperInfo"
				onsubmit="return validateCallback(this, dialogAjaxDone);"
				class="pageForm required-validate">
				<input type="hidden" name="parentId" value="${params.parentId}" />
				<input type="hidden" name="id" id="id" value="${channelSuperInfo.id }">
				<div class="pageFormContent" layoutH="50" style="overflow: auto;">
					<div class="form-wrap">
						<div class="form-item">
							<label>
								渠道商名称:
							</label>
							<input name="channelSuperName" value="${channelSuperInfo.channelSuperName}"
								   class="required"	type="text" alt="请输入名称" size="30"/>
						</div>
						<div class="form-item">
							<label>
								渠道商编码:
							</label>
							<input name="channelSuperCode" value="${channelSuperInfo.channelSuperCode}"
								   class="required"	type="text" alt="请输入编码" size="30"/>
						</div>
						<div class="form-item">
							<label>
								备注:
							</label>
							<textarea  name="remark" rows="5" cols="60" maxlength="50">${channelSuperInfo.remark }</textarea>
						</div>
					</div>
				</div>
				<div class="formBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">
										保存
									</button>
								</div>
							</div>
						</li>
						<li>
							<div class="button">
								<div class="buttonContent">
									<button type="button" class="close">
										取消
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</body>
	
</html>