<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="jakarta.tags.core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>Order Details</title>

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
					font-family: Arial, sans-serif;
				}

				body {

					background:
						linear-gradient(135deg,
							#0f0f0f,
							#181818,
							#202020);

					color: white;

					min-height: 100vh;

					padding: 40px;
				}

				.container {

					width: 90%;

					margin: auto;
				}

				.top {

					display: flex;

					justify-content: space-between;

					align-items: center;

					margin-bottom: 30px;
				}

				h1 {

					font-size: 35px;
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

				.card {

					background:
						rgba(255, 255, 255, 0.08);

					border:
						1px solid rgba(255, 255, 255, 0.15);

					backdrop-filter: blur(12px);

					padding: 30px;

					border-radius: 18px;

					margin-bottom: 30px;
				}

				.card h2,
				.card h3 {

					margin-bottom: 15px;
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

				tr:hover {

					background:
						rgba(255, 255, 255, 0.05);
				}

				.total {

					margin-top: 25px;

					text-align: right;

					font-size: 24px;

					font-weight: bold;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<div class="top">

					<h1>

						Order Details

					</h1>

					<a href="/orders/myorders" class="back-btn">

						Back To Orders

					</a>

				</div>

				<div class="card">

					<h2>

						Order ID :
						${order.id}

					</h2>

					<h3>

						User :
						${order.user.name}

					</h3>

					<h3>

						Date :
						${order.dateTime}

					</h3>

				</div>

				<table>

					<tr>

						<th>Product</th>

						<th>Price</th>

						<th>Quantity</th>

						<th>Total</th>

					</tr>

					<c:set var="grandTotal" value="0" />

					<c:forEach items="${order.items}" var="item">

						<tr>

							<td>

								${item.product.name}

							</td>

							<td>

								₹ ${item.price}

							</td>

							<td>

								${item.quantity}

							</td>

							<td>

								₹ ${item.price * item.quantity}

							</td>

						</tr>

						<c:set var="grandTotal" value="${grandTotal +
			(item.price * item.quantity)}" />

					</c:forEach>

				</table>

				<div class="total">

					Grand Total :
					₹ ${grandTotal}

				</div>

			</div>

		</body>

		</html>