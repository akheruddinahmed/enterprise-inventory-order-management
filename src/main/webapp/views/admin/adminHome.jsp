<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Admin Dashboard</title>

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

				padding: 40px;
			}

			.container {

				width: 95%;

				margin: auto;
			}

			.top {

				display: flex;

				justify-content: space-between;

				align-items: center;

				margin-bottom: 35px;
			}

			h1 {

				color: white;

				font-size: 38px;
			}

			.logout {

				text-decoration: none;

				background: white;

				color: black;

				padding: 12px 20px;

				border-radius: 10px;

				font-weight: bold;

				transition: 0.3s;
			}

			.logout:hover {

				background: #dcdcdc;

				transform: scale(1.02);
			}

			.card-container {

				display: grid;

				grid-template-columns:
					repeat(auto-fit, minmax(260px, 1fr));

				gap: 25px;
			}

			.card {

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 35px;

				border-radius: 18px;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);

				text-align: center;

				transition: 0.3s;
			}

			.card:hover {

				transform: translateY(-6px);
			}

			.card h2 {

				color: white;

				margin-bottom: 15px;

				font-size: 26px;
			}

			.card p {

				color: #dcdcdc;

				margin-bottom: 25px;

				line-height: 1.5;
			}

			.card a {

				text-decoration: none;

				padding: 12px 18px;

				background: white;

				color: black;

				border-radius: 10px;

				font-weight: bold;

				display: inline-block;

				transition: 0.3s;
			}

			.card a:hover {

				background: #dcdcdc;

				transform: scale(1.02);
			}

			.msg {

				color: lightgreen;

				margin-top: 12px;

				font-size: 18px;
			}

			.count-container {

				display: flex;

				justify-content: center;

				gap: 30px;

				margin-top: 50px;

				flex-wrap: wrap;
			}

			.count-card {

				width: 280px;

				height: 180px;

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				border-radius: 20px;

				display: flex;

				flex-direction: column;

				justify-content: center;

				align-items: center;

				color: white;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);
			}

			.count-card h2 {

				font-size: 55px;

				margin-bottom: 10px;
			}

			.count-card p {

				font-size: 22px;

				color: #dcdcdc;
			}
		</style>

	</head>

	<body>

		<div class="container">

			<div class="top">

				<div>

					<h1>

						Admin Dashboard

					</h1>

					<h3 class="msg">

						${msg}

					</h3>

				</div>

				<a href="/user/logout" class="logout">

					Logout

				</a>

			</div>

			<div class="card-container">

				<!-- PRODUCT MANAGEMENT -->

				<div class="card">

					<h2>

						Product Management

					</h2>

					<p>

						Add, update, delete and
						manage all products.

					</p>

					<a href="/product">

						Manage Products

					</a>

				</div>

				<!-- ORDER MANAGEMENT -->

				<div class="card">

					<h2>

						Order Management

					</h2>

					<p>

						View customer orders,
						invoices and order details.

					</p>

					<a href="/orders/getall">

						Manage Orders

					</a>

				</div>

				<!-- USER MANAGEMENT -->

				<div class="card">

					<h2>

						User Management

					</h2>

					<p>

						View and manage all
						registered users.

					</p>

					<a href="/user/getall">

						View Users

					</a>

				</div>

				<!-- REPORTS -->

				<div class="card">

					<h2>

						Reports

					</h2>

					<p>

						Check sales reports,
						order history and inventory.

					</p>

					<a href="/admin/reports">

						View Reports

					</a>

				</div>

			</div>

			<!-- COUNT SECTION -->

			<div class="count-container">

				<div class="count-card">

					<h2 id="productCount">

						0

					</h2>

					<p>

						Total Products

					</p>

				</div>

				<div class="count-card">

					<h2 id="userCount">

						0

					</h2>

					<p>

						Total Users

					</p>

				</div>

				<div class="count-card">

					<h2 id="orderCount">

						0

					</h2>

					<p>

						Total Orders

					</p>

				</div>

			</div>

		</div>

		<script>

			function counter(id, start, end, speed) {

				let obj =
					document.getElementById(id);

				let current = start;

				let timer = setInterval(() => {

					current++;

					obj.innerText = current;

					if (current >= end) {

						clearInterval(timer);
					}

				}, speed);
			}

			counter(
				"productCount",
				0,
				${productCount},
				140);

			counter(
				"userCount",
				0,
				${userCount},
				140);

			counter(
				"orderCount",
				0,
				${orderCount},
				140);

		</script>

	</body>

	</html>