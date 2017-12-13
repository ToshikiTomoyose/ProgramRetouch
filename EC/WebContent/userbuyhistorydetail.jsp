<%@page import="ec.Item"%>
<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.BuyDataBeans"%>
<%@ page import="beans.UserDataBeans"%>
<%@ page import=" java.util.ArrayList"%>
<%@ page import= "beans.BuyDataBeans" %>
<%@ page import= "beans.ItemDataBeans" %>

<%
	String validationMessage = (String) request.getAttribute("validationMessage");
	UserDataBeans udb = (UserDataBeans)request.getAttribute("udb");
	BuyDataBeans bdb = (BuyDataBeans)session.getAttribute("bdb");  //bdbで購入日・配送方法・購入金額を表示させる
	ArrayList<ItemDataBeans>  bddb = (ArrayList<ItemDataBeans>)session.getAttribute("bddb"); //購入したデータを呼び出す
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入履歴詳細</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h4 class=" col s12 light">購入詳細</h4>
		</div>
		<!--  購入 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table>
							<thead>
								<tr>
									<th class="center" style="width: 20%;">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center" style="width: 20%">合計金額</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center"><%=bdb.getBuyDate() %></td>
									<td class="center"><%=bdb.getDeliveryMethodName() %></td>
									<td class="center"><%=bdb.getTotalPrice() %></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 詳細 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th class="center">商品名</th>
									<th class="center" style="width: 20%">単価</th>
								</tr>
							</thead>
							<tbody>
								<% for(ItemDataBeans idb : bddb) {%>
								<tr>
									<td class="center"><%= idb.getName() %></td>
									<td class="center"><%= idb.getPrice() %></td>
								<% } %>
								<tr>
								<td class="center"><%= bdb.getDeliveryMethodName() %></td>
								<td class="center"><%= bdb.getDeliveryMethodPrice() %></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>