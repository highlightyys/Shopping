<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/addProduct.css"/>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/product/update" method="post" enctype="multipart/form-data">
			<div id="left">
				<img id="preview" src="${pageContext.request.contextPath}/static/img/${product.picurl}" style="height:500px;width:450px"/>
			</div>
			
			<div id="right">
				<input type="hidden" name="proid" id="proid" value="${product.proid }" />
				<div class="form-div">
				<div class="tip">
					商品名称：
					<input type="text" name="proname" id="proname" value="${product.proname }" />
				</div>
				
			</div>
			
			<div class="form-div">
				<div class="tip">
					商城售价：
					<input type="text" name="priceSale" id="" value="${product.priceSale }" />
				</div>
				
			</div>
			
			<div class="form-div">
				<div class="tip">
					市场价：
					<input type="text" name="priceAvg" id="price_avg" value="${product.priceAvg }" />
				</div>
				
			</div>
			
			<div class="form-div">
				<div class="tip">
					商品描述：
				</div>
				<textarea name="descript" rows="10" cols="75">${product.descript }</textarea>
			</div>
			<div class="form-div">
				<div class="tip">
					商品图片：
					<input  type="file" name="fileurl" id="doc" value="${product.picurl }" onchange="showPic()"/>
				</div>
				
			</div>
			
			<div class="form-div">
				<div class="tip">
					商品类别：
					<select name="typeid">
						<c:forEach items="${types }" var="type">
							<option value="${type.typeid }">
								${type.typename }
							</option>
						</c:forEach>
					</select>
				</div>
				
			</div>
			
			<div class="form-div">
				<div class="tip">
					商品库存：
					<input type="text" name="stock" id="stock" value="${product.stock }" />
				</div>
				
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="确认更改"/>
			</div>
		</form>
	</body>
</html>
<script type="text/javascript">
	function showPic(){
		var docObj = document.getElementById("doc");
		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '450px';
			imgObjPreview.style.height = '500px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("left");
			//必须设置初始大小
			localImagId.style.width = "450px";
			localImagId.style.height = "500px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true
	}
</script>
