<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Order Success</title>

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: Arial, sans-serif;
			}

			body {

				height: 100vh;

				display: flex;

				justify-content: center;

				align-items: center;

				background:
					linear-gradient(135deg,
						#0f0f0f,
						#181818,
						#202020);
			}

			.card {

				width: 450px;

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 45px;

				border-radius: 18px;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);

				text-align: center;
			}

			.success {

				font-size: 70px;

				margin-bottom: 15px;
			}

			h1 {

				color: white;

				margin-bottom: 15px;

				font-size: 34px;
			}

			p {

				color: #dcdcdc;

				font-size: 18px;

				margin-bottom: 30px;
			}

			.btn-container {

				display: flex;

				flex-direction: column;

				gap: 15px;
			}

			.btn {

				text-decoration: none;

				background: white;

				color: black;

				padding: 14px;

				border-radius: 10px;

				font-size: 16px;

				font-weight: bold;

				transition: 0.3s;

				display: block;
			}

			.btn:hover {

				background: #dcdcdc;

				transform: scale(1.02);
			}
		</style>

	</head>

	<body>

		<div class="card">

			<div class="success">

				✅

			</div>

			<h1>

				Order Placed Successfully

			</h1>

			<p>

				Thank You For Ordering

			</p>

			<div class="btn-container">

				<a href="/orders/myorders" class="btn">

					View Orders

				</a>

				<a href="/orders" class="btn">

					Place Another Order

				</a>

				<a href="/user/home" class="btn">

					Back To Dashboard

				</a>

			</div>

		</div>

	</body>

	</html>