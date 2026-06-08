<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Add Product</title>

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: Arial, sans-serif;
			}

			body {

				min-height: 100vh;

				padding: 30px;

				background:
					linear-gradient(135deg,
						#0f0f0f,
						#181818,
						#202020);
			}

			.top-bar {

				display: flex;

				justify-content: flex-end;

				margin-bottom: 20px;
			}

			.dashboard-btn {

				text-decoration: none;

				background: white;

				color: black;

				padding: 12px 20px;

				border-radius: 10px;

				font-weight: bold;

				transition: 0.3s;
			}

			.dashboard-btn:hover {

				background: #dcdcdc;

				transform: scale(1.03);
			}

			.container {

				display: flex;

				justify-content: center;

				align-items: center;
			}

			.box {

				width: 400px;

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

				text-align: center;

				color: white;

				margin-bottom: 10px;
			}

			p {

				text-align: center;

				color: #cfcfcf;

				margin-bottom: 20px;
			}

			input {

				width: 100%;

				padding: 13px;

				margin-top: 15px;

				border: none;

				outline: none;

				border-radius: 10px;

				background:
					rgba(255, 255, 255, 0.12);

				color: white;

				font-size: 15px;
			}

			input::placeholder {

				color: #d5d5d5;
			}

			input:focus {

				background:
					rgba(255, 255, 255, 0.18);
			}

			button {

				width: 100%;

				padding: 13px;

				margin-top: 22px;

				border: none;

				border-radius: 10px;

				background: white;

				color: black;

				font-size: 16px;

				font-weight: bold;

				cursor: pointer;

				transition: 0.3s;
			}

			button:hover {

				background: #e6e6e6;

				transform: scale(1.02);
			}

			.msg {

				text-align: center;

				margin-top: 15px;

				font-size: 18px;

				font-weight: bold;

				color: lightgreen;
			}

			.links {

				margin-top: 20px;
			}
		</style>

	</head>

	<body>

		<div class="top-bar">

			<a href="/admin/home" class="dashboard-btn">

				Go To Dashboard

			</a>

		</div>

		<div class="container">

			<div class="box">

				<h1>

					Add Product

				</h1>

				<p>

					Manage your products

				</p>

				<!-- SAVE PRODUCT -->

				<form action="/product/save" method="post">

					<input type="text" name="name" placeholder="Enter Product Name" required>

					<input type="number" name="price" placeholder="Enter Product Price" required>

					<input type="number" name="stock" placeholder="Enter Product Stock" required>

					<input type="text" name="category" placeholder="Enter Category">

					<input type="text" name="description" placeholder="Enter Description">

					<button type="submit">

						Save Product

					</button>

				</form>

				<!-- -----MESSAGE----- -->

				<h3 class="msg">

					${msg}

				</h3>

				<!-- SHOW PRODUCTS -->

				<div class="links">

					<form action="/product/getall">

						<button type="submit">

							Show All Products

						</button>

					</form>

				</div>

				<!-- FETCH PRODUCT -->

				<form action="/product/fetch" method="get">

					<input type="number" name="id" placeholder="Enter Product ID" required>

					<button type="submit">

						Fetch Product

					</button>

				</form>

			</div>

		</div>

	</body>

	</html>