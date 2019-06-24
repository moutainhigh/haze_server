<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=7" />
		<title>详细信息</title>
	</head>
	<body>
	
		<div class="pageContent">
		
		 
				
				<form method="post" action="backBorrowOrder/saveUpdateBorrow"
				onsubmit="return validateCallback(this, dialogAjaxDone);"
				class="pageForm required-validate">
				<input type="hidden" name="id" value="${borrow.id}" />
				<input type="hidden" name="parentId" value="${params.parentId}" />
					<div class="pageFormContent" layoutH="50" style="overflow: auto;">
				<fieldset>
						<legend>借款信息333</legend>
				   <dl>
						<dt>用户名:</dt>
						<dd class="unit">
						  <input type="text" readonly="readonly" size="30"  value="${borrow.realname}" />
						</dd>
					</dl>
					 
					<dl>
						<dt>借款金额:</dt>
						<dd class="unit">
						 <input type="text" name="borrowSum" readonly="readonly" size="30"  value="${borrow.moneyAmount/100 }" />
						</dd>
					</dl>
					<dl>
						<dt>借款利率(万分之一):</dt>
						<dd class="unit">
						  <input type="text" name="annualInterestRate" readonly="readonly" size="30"  value="${borrow.apr }	" />
						</dd>
					</dl>
					 
					<dl>
						<dt>借款期限(天):</dt>
						<dd class="unit">
						 <input type="text" name="annualInterestRate" readonly="readonly" size="30"  value="${borrow.loanTerm }	" />
 
						</dd>
					</dl>
		 
					  
					  <dl>
						<dt>借款服务费:(元)</dt>
						<dd class="unit">
						  <input type="text"   readonly="readonly" size="30"  value="${borrow.loanInterests/100 }" />
						</dd>
					</dl>
					<dl>
						<dt>申请时间:</dt>
						<dd class="unit">
					    	<input type="text"  readonly="readonly" size="30"  value="<fmt:formatDate value="${borrow.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
						</dd>
					</dl>
					
					 
				 
				
				</fieldset>
					<fieldset>
					<legend>审核信息</legend>
				 <dl class="nowrap">
								<dt>审核状态:</dt>
								<dd><input name="status"   id="borrowStatus" value="20" type="radio" />复审通过
								&nbsp;&nbsp;&nbsp;&nbsp;<input name="status" id="borrowStatus" checked="checked" value="-4"   type="radio" />复审未通过
								&nbsp;&nbsp;&nbsp;&nbsp;<input name="status" id="borrowStatus" value="-40"   type="radio" />用户取消借款
								</dd>
							</dl>
							</fieldset>
				<fieldset>
					<legend>审核信息</legend>
					<dl>
						<dt>初审核人:</dt>
						<dd class="unit">
					    	<input type="text"   readonly="readonly" size="30"  value="${borrow.id}" />
						</dd>
					</dl>
					<dl>
						<dt>初审时间:</dt>
						<dd class="unit">
						  <input type="text"   readonly="readonly" size="30"  value="<fmt:formatDate value="${borrow.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>初审备注:</dt>
						<dd class="unit">
					    	<textarea class="textInput valid" rows="5" cols="45" readonly="readonly">${borrow.orderTime}</textarea>
						</dd>
					</dl>
					
					<dl>
						<dt>复审核人:</dt>
						<dd class="unit">
						<input type="text"   readonly="readonly" size="30"  value="${borrow.orderTime}" />
						</dd>
					</dl>
					<dl>
						<dt>复审时间:</dt>
						<dd class="unit">
					    	<input type="text"   readonly="readonly" size="30"  value="<fmt:formatDate value="${borrow.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
						</dd>
					</dl>
					<dl class="nowrap">
						<dt>复审备注:</dt>
						<dd class="unit">
						<textarea class="textInput valid" rows="5" cols="45" readonly="readonly">${borrow.orderTime}</textarea>
						</dd>
					</dl>
					
				 
					 
				 
					 
				 
					 
				</fieldset>
				
				  <dl class="nowrap">
						<dt>备注:</dt>
						<dd class="unit">
						<textarea class="editor" rows="16" cols="75" readonly="readonly">${borrow.remark}</textarea>
						</dd>
					</dl>
				</div>
				<div class="formBar">
					<ul>
						<li>
						<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit" >
										保存
									</button>
								</div>
							</div>
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
