<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>User Dashboard</title>

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

				margin-bottom: 30px;
			}

			h1 {

				color: white;

				font-size: 35px;
			}

			.logout {

				text-decoration: none;

				background: white;

				color: black;

				padding: 12px 20px;

				border-radius: 10px;

				font-weight: bold;
			}

			.logout:hover {

				background: #dcdcdc;
			}

			.msg {

				text-align: center;

				color: lightgreen;

				font-size: 20px;

				margin-bottom: 25px;
			}

			.card-container {

				display: grid;

				grid-template-columns:
					repeat(auto-fit, minmax(250px, 1fr));

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
			}

			.card h2 {

				color: white;

				margin-bottom: 15px;
			}

			.card p {

				color: #dcdcdc;

				margin-bottom: 20px;
			}

			.card a {

				text-decoration: none;

				padding: 12px 18px;

				background: white;

				color: black;

				border-radius: 10px;

				font-weight: bold;

				display: inline-block;
			}

			.card a:hover {

				background: #dcdcdc;
			}
		</style>

	</head>

	<body>

		<div class="container">

			<div class="top">

				<h1>

					User Dashboard

				</h1>

				<a href="/user/logout" class="logout">

					Logout

				</a>

			</div>

			<!-- LOGIN SUCCESS -->

			<h3 class="msg">

				${sessionScope.msg}

			</h3>

			<% session.removeAttribute("msg"); %>

				<div class="card-container">

					<!-- VIEW PRODUCTS -->

					<div class="card">

						<h2>

							View Products

						</h2>

						<p>

							Browse all available products.

						</p>

						<a href="/product/getall">

							View Products

						</a>

					</div>

					<!-- MY ORDERS -->

					<div class="card">

						<h2>

							My Orders

						</h2>

						<p>

							Check your order history.

						</p>

						<a href="/orders/myorders">

							View Orders

						</a>

					</div>
					<!-- MY Profile -->

					<div class="card">

						<h2>
							My Profile
						</h2>

						<p>
							View your account information.
						</p>

						<a href="/user/profile" class="btn">
							View Profile
						</a>

					</div>

				</div>

		</div>

	</body>

	</html>