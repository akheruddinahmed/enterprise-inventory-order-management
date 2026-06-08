<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Place Order</title>

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: Arial, sans-serif;
			}

			body {

				min-height: 100vh;

				background:
					linear-gradient(135deg,
						#0f0f0f,
						#181818,
						#202020);

				display: flex;

				justify-content: center;

				align-items: center;
			}

			.container {

				width: 450px;

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 35px;

				border-radius: 18px;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);
			}

			h1 {

				color: white;

				text-align: center;

				margin-bottom: 10px;

				font-size: 55px;
			}

			p {

				color: #dcdcdc;

				text-align: center;

				margin-bottom: 25px;

				font-size: 18px;
			}

			label {

				color: white;

				font-size: 18px;
			}

			input {

				width: 100%;

				padding: 14px;

				margin-top: 16px;

				border: none;

				outline: none;

				border-radius: 10px;

				background:
					rgba(255, 255, 255, 0.12);

				color: white;

				font-size: 18px;
			}

			input::placeholder {

				color: #d5d5d5;
			}

			button {

				width: 100%;

				padding: 14px;

				margin-top: 24px;

				border: none;

				border-radius: 10px;

				background: white;

				color: black;

				font-size: 18px;

				font-weight: bold;

				cursor: pointer;
			}

			button:hover {

				background: #dcdcdc;
			}

			.msg {

				color: lightgreen;

				text-align: center;

				margin-top: 18px;

				font-size: 18px;
			}

			.links {

				margin-top: 20px;

				text-align: center;
			}

			.links a {

				color: white;

				text-decoration: none;

				font-size: 17px;
			}

			.info {

				color: #a8a8a8;

				margin-top: 8px;

				font-size: 15px;
			}
		</style>

	</head>

	<body>

		<div class="container">

			<h1>

				Place Order

			</h1>

			<p>

				Enter quantity to place order

			</p>

			<form action="/orders/save" method="post">

				<!--	HIDDEN PRODUCT ID -->

				<input type="hidden" name="items[0].productId" value="${productId}">

				<!--	QUANTITY -->

				<label>

					Quantity

				</label>

				<input type="number" name="items[0].quantity" placeholder="Enter Quantity" required>

				<div class="info">

					Available stock must be sufficient

				</div>

				<!--	BUTTON -->

				<button type="submit">

					Place Order

				</button>

			</form>

			<!--	MESSAGE -->

			<h3 class="msg">

				${msg}

			</h3>

			<!--	BACK -->

			<div class="links">

				<a href="/product/getall">

					Back To Products

				</a>

			</div>

		</div>

	</body>

	</html>