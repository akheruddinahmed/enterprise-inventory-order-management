<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Update Order</title>

		<style>
			body {

				background: #111;

				color: white;

				font-family: Arial;

				display: flex;

				justify-content: center;

				align-items: center;

				height: 100vh;
			}

			.container {

				width: 400px;

				background: #1e1e1e;

				padding: 30px;

				border-radius: 15px;
			}

			select {

				width: 100%;

				padding: 14px;

				margin-top: 15px;
			}

			button {

				width: 100%;

				padding: 14px;

				margin-top: 20px;

				cursor: pointer;
			}
		</style>

	</head>

	<body>

		<div class="container">

			<h1>

				Update Order Status

			</h1>

			<form action="/orders/update" method="post">

				<input type="hidden" name="id" value="${order.id}">

				<select name="status">

					<option value="PLACED">

						PLACED

					</option>

					<option value="SHIPPED">

						SHIPPED

					</option>

					<option value="DELIVERED">

						DELIVERED

					</option>

					<option value="CANCELLED">

						CANCELLED

					</option>

				</select>

				<button type="submit">

					Update Status

				</button>

			</form>

		</div>

	</body>

	</html>