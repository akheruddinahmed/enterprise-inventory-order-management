<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="jakarta.tags.core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>Invoice</title>

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

					min-height: 100vh;

					padding: 40px;

					color: white;
				}

				.container {

					width: 85%;

					margin: auto;

					background:
						rgba(255, 255, 255, 0.08);

					border:
						1px solid rgba(255, 255, 255, 0.15);

					backdrop-filter: blur(12px);

					padding: 40px;

					border-radius: 20px;

					box-shadow:
						0 8px 32px rgba(0, 0, 0, 0.5);
				}

				.top {

					display: flex;

					justify-content: space-between;

					align-items: flex-start;

					margin-bottom: 35px;

					border-bottom:
						1px solid rgba(255, 255, 255, 0.15);

					padding-bottom: 25px;
				}

				h1 {

					font-size: 42px;

					margin-bottom: 15px;
				}

				h3 {

					margin-top: 10px;

					font-weight: normal;

					color: #dcdcdc;
				}

				.company {

					text-align: right;
				}

				.company h2 {

					margin-bottom: 10px;
				}

				table {

					width: 100%;

					border-collapse: collapse;

					margin-top: 20px;

					overflow: hidden;

					border-radius: 15px;
				}

				th {

					background: white;

					color: black;

					padding: 16px;

					font-size: 16px;
				}

				td {

					padding: 16px;

					text-align: center;

					border-bottom:
						1px solid rgba(255, 255, 255, 0.1);

					color: white;
				}

				tr:hover {

					background:
						rgba(255, 255, 255, 0.05);
				}

				.total {

					text-align: right;

					margin-top: 30px;

					font-size: 28px;

					font-weight: bold;
				}

				.buttons {

					margin-top: 35px;

					display: flex;

					gap: 15px;

					justify-content: flex-end;
				}

				.btn {

					text-decoration: none;

					background: white;

					color: black;

					padding: 14px 20px;

					border-radius: 10px;

					font-weight: bold;

					transition: 0.3s;
				}

				.btn:hover {

					background: #dcdcdc;

					transform: scale(1.02);
				}

				.print-btn {

					border: none;

					cursor: pointer;

					font-size: 15px;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<div class="top">

					<div>

						<h1>

							INVOICE

						</h1>

						<h3>

							Order ID :
							${order.id}

						</h3>

						<h3>

							User :
							${order.user.name}

						</h3>

						<h3>

							Date :
							${order.dateTime}

						</h3>

					</div>

					<div class="company">

						<h2>

							Vendor Management System

						</h2>

						<h3>

							Management & Billing

						</h3>

					</div>

				</div>

				<table>

					<tr>

						<th>Product</th>

						<th>Price</th>

						<th>Quantity</th>

						<th>Total</th>

					</tr>

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

					</c:forEach>

				</table>

				<div class="total">

					Grand Total :
					₹ ${total}

				</div>

				<div class="buttons">

					<button onclick="window.print()" class="btn print-btn">

						Print Invoice

					</button>

					<a href="/orders/myorders" class="btn">

						Back To Orders

					</a>

				</div>

			</div>

		</body>

		</html>