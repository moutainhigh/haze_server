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
    <title>Insert user</title>
    <style>
    </style>
</head>
<body>
<div class="pageContent">
    <div class="pageForm required-validate">
        <c:if test="${not empty id}">
            <input type="hidden" name="p-id" id="p-id" value="${id}"/>
            <div class="form-item">
                <span class="label">续期类型：</span>
                <input type="text" name="p-extendName" id="extendName" value="${backExtend.extendName}"/>
            </div>
            <div class="form-item">
                <span class="label">续期次数：</span>
                <input type="text" name="p-extendCount" id="extendCount" value="${backExtend.extendCount}"/>
            </div>
            <div class="form-item">
                <span class="label">续期费用：</span>
                <input type="text" name="p-extendMoney" id="extendMoney" value="${backExtend.extendMoney}"/>
            </div>
            <div class="form-item">
                <span class="label">续期天数：</span>
                <input type="text" name="p-extendDay" id="extendDay" value="${backExtend.extendDay}"/>
            </div>
            <div class="formBar">
                <ul>
                    <li><div class="buttonActive">
                        <div class="buttonContent">
                            <button type="submit" id="p-submit">提交</button>
                        </div>
                    </div></li>
                    <li><div class="button">
                        <div class="buttonContent">
                            <button type="button" class="close">取消</button>
                        </div>
                    </div></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${empty id}">
            <div class="form-item">
                <span class="label">续期类型：</span>
                <input type="text" name="p-extendName" id="extendName"/>
            </div>
            <div class="form-item">
                <span class="label">续期次数：</span>
                <input type="text" name="p-extendCount" id="extendCount"/>
            </div>
            <div class="form-item">
                <span class="label">续期费用：</span>
                <input type="text" name="p-extendMoney" id="extendMoney"/>
            </div>
            <div class="form-item">
                <span class="label">续期天数：</span>
                <input type="text" name="p-extendDay" id="extendDay"/>
            </div>
            <div class="formBar">
                <ul>
                    <li><div class="buttonActive">
                        <div class="buttonContent">
                            <button type="submit" id="p-submit">提交</button>
                        </div>
                    </div></li>
                    <li><div class="button">
                        <div class="buttonContent">
                            <button type="button" class="close">取消</button>
                        </div>
                    </div></li>
                </ul>
            </div>
        </c:if>
    </div>
</div>
</body>
<script type="text/javascript">
    <c:if test="${not empty id}">
    var postUrl = "configParams/updateExtend"
    </c:if>
    <c:if test="${empty id}">
    var postUrl = "configParams/addExtend"
    </c:if>
    $('#p-submit').click(function () {
        $.ajax({
            type : "post",
            dataType: 'json',
            contentType:"application/json;charset=utf-8",
            data:{
                "id":$("[name='p-id']").val(),
                "extendName":$("[name='p-extendName']").val(),
                "extendCount":$("[name='p-extendCount']").val(),
                "extendMoney":$("[name='p-extendMoney']").val(),
                "extendDay":$("[name='p-extendDay']").val()
            },
            url : postUrl,
            success : function(ret) {
                if(ret.code == '200'){
                }else{
                }
            },
            error:function(ret){
            }
        })
    })
</script>
</html>