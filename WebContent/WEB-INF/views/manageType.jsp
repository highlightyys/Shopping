<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="${pageContext.request.contextPath}/static/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manageShopping.css"/>
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/static/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
	
	</head>
	<body>
		<c:if test="${!empty message}">
			<script type="text/javascript">
				alert('${message}');
			</script>
		</c:if>
		<div id="add-div">
			<input type="button" id="add-button" value="添加" onclick="add()"/>
			<div id="form-div">
				<form id="form1" action="${pageContext.request.contextPath}/type/addType" method="post">
					<input type="hidden" name="typeid" id="typeid">
					分类名称：<input type="text" name="typename" id="typename"/>
					所属一级分类编号：<input type="text" name="selection" id="selection"/>
					<input type="submit" value="提交"/>
				</form>
			</div>
		</div>
		
		
		<table  cellspacing="0" cellpadding="0">
			<tr>
				<th style="text-align: center;">
				分类编号
				</th>
				<th style="text-align: center;">
				分类名称
				</th>
				<th style="text-align: center;">
				二级分类编号
				</th>
				<th style="text-align: center;">
				操作
				</th>
			</tr>
			
			<c:forEach items="${types}" var="type">
				<tr>
					<td>${type.typeid }</td>
					<td>${type.typename }</td>
					<td>${type.selection }</td>
					<td>
					<a href="javascript:void(0)" onclick="edit('${type.typeid}','${type.typename}','${type.selection }')">编辑</a>
					<a href="${pageContext.request.contextPath}/type/detele?typeid=${type.typeid}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="am-pagination am-pagination-right" style="width:700px">
			<li><a href="${pageContext.request.contextPath}/type/list?nowPage=${nowPage - 1}">&laquo;</a></li>
			<li>${nowPage}</li>
			<li><a href="${pageContext.request.contextPath}/type/list?nowPage=${nowPage + 1}">&raquo;</a></li>
		</ul>
	</body>
</html>
<script type="text/javascript">
	$(function(){
		$('#form-div').hide();
	});
	function add(){
		$('#form-div').show();
	}
	function edit(typeid,typename,selection){
		
		$('#typeid').val(typeid);
		$('#typename').val(typename);
		$('#selection').val(selection);
		$('#form-div').show();
		$('#form1').attr('action','${pageContext.request.contextPath}/type/modify');

		
	}

</script>
