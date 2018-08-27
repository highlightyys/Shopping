<%@page import="javax.swing.text.html.HTML"%>
<%@page import="oracle.net.aso.s"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>购物车页面</title>

<link
	href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/cartstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/optstyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/jquery-1.7.2.min.js"></script>

</head>

<body>
	<c:if test="${!empty message }">
			<script type="text/javascript">
				alert('${message}');
			</script>
	</c:if>
	
	
	
	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
				<div class="menu-hd">欢迎，<img style="height: 25px;width: 25px;" src="${pageContext.request.contextPath}/static/touxiang/${user.userpicurl}">   ${user.username }</div>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}/home/show" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath}/user/showinformation" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="${pageContext.request.contextPath}/cart/" target="_top"><i
						class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}/collection/" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/static/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img
				src="${pageContext.request.contextPath}/static/images/logobig.png" /></li>
		</div>

		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="${pageContext.request.contextPath}/product/search" method="get">
				<input id="searchInput" name="index_none_header_sysc" type="text"
					placeholder="搜索" autocomplete="off"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>
	</div>

	<div class="clear"></div>

	<!--购物车 -->

	<div class="concent">

		<form action="${pageContext.request.contextPath}/cart/createorders" method="post">
		
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<tr class="item-list">
				<div class="bundle  bundle-last ">

					<div class="clear"></div>
					<div class="bundle-main">

						<c:if test="${empty list }">
							<tr>
								<td colspan="5"><center>
										<h1>购物车为空</h1>
									</center></td>
							</tr>
						</c:if>


						<c:if test="${!empty list }">

							<c:forEach items="${list }" var="s" varStatus="vs">
								<ul class="item-content clearfix">

									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="cartids${vs.count }"
												did="${vs.count }" name="cartid" value="${s.cartid }"
												type="checkbox" onchange="totalPrice('${vs.count}')">
												<label for="J_CheckBox_170769542747"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="${pageContext.request.contextPath}/product/detail?proid=${s.proid}"  data-title="${s.proname }"
												class="J_MakePoint" data-point="tbcart.8.12"> <img
												src="${pageContext.request.contextPath}/static/img/${s.picurl}"
												class="itempic J_ItemImg" width="100px"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="${pageContext.request.contextPath}/product/detail?proid=${s.proid}"  title="${s.proname }"
													class="item-title J_MakePoint" data-point="tbcart.8.11">${s.proname}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div class="item-props item-props-can">${s.descript}</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${s.priceAvg }</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" id="singleprice${vs.count }"
														tabindex="0">${s.priceSale}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="min am-btn" name="" type="button"
														onclick="sub('${vs.count}')" value="-" /> <input
														id="count${vs.count }" class="text_box" name="count"
														type="text" value="${s.count }" style="width: 30px;" /> <input
														class="add am-btn" name="" onclick="add('${vs.count}')"
														type="button" value="+" />
												</div>
											</div>
										</div>
									</li>

									<li class="td td-sum">
										<div class="td-inner">
											
											
											<em tabindex="0" id="sum${vs.count }"
												class="J_ItemSum number"  maxFractionDigits="0" value="">
												<fmt:formatNumber type="number" value="${s.count*s.priceSale}" 
											 maxFractionDigits="2"/></em> 
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> <a
												href="${pageContext.request.contextPath}/cart/deleteone?cartid=${s.cartid }"
												class="delete"> 删除</a>
										</div>
									</li>
								</ul>
							</c:forEach>
						</c:if>


					</div>
				</div>
			</tr>
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all check" id="J_SelectAllCbx2"
						name="select-all" value="true" type="checkbox"> <label
						for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#"
					hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
						class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="price">¥<em
						id="J_Total">0.00</em></strong>
				</div>
				<div class="btn-area" >
					<input type="submit" id="J_Go" value="结算" class="submit-btn submit-btn-disabled" 
					style="width:82px;height:50px;color:#3C3C3C;background-color:#F40 "
					aria-label="请注意如果没有选择宝贝，将无法结算" />

				</div>
			</div>

		</div>
		</form>


		<div class="footer">
			<div class="footer-hd">
				<p>
					<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
						href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
				</p>
			</div>
			<div class="footer-bd">
				<p>
					<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
						href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a
						  target="_blank" title="模板之家">模板之家</a>
						- Collect from <a   title="网页模板"
						target="_blank">网页模板</a></em>
				</p>
			</div>
		</div>

	</div>

	<!--引导 -->
	<div class="navCir">
		<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li class="active"><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a
			href="${pageContext.request.contextPath}/static/person/index.html"><i
				class="am-icon-user"></i>我的</a></li>
	</div>
</body>

<script>
	function sub(count) {
		var goodsnum = parseInt($('#count' + count).val()) - 1;
		var cartid = $('#cartids' + count).val();
		
		location.href='${pageContext.request.contextPath }/cart/updatecount?count=' + goodsnum +'&cartid='+cartid;
		
		//通过jquery的post方法发送ajax请求
		//该方法中有四个参数，1：请求的url地址 2：要传递的参数 3：回调函数 4：从controller中返回数据的格式

		//通过jquery的post方法发送ajax请求

		var singleprice = parseFloat($('#singleprice' + count).html());
		var add = singleprice * goodsnum;
		document.getElementById('sum' + count).innerHTML = add.toFixed(2);

		document.getElementById('count' + count).innerHTML = goodsnum;

	}

	function add(count) {
		var goodsnum = parseInt($('#count' + count).val()) + 1;
		var cartid = $('#cartids' + count).val();
		
		location.href='${pageContext.request.contextPath }/cart/updatecount?count=' + goodsnum +'&cartid='+cartid;
		
		var singleprice = parseFloat($('#singleprice' + count).html());
		var add = singleprice * goodsnum;
		document.getElementById('sum' + count).innerHTML = add.toFixed(2);

		document.getElementById('count' + count).innerHTML = goodsnum;


	}

	function totalPrice() {

		var cartids = $('input[name=cartid]');
		var sum = 0;
		var num = 0;

		for (var i = 0; i < cartids.size(); i++) {
			var cartid = cartids.eq(i);

			var count = cartid.attr('did');
			var singleprice = parseFloat($('#singleprice' + count).html());
			var goodsnum = parseFloat($('#count' + count).val());

			if (cartid.is(':checked')) {
				num += 1; // 已选商品？件

				sum += singleprice * goodsnum;

			}

		}

		document.getElementById('J_Total').innerHTML = sum.toFixed(2);
		document.getElementById('J_SelectedItemsCount').innerHTML = num;

	}
</script>


<script>
	document.getElementById('J_SelectAllCbx2').onclick = function() {

		var checkElements = document.getElementsByName('cartid');
		var num = 0;

		if (this.checked) {
			for (var i = 0; i < checkElements.length; i++) {
				var checkElement = checkElements[i];
				checkElement.checked = "checked";
			}
			num = checkElements.length;

			totalPrice();
			/* alert(num); */
		} else {
			for (var i = 0; i < checkElements.length; i++) {
				var checkElement = checkElements[i];
				checkElement.checked = null;
			}
			/* 	alert(num); */

			document.getElementById('J_SelectedItemsCount').innerHTML = 0;
			document.getElementById('J_Total').innerHTML = 0.00;
		}

	}
</script>
</html>