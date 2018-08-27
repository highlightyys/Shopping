<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/manageShopping.css"/>
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		
		
		
	</head>
	<body>
		<div id="top_nav">
			<div id="manager">
				<ul>
					<li>
						管理员页面
					</li>
					<li>
					<a href="${pageContext.request.contextPath}/manager/escLogin">退出登陆</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div id="main">
			<div id="function">
				<a href="${pageContext.request.contextPath}/type/list" target="content"><div id="manageType">
					管理分类
				</div></a>
				<a href="${pageContext.request.contextPath}/product/products" target="content"><div id="manageProduct">
					管理商品
				</div></a>
				
			</div>
			<div id="show">
				<iframe id="iframe" name="content" src="" width="100%" height="800px" ></iframe>
			</div>
			
			
		</div>
		
	</body>
</html>
