<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>结算页面</title>

		<link href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/static/css/cartstyle.css" rel="stylesheet" type="text/css" />

		<link href="${pageContext.request.contextPath}/static/css/jsstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/address.js"></script>
		
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
				<div class="logo"><img src="${pageContext.request.contextPath}/static/images/logo.png" /></div>
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
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="clear"></div>
					<ul>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5"><center>
									<h1>请添加地址</h1>
								</center></td>
						</tr>
					</c:if>
					
					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="s">
							<div class="per-border"></div>
							
							<li id="${s.addressid }" class="user-addresslist"  value="${s.addressid }" onclick="test('${s.addressid }','${s.consignee }','${s.conphone }','${s.detailaddr }')">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail"> <span id="${s.consignee }"
											class="buy-user">${s.consignee } </span> <span id="${s.conphone }" class="buy-phone">${s.conphone }</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span id="${s.detailaddr }" class="buy--address-detail"> ${s.detailaddr } </span> </span>
									</div>
									
								</div>
								<div class="address-right">
									<a
										href="${pageContext.request.contextPath}/address/">
										<span class="am-icon-angle-right am-icon-lg"></span>
									</a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									 <span class="new-addr-bar hidden">|</span> 
			
									<a href="${pageContext.request.contextPath}/address/showupdate?orderid=${orderid}&addressid=${s.addressid}&consignee=${s.consignee}&conphone=${s.conphone}&detailaddr=${s.detailaddr}">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="${pageContext.request.contextPath}/pay/delete?addressid=${s.addressid }&orderid=${orderid}">删除</a>
								</div>

							</li>
						</c:forEach>
						</c:if>
						<div class="per-border"></div>
							<li class="user-addresslist">
								<div class="address-left">
									<div class="user DefaultAddr">
										<span class="buy-address-detail"> 
										<span class="buy-user">
											<a href="${pageContext.request.contextPath}/address/">➕新增地址</a>
										</span>
										</span>
									</div>
								</div>
							</li>
</ul>

				<div class="clear"></div>
					</div>
					<!--物流 -->
					<div class="logistics">
						<h3>选择物流方式</h3>
						<ul class="op_express_delivery_hot">
							<li data-value="yuantong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -468px"></i>圆通<span></span></li>
							<li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -1008px"></i>申通<span></span></li>
							<li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position:0px -576px"></i>韵达<span></span></li>
							<li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position:0px -324px"></i>中通<span></span></li>
							<li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--支付方式-->
					<div class="logistics">
						<h3>选择支付方式</h3>
						<ul class="pay-list">
							<li class="pay card"><img src="${pageContext.request.contextPath}/static/images/wangyin.jpg" />银联<span></span></li>
							<li class="pay qq"><img src="${pageContext.request.contextPath}/static/images/weizhifu.jpg" />微信<span></span></li>
							<li class="pay taobao"><img src="${pageContext.request.contextPath}/static/images/zhifubao.jpg" />支付宝<span></span></li>
						</ul>
					</div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						
							
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">

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


								</div>
							</div>
							<div class="clear"></div>
							
							<c:if test="${empty details }">
							<tr>
								<td colspan="5"><center>
										<h1>订单为空</h1>
									</center></td>
							</tr>
							</c:if>

							<c:if test="${!empty details }">
							<c:forEach items="${details }" var="d">
							
							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<!-- 订单商品显示 -->
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint"> <img
															src="${pageContext.request.contextPath}/static/img/${d.picurl}"
															class="itempic J_ItemImg"  width="100px"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint"
																data-point="tbcart.8.11">${d.proname} </a>
														</div>
													</div>
												</li>
												
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now">${d.priceSale }</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															<em class="num">${d.count }</em>
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${d.total }</em>
												</div>
											</li>


										</ul>
										<div class="clear"></div>

									</div>
							</tr>
							<div class="clear"></div>
							</c:forEach>
						</c:if>
						
						</div>
						<div class="pay-total">
							<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label> <input type="text"
											title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
											placeholder="选填,建议填写和卖家达成一致的说明"
											class="memo-input J_MakePoint c2c-text-default memo-close">
											<div class="msg hidden J-msg">
												<p class="error">最多输入500个字符</p>
											</div>
									</div>
								</div>

							</div>

							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计 <span>¥</span><em class="pay-sum">${totalprice }</em>
								</p>
							</div>
							<input type="hidden" id="orderid" value="${orderid }"/>
							<div style="display: none">
							<em id = "address1"></em>
							</div>

							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div id="addressshow" class="box"
										style="width: 400px; text-align: left; display: none">
										<div tabindex="0" id="holyshit267" class="realPay">
											<em class="t">实付款：</em> <span class="price g_price ">
												<span>¥</span> <em class="style-large-bold-red "
												id="J_ActualFee">${totalprice }</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">
											
											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span id="detailaddr" class="buy--address-detail">
													${s.detailaddr } </span> </span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span> <span
													class="buy-address-detail"> <span id="shouhuoren"
													class="buy-user">艾迪 </span> <span id="phone"
													class="buy-phone">15871145629</span>
												</span>
											</p>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<a id="J_Go"
												href="javascript:void(0)"
												class="btn-go" tabindex="0" title="点击此按钮，提交订单"
												onclick="submit()">提交订单</a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>

						<div class="clear"></div>
			</div>
				</div>
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
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="email">
							</div>
						</div>


						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
								<small>100字以内写出你的详细地址...</small>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<input type="button" value="保存" ></input>
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input type="button" value="取消" ></input>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
			
			

	</body>
<script>
function test(addressid,consignee,conphone,detailaddr){
	$('#addressshow').show();
	
	var addressid = $('#'+addressid).val();
	var consignee = $('#'+consignee).html();
	var conphone = $('#'+conphone).html();
	var detailaddr = $('#'+detailaddr).html();
	document.getElementById('address1').innerHTML = addressid;
	document.getElementById('shouhuoren').innerHTML = consignee;
	document.getElementById('phone').innerHTML = conphone;
	document.getElementById('detailaddr').innerHTML = detailaddr;
}

function submit(){
	//获取addressid和总价，订单编号
	
	var orderid = $('#orderid').val();	
	var totalprice = $('#J_ActualFee').html();
	var orderaddressid = $('#address1').html();
	
	location.href='${pageContext.request.contextPath }/success/list?orderid=' + orderid +'&orderaddressid='+orderaddressid+'&totalprice='+totalprice;
	

}

</script>
</html>