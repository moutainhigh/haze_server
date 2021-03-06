<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
%>
<%--<script type="text/javascript" src="${path}/resources/js/productAmount_choose.js"></script>--%>

<form id="pagerForm-e" onsubmit="return navTabSearch(this);"
      action="product/goextendList?myId=${params.myId}" method="post">
    <div class="pageHeader">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        续期类型:
                        <select name="extendName" class="textInput">
                            <option value="">全部</option>
                            <c:forEach var="extendInfo" items="${extendList}">
                                <option value="${extendInfo.extendName}"
                                        <c:if test="${extendInfo.extendName eq params.extendName}">selected="selected"</c:if> >${extendInfo.extendName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        续期天数:
                        <select name="extendDay" class="textInput">
                            <option value="">全部</option>
                            <c:forEach var="extendInfo" items="${extendList}">
                                <option value="${extendInfo.extendDay}"
                                        <c:if test="${extendInfo.extendDay eq params.extendDay}">selected="selected"</c:if> >${extendInfo.extendDay}</option>
                            </c:forEach>
                        </select>
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
                <th>
                    ID
                </th>
                <th>
                    续期类型
                </th>
                <th>
                    续期次数
                </th>
                <th>
                    续期费用
                </th>
                <th>
                    续期天数
                </th>
                <%--<th>
                    续期次数
                </th>--%>
                <th>
                    备注
                </th>
                <th>
                    状态管理
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="backExtend" items="${pm.items }" varStatus="status">
                <tr target="id" rel="${backExtend.id }">
                    <td>
                            ${backExtend.id}
                    </td>
                    <td>
                            ${backExtend.extendName}
                    </td>
                    <td>
                            ${backExtend.extendCount}次
                    </td>
                    <td>
                        <fmt:formatNumber type="number" value="${backExtend.extendMoney / 100}" pattern="0.00"
                                          maxFractionDigits="0"/>元
                    </td>
                    <td>
                            ${backExtend.extendDay}天
                    </td>
                    <%--<td>
                            ${backExtend.extendCount}
                    </td>--%>
                    <td>
                            ${backExtend.remark}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${backExtend.extendStatus == 0}">
                                <div class="slide-btn open-s" onclick="setPStatus('${backExtend.id}', 1)"></div>
                            </c:when>
                            <c:otherwise>
                                <div class="slide-btn close-s" onclick="setPStatus('${backExtend.id}', 0)"></div>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:set var="page" value="${pm }"></c:set>
        <!-- 分页 -->
        <%@ include file="../page.jsp" %>
    </div>
</form>

<script type="text/javascript">
    function setPStatus(id, status) {
        $.ajax({
            type : "post",
            data:{
                "id":id,
                extendStatus: status
            },
            url : "product/updateExtend",
            success : function(ret) {
                setTimeout(function () {
                    $('#pagerForm-e').submit()
                }, 100)
            },
            error:function(ret){
            }
        })
    }
</script>