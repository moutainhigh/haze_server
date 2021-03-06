<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>

<form id="pagerForm" onsubmit="return navTabSearch(this);" action="customService/getRepaymentPage?myId=${params.myId}" method="post">
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						渠道商：
						<select name="superChannelId" id="superChannelId">
							<option value="">全部</option>
							<option value="-999" <c:if test="${searchParams == '-999'}">selected="selected"</c:if> >自然流量</option>
							<c:forEach var="channelSuperInfo" items="${channelSuperInfos}">
								<option value="${channelSuperInfo.id}" <c:if test="${channelSuperInfo.id eq params.superChannelId}">selected="selected"</c:if>>${channelSuperInfo.channelSuperName}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						渠道名称：
						<input type="text" name="channelName" id="channelName"
						value = "${params.channelName}">
					</td>
					<td>
						用户名称:
						<input type="text" name="userAccountLike" id="userAccountLike"
							   value="${params.userAccountLike }" />
					</td>
					<td>
						手机:
						<input type="text" name="userMobileLike" id="userMobileLike"
							   value="${params.userMobileLike }" />
					</td>
					<td>
						<div class="buttonActive">
							<div class="buttonContent">
								<button type="submit">
									查询
								</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="pageContent">
		<jsp:include page="${BACK_URL}/rightSubList">
			<jsp:param value="${params.myId}" name="parentId"/>
		</jsp:include>
		<table class="table" style="width: 100%;" layoutH="155" nowrapTD="false">
			<thead>
				<tr>
					<th align="center"  >
						序号
					</th>
					<th align="center">
						渠道名称
					</th>
					<th align="center"  >
						姓名
					</th>
					<th align="center" >
						手机号
					</th>
					<%--<th align="center"  >
						是否是老用户
					</th>--%>
					<th align="center">
						成功还款次数
					</th>
					<th align="center" >
						借款到账金额
					</th>
					<th align="center" >
						服务费
					</th>
					<th align="center" >
						总需要还款金额
					</th>
					<th align="center" >
						已还金额
					</th>

					<th align="center" >
						放款时间
					</th>
					<th align="center" >
						预期还款时间
					</th>
					<%--<th align="center" >
						逾期天数
					</th>--%>
					<th align="center"  >
						状态
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="repayment" items="${pm.items }" varStatus="status">
					<tr target="repaymentId" rel="${repayment.id }">
						<td>
							${status.count}
						</td>
						<td>
							${repayment.channelName}
						</td>
						<td>
							${repayment.realname}
						</td>
						<td>
							${repayment.userPhone }
						</td>
					<%--	<td>
							<c:if test="${repayment.customerType == '0'}">新用户</c:if>
							<c:if test="${repayment.customerType == '1'}">老用户</c:if>
						</td>--%>
						<td class="loanSuccessCount">
							${repayment.loanCount}
						</td>
						<td>
							<fmt:formatNumber pattern='###,###,##0.00' value="${repayment.repaymentPrincipal / 100.00}"/>
						</td>
						<td>
							<fmt:formatNumber pattern='###,###,##0.00' value="${repayment.repaymentInterest / 100.00}"/>
						</td>
						<td>
							<fmt:formatNumber pattern='###,###,##0.00' value="${repayment.repaymentAmount / 100.00}"/>
						</td>
						<td>
							<fmt:formatNumber pattern='###,###,##0.00' value="${repayment.repaymentedAmount / 100.00}"/>
						</td>
						<td>
							<fmt:formatDate value="${repayment.creditRepaymentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							<fmt:formatDate value="${repayment.repaymentTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<%--<td>
							${repayment.lateDay }
						</td>--%>
						<td>
							${BORROW_STATUS_ALL[repayment.status]}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:set var="page" value="${pm }"></c:set>
		<%@ include file="../page.jsp"%>
	</div>
</form>

<script type="text/javascript">
	// $(function(){
	// 	var $statuses = $("#statuses");
	// 	$statuses.bind("change", function(){
	// 		if($statuses.val() == '-11'){
	// 			$("#overdueStatusTd").show();
	// 		}
	// 		else{
	// 			$("#overdueStatusTd").hide();
	// 			$("#overdueStatus").val("");
	// 		}
	// 	});
	// 	$statuses.trigger("change");
	// });
	function customerChangeDHExcel(obj){
		var statuses = "";
		<c:forEach items="${params.statuses}" var="status">
			statuses += "&statuses=" + ${status};
		</c:forEach>
		var href=$(obj).attr("href");
		var userAccountLike=$("#userAccountLike").val();
		var userMobileLike=$("#userMobileLike").val();
		var toHref = href + "&userAccountLike=" + userAccountLike + "&userMobileLike=" + userMobileLike;
		$(obj).attr("href",toHref);
		return true;
	}
	if (renderLoanSuccessCount) {
		renderLoanSuccessCount()
	}
</script>