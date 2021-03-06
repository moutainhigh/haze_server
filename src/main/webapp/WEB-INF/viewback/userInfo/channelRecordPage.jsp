<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
%>

<form id="pagerForm" onsubmit="return navTabSearch(this);" action="channel/getChannelRecordPage?myId=${params.myId}" method="post">
	<div class="pageHeader">
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<%--<td>
						注册用户:
						<input type="text" name="userName"
							   value="${params.userName}" />
					</td>
					
					 <td>
						联系方式:
						<input type="text" name="userTel"
							   value="${params.userTel}" />
					</td>
					<td>
						推广员:
						<input type="text" name="realname"
							   value="${params.realname}" />
					</td>--%>
					<td>
							渠道商:
						<select name="channelSuperId">
                            <option value="">全部</option>
							<option name="channelSuperId" value="-999" <c:if test="${params.userFrom == '0'}">selected="selected"</c:if>>自然流量</option>
							<c:forEach var="channelSuperInfo" items="${channelSuperInfos}">
								<option value="${channelSuperInfo.id}" <c:if test="${channelSuperInfo.id eq params.channelSuperId}">selected="selected"</c:if>>${channelSuperInfo.channelSuperName}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						渠道名称：
						<input type="text" name="channelName"
							   value="${params.channelName}" />
					</td>
						<td>
							手机号：
							<input type="text" name="userPhone"
								   value="${params.userPhone}" />
						</td>
					<td>
							注册时间：
							<input type="text" name="beginTime" id="beginTime" value="${params.beginTime}" class="date textInput readonly" datefmt="yyyy-MM-dd"  readonly="readonly"/>
							到<input type="text" name="endTime" id="endTime" value="${params.endTime}" class="date textInput readonly" datefmt="yyyy-MM-dd"  readonly="readonly"/>
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
		<table class="table" style="width: 100%;" layoutH="160" nowrapTD="false">
			<thead>
				<tr>
					<th align="center"  >
						序列
					</th>
					<th align="center"  >
						渠道商名称
					</th>
					<th align="center">
						渠道名称
					</th>
					<th align="center"  >
						注册用户姓名
					</th>
					<th align="center"  >
						注册用户手机号
					</th>
					<th align="center" >
						注册时间
					</th>
					<%--<th align="center"  >
						推广员姓名
					</th>
					<th align="center"  >
						推广员电话
					</th>--%>
					<%--<th align="center" >
						负责人
					</th>--%>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="channel" items="${pm.items }" varStatus="status">
					<tr target="id" rel="${channel.id }">
						<td>
							${status.index+1}
						</td>
						<td>
							${channel.channelSuperName}
						</td>
						<td>
							${channel.channelName}
						</td>
						<td>
							${channel.realName}
						</td>
						<td>
							${channel.userPhone}
						</td>	
						<td>
							<fmt:formatDate value="${channel.createTime}" pattern="yyyy-MM-dd HH:mm"/>
						</td>
						<%--<td>
							${channel.realname}
						</td>
						<td>
							${channel.userPhone}
						</td>--%>

						<%--<td>
							${channel.operatorName}
						</td>--%>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:set var="page" value="${pm }"></c:set>
		<%@ include file="../page.jsp"%>
	</div>
</form>