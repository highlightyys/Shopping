<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/static/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/script.js"></script>
	</head>
	<body>
		<c:if test="${!empty message }">
			<script type="text/javascript">
				alert('${message}');
			</script>
		</c:if>
	
		<a href="${pageContext.request.contextPath}/product/showadd">添加商品</a>
		<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" style="width:1200px">
			<c:forEach items="${products}" var="product">
				<li style="width:300px">
					<a href="${pageContext.request.contextPath}/product/showUpdate?proid=${product.proid}&proname=${product.proname}&priceSale=${product.priceSale}&priceAvg=${product.priceAvg}&descript=${product.descript}&picurl=${product.picurl}&typeid=${product.typeid}&stock=${product.stock}">
						<div class="i-pic limit">
							<img src="${pageContext.request.contextPath}/static/img/${product.picurl}" style="height:300px"/>											
							<p class="title fl">${product.proname }</p>
							<p class="price fl">
								<b>¥</b>
								<strong>${product.priceSale}</strong>
							</p>
							<p class="number fl">
								市场价<strong>${product.priceAvg}</strong>
							</p>
							<div>
								<a href="${pageContext.request.contextPath}/product/showUpdate?proid=${product.proid}&proname=${product.proname}&priceSale=${product.priceSale}&priceAvg=${product.priceAvg}&descript=${product.descript}&picurl=${product.picurl}&typeid=${product.typeid}&stock=${product.stock}">编辑</a>
								<a href="${pageContext.request.contextPath}/product/detele?proid=${product.proid}">删除</a>
							</div>
						</div>
					</a>	
				</li>
			</c:forEach>
		</ul>
		
		<ul class="am-pagination am-pagination-right" style="width:700px">
			<li><a href="${pageContext.request.contextPath}/product/products?nowPage=${nowPage-1}">&laquo;</a></li>
			<li class="am-active">${nowPage }</li>
			<li><a href="${pageContext.request.contextPath}/product/products?nowPage=${nowPage+1}">&raquo;</a></li>
		</ul>
	</body>
</html>
