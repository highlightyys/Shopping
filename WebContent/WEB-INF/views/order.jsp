<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!odCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/static/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/static/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
									欢迎，  <img style="height: 25px;width: 25px;" src="${pageContext.request.contextPath}/static/touxiang/${user.userpicurl}">   ${user.username }
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
								<div class="menu-hd"><a href="${pageContext.request.contextPath}/collection/" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="${pageContext.request.contextPath}/static/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form action="${pageContext.request.contextPath}/product/search" method="post" >
									<input id="searchInput" name="keyWord" type="text" placeholder="搜索" autocomplete="off">
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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">
								<!-- 所有订单 -->
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!-- 待付款 0-->
											<div class="order-status1">
												
											
												<c:if test="${!empty unpay }">

												<c:forEach items="${unpay }" var="u" >
														
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${u.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${u.time }" pattern="yyyy-MM-dd"/></span>
													
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">

													


													<c:if test="${!empty u.orderdetaillist}">

														<c:forEach items="${u.orderdetaillist }" var="uo" >

															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint"> <img
																			src="${pageContext.request.contextPath}/static/img/${uo.picurl}"
																			class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>${uo.proname }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">${uo.priceSale }</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${uo.count }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation"></div>
																</li>
															</ul>
															</c:forEach>
														</c:if>
												</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${u.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">等待买家付款</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/order/cancel?orderid=${u.orderid}">取消订单</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="${pageContext.request.contextPath}/pay/?orderid=${u.orderid}">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>

												</div>
											
											</c:forEach>
											</c:if>
											
											</div>
											<!-- 待发货 1-->
											<div class="order-status2">
											
										
												<c:if test="${!empty unsend }">

												<c:forEach items="${unsend }" var="s" >
											
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${s.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${s.time }" pattern="yyyy-MM-dd"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty s.orderdetaillist}">

														<c:forEach items="${s.orderdetaillist }" var="so" >
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${so.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${so.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${so.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${so.count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${s.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${s.orderid}&addressid=${s.orderaddressid}">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
															<a href="${pageContext.request.contextPath}/order/updatestatus?orderid=${s.orderid}">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div></a>
															</li>
														</div>
													</div>
												</div>
											
											</c:forEach>
											</c:if>
											</div>
											<!-- 待收货 2-->
											<div class="order-status3">
											
										
												<c:if test="${!empty unreceice }">

												<c:forEach items="${unreceice }" var="r" >
											
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${r.time }" pattern="yyyy-MM-dd"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty r.orderdetaillist}">

														<c:forEach items="${r.orderdetaillist }" var="ro" >
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${ro.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${ro.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ro.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ro.count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
											

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.totalprice }
															
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${r.orderid}&addressid=${r.orderaddressid}">订单详情</a></p>
																	<p class="order-info"><a href="#">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
															<a href="${pageContext.request.contextPath}/order/updatestatus?orderid=${r.orderid}">
																<div class="am-btn am-btn-danger anniu">
																	确认收货</div></a>
															</li>
														</div>
													</div>
												</div>
											</c:forEach>
											</c:if>
											</div>
											<!-- 待评价 3-->
												<div class="order-status4">
									
											
												<c:if test="${!empty receiced }">

												<c:forEach items="${receiced }" var="d" >
										
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${d.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${d.time }" pattern="yyyy-MM-dd"/></span>

												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty d.orderdetaillist}">

														<c:forEach items="${d.orderdetaillist }" var="od" >
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${od.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${od.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${od.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
													
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${d.totalprice }
															
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${d.orderid}&addressid=${d.orderaddressid}">订单详情</a></p>
																	<p class="order-info"><a href="#">查看物流</a></p>
																</div>
															<li class="td td-change">
																<a href="#">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</c:forEach>
											</c:if>
											
											</div>
										</div>

									</div>

								</div>
								
								<!-- 待付款 0-->
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
										
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status1">
												<c:if test="${empty unpay }">
													<tr>
														<td colspan="5"><center>
																<h1>未付款订单为空</h1>
															</center></td>
														</tr>
												</c:if>
											
												<c:if test="${!empty unpay }">

												<c:forEach items="${unpay }" var="u" >
														
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${u.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${u.time }" pattern="yyyy-MM-dd"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">

													


													<c:if test="${!empty u.orderdetaillist}">

														<c:forEach items="${u.orderdetaillist }" var="uo" >

															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint"> <img
																			src="${pageContext.request.contextPath}/static/img/${uo.picurl}"
																			class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="#">
																				<p>${uo.proname }</p>
																				
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price">${uo.priceSale }</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span>${uo.count }
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation"></div>
																</li>
															</ul>
															</c:forEach>
														</c:if>
												</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${u.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">等待买家付款</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/order/cancel?orderid=${u.orderid}">取消订单</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="${pageContext.request.contextPath}/pay/?orderid=${u.orderid}">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>

												</div>
											
											</c:forEach>
											</c:if>
											
											</div>
										</div>

									</div>
								</div>
								
								<!-- 待发货 1-->
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status2">
											
											<c:if test="${empty unsend }">
													<tr>
														<td colspan="5"><center>
																<h1>未发货订单为空</h1>
															</center></td>
														</tr>
												</c:if>
											
												<c:if test="${!empty unsend }">

												<c:forEach items="${unsend }" var="s" >
											
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${s.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${s.time }" pattern="yyyy-MM-dd"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty s.orderdetaillist}">

														<c:forEach items="${s.orderdetaillist }" var="so" >
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${so.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${so.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${so.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${so.count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${s.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${s.orderid}&addressid=${s.orderaddressid}">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
															<a href="${pageContext.request.contextPath}/order/updatestatus?orderid=${s.orderid}">
																<div class="am-btn am-btn-danger anniu">
																提醒发货</div> </a>
															</li>
														</div>
													</div>
												</div>
											
											</c:forEach>
											</c:if>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 待收货 2-->
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<div class="order-status3">
											
											<c:if test="${empty unreceice }">
													<tr>
														<td colspan="5"><center>
																<h1>待收货订单为空</h1>
															</center></td>
														</tr>
												</c:if>
											
												<c:if test="${!empty unreceice }">

												<c:forEach items="${unreceice }" var="r" >
											
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${r.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${r.time }" pattern="yyyy-MM-dd"/></span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty r.orderdetaillist}">

														<c:forEach items="${r.orderdetaillist }" var="ro" >
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${ro.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${ro.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${ro.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${ro.count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
											

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${r.totalprice }
															
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${r.orderid}&addressid=${r.orderaddressid}">订单详情</a></p>
																	<p class="order-info"><a href="#">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
															<a href="${pageContext.request.contextPath}/order/updatestatus?orderid=${r.orderid}">
																<div class="am-btn am-btn-danger anniu">
																	确认收货</div></a>
															</li>
														</div>
													</div>
												</div>
											</c:forEach>
											</c:if>
											</div>
										</div>
									</div>
								</div>

								<!-- 待评价 3-->
								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!--不同状态的订单	-->
										<div class="order-status4">
										
										<c:if test="${empty receiced }">
													<tr>
														<td colspan="5"><center>
																<h1>待评价订单为空</h1>
															</center></td>
														</tr>
												</c:if>
											
												<c:if test="${!empty receiced }">

												<c:forEach items="${receiced }" var="d" >
										
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${d.ordernum }</a></div>
													<span>成交时间：<fmt:formatDate value="${d.time }" pattern="yyyy-MM-dd"/></span>

												</div>
												<div class="order-content">
													<div class="order-left">
													
													<c:if test="${!empty d.orderdetaillist}">

														<c:forEach items="${d.orderdetaillist }" var="od" >
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}/static/img/${od.picurl}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${od.proname }</p>
																			
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${od.priceSale }
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${count }
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
														</c:forEach>
													</c:if>
													
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${d.totalprice }
															
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/orderinfo/list?orderid=${d.orderid}&addressid=${d.orderaddressid}">订单详情</a></p>
																	<p class="order-info"><a href="#">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="#">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</c:forEach>
											</c:if>
											
											</div>
											
											

										</div>

									</div>

								</div>
							</div>

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
					<li class="person">
						<a href="${pageContext.request.contextPath}/user/showinformation">个人中心</a>
					</li>
					<li class="person">
						<a href="${pageContext.request.contextPath}/user/showinformation">个人资料</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/user/showinformation">个人信息</a></li>
							<li> <a >安全设置</a></li>
							<li> <a >收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li class="active"><a href="${pageContext.request.contextPath}/order/">订单管理</a></li>
							<li> <a >退款售后</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的资产</a>
						<ul>
							<li> <a >优惠券 </a></li>
							<li> <a >红包</a></li>
							<li> <a >账单明细</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/collection/">收藏</a></li>
							<li> <a >足迹</a></li>
							<li> <a >评价</a></li>
							<li> <a >消息</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>

	</body>
	<script type="text/javascript">
	function getLocalTime(nS) {  
	    var date = new Date(nS);
	    var year = date.getFullYear();
	    var month = date.getMonth()+1;
	    var day = date.getDate();
	    return year+"-"+month+"-"+day;
	}
	</script>
</html>