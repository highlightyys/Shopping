<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的收藏</title>

		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/static/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/css/colstyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
								
									<c:if test="${!empty user}">
										欢迎，<img style="height: 25px;width: 25px;" src="${pageContext.request.contextPath}/static/touxiang/${user.userpicurl}">   ${user.username }
										
									</c:if>
									<c:if test="${empty user }">
										<a href="${pageContext.request.contextPath}/home/showLogin" target="_top" class="h">亲，请登录</a>
										<a href="${pageContext.request.contextPath}/home/showRegister" target="_top">免费注册</a>
									</c:if>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="${pageContext.request.contextPath}/home/show" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/user/showinformation" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/cart/" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="${pageContext.request.contextPath}/static/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form action="${pageContext.request.contextPath}/product/search" method="get">
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-collection">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small></div>
						</div>
						<hr/>

						<div class="you-like">
							<div class="s-bar">
								我的收藏
								<a class="am-badge am-badge-danger am-round">降价</a>
								<a class="am-badge am-badge-danger am-round">下架</a>
							</div>
							<div class="s-content">
								
									
									
									<c:forEach items="${list }" var="product">
										<div class="s-item-wrap">
											<div class="s-item">
												<div class="s-pic">
													<a href="#" class="s-pic-link">
														<img style="height: 200px;width: 190px" src="${pageContext.request.contextPath}/static/img/${product.picurl}" alt="包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰" title="包邮s925纯银项链女吊坠短款锁骨链颈链日韩猫咪银饰简约夏配饰" class="s-pic-img s-guess-item-img">
													</a>
												</div>
												<div class="s-info">
													<div class="s-title"><a href="#" title="">${product.proname }</a></div>
													<div class="s-price-box">
														<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${product.priceSale }</em></span>
														<span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value">${product.priceAvg }</em></span>
													</div>
													<div class="s-extra-box">
														<span class="s-comment">好评: 98.03%</span>
														<span class="s-sales">月销: 219</span>
													</div>
												</div>
												<div class="s-tp">
													<span class="ui-btn-loading-before"><a style="color:white" href="${pageContext.request.contextPath}/collection/subcollection?proid=${product.proid}">取消收藏</a></span>
													<i class="am-icon-shopping-cart"></i>
													<span class="ui-btn-loading-before buy"><a style="color:white" href="${pageContext.request.contextPath}/product/detail?proid=${product.proid}">查看详情</a></span>
												</div>
											</div>
										</div>
									</c:forEach>		
									
							</div>

							<div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i>更多</div>

						</div>

					</div>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a   target="_blank" title="模板之家">模板之家</a> - Collect from <a   title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/user/showinformation">个人信息</a></li>
							<li> <a href="">安全设置</a></li>
							<li> <a href="${pageContext.request.contextPath}/address/">地址管理</a></li>
							<li> <a >快捷支付</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-balance-scale"></i>我的交易</p>
						<ul>
							<li><a href="${pageContext.request.contextPath}/order/">订单管理</a></li>
							<li> <a >退款售后</a></li>
							<li> <a >评价商品</a></li>
						</ul>
					</li>
					<li class="person">
						<p><i class="am-icon-dollar"></i>我的资产</p>
						<ul>
							<li> <a >我的积分</a></li>
							<li> <a >优惠券 </a></li>
							<li> <a >红包</a></li>
							<li> <a >账户余额</a></li>
							<li> <a >账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<p><i class="am-icon-tags"></i>我的收藏</p>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/collection/">收藏</a></li>
							<li> <a >足迹</a></li>
						</ul>
					</li>

					<li class="person">
						
					</li>
				</ul>

			</aside>
		</div>

	</body>

</html>