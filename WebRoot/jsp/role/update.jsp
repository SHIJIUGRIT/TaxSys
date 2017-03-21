<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/common.jspf" %>
<html>
<head>
    <title>角色管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath }role/update.action?editedRole?=${editedRole }"+ method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>角色管理</strong>&nbsp;-&nbsp;编辑角色</div></div>
    <div class="tableH2">编辑角色</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	<input type="hidden" name="rId" value="${editedRole.rId }"/>
        <tr>
            <td class="tdBg" width="200px">角色名称：</td>
            <td><input type="text" name="rName" value="${editedRole.rName }"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px" >角色权限：</td>
            <td>
            	<c:forEach items="${privileges }" var="privilege" varStatus="vs">
            		<input type="checkbox" name="privileges[${vs.count }].pCode" value="${privilege.pCode }" />${privilege.pName }
            	</c:forEach>
            	
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">状态：</td>
            <td><input type="radio" name="rState" value="true" ${editedRole.rState?'checked':'' }/>有效
            <input type="radio" name="rState" value="false" ${editedRole.rState?'':'checked' }/>无效</td>
        </tr>
    </table>
    <s:hidden name="role.roleId"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
    	<c:forEach items="${editedRole.privileges }" var="privilege" varStatus="vs">
       		<script type="text/javascript">
       			$(":checkbox[value='${privilege.pCode}']").attr("checked","checked");
       		</script>
        </c:forEach>
</form>
</body>
</html>