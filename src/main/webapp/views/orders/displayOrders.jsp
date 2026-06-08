<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="jakarta.tags.core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>Display Orders</title>

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
					font-family: Arial, sans-serif;
				}

				body {

					min-height: 100vh;

					padding: 40px;

					background:
						linear-gradient(135deg,
							#0f0f0f,
							#181818,
							#202020);
				}

				.container {

					width: 95%;

					margin: auto;
				}

				.top {

					display: flex;

					justify-content: space-between;

					align-items: center;

					margin-bottom: 30px;
				}

				h1 {

					color: white;

					font-size: 36px;
				}

				.back-btn {

					text-decoration: none;

					background: white;

					color: black;

					padding: 12px 18px;

					border-radius: 10px;

					font-weight: bold;
				}

				.back-btn:hover {

					background: #dcdcdc;
				}

				table {

					width: 100%;

					border-collapse: collapse;

					background:
						rgba(255, 255, 255, 0.08);

					backdrop-filter: blur(12px);

					border-radius: 18px;

					overflow: hidden;
				}

				th {

					background: white;

					color: black;

					padding: 16px;
				}

				td {

					padding: 16px;

					text-align: center;

					color: white;

					border-bottom:
						1px solid rgba(255, 255, 255, 0.1);
				}

				.action-btn {

					text-decoration: none;

					background: white;

					color: black;

					padding: 8px 12px;

					border-radius: 8px;

					font-size: 14px;

					font-weight: bold;

					margin: 3px;

					display: inline-block;
				}

				.action-btn:hover {

					background: #dcdcdc;
				}

				.empty {

					color: white;

					text-align: center;

					margin-top: 30px;

					font-size: 22px;
				}

				.msg {

					color: lightgreen;

					text-align: center;

					margin-bottom: 20px;

					font-size: 18px;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<div class="top">

					<h1>

						All Orders

					</h1>

					<c:choose>

						<c:when test="${sessionScope.role eq 'ADMIN'}">

							<a href="/admin/home" class="back-btn">

								Back To Dashboard

							</a>

						</c:when>

						<c:otherwise>

							<a href="/user/home" class="back-btn">

								Back To Home

							</a>

						</c:otherwise>

					</c:choose>

				</div>

				<h3 class="msg">

					${msg}

				</h3>

				<c:if test="${empty list}">

					<h2 class="empty">

						No Orders Found

					</h2>

				</c:if>

				<c:if test="${not empty list}">

					<table>

						<tr>

							<th>Order ID</th>

							<th>User</th>

							<th>Date Time</th>

							<th>Status</th>

							<th>Total Items</th>

							<th>Actions</th>

						</tr>

						<c:forEach items="${list}" var="o">

							<tr>

								<td>${o.id}</td>

								<td>${o.user.name}</td>

								<td>${o.dateTime}</td>

								<td>${o.status}</td>

								<td>${o.items.size()}</td>

								<td>

									

									<a href="/orders/invoice?id=${o.id}" class="action-btn">

										Invoice

									</a>

									<c:if test="${sessionScope.role eq 'ADMIN'}">

										<a href="/orders/updatePage?id=${o.id}" class="action-btn">

											Update

										</a>

										<form action="/orders/delete" method="post" style="display:inline;">

											<input type="hidden" name="id" value="${o.id}">

											<button type="submit" class="action-btn">

												Delete

											</button>

										</form>

									</c:if>

								</td>

							</tr>

						</c:forEach>

					</table>

				</c:if>

			</div>

		</body>

		</html>