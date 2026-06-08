<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Vendor Management</title>

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

			.container {

				width: 450px;

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 40px;

				border-radius: 18px;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);

				text-align: center;
			}

			h1 {

				color: white;

				font-size: 40px;

				margin-bottom: 12px;
			}

			p {

				color: #d5d5d5;

				margin-bottom: 35px;

				font-size: 18px;
			}

			.btn {

				display: block;

				width: 100%;

				padding: 16px;

				margin-top: 20px;

				text-decoration: none;

				background: white;

				color: black;

				border-radius: 12px;

				font-size: 18px;

				font-weight: bold;

				transition: 0.3s;
			}

			.btn:hover {

				background: #dcdcdc;

				transform: scale(1.02);
			}
		</style>

	</head>

	<body>

		<div class="container">

			<h1>

				Vendor Management

			</h1>

			<p>

				Choose your portal

			</p>



			<!-- ADMIN -->

			<a href="/user/adminLogin" class="btn">

				ADMIN

			</a>



			<!-- USER -->

			<a href="/user/loginPage" class="btn">

				USER

			</a>

		</div>

	</body>

	</html>