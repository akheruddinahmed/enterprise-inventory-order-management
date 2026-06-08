<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>User Registration</title>

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: Arial, sans-serif;
			}

			body {

				min-height: 100vh;

				display: flex;

				justify-content: center;

				align-items: center;

				background:
					linear-gradient(135deg,
						#0f0f0f,
						#181818,
						#202020);
			}

			.box {

				width: 420px;

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

				color: #dcdcdc;

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
			}

			input::placeholder {

				color: #d5d5d5;
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
			}

			button:hover {

				background: #dcdcdc;
			}

			.msg {

				color: lightgreen;

				text-align: center;

				margin-top: 15px;
			}

			.links {

				margin-top: 20px;

				text-align: center;
			}

			.links a {

				color: white;

				text-decoration: none;
			}
		</style>

	</head>

	<body>

		<div class="box">

			<h1>

				User Register

			</h1>

			<p>

				Create your account

			</p>

			<form action="${pageContext.request.contextPath}/user/register" method="post">

				<input type="text" name="name" placeholder="Enter Name" required>

				<input type="number" name="age" placeholder="Enter Age" required>

				<input type="email" name="email" placeholder="Enter Email" required>

				<input type="text" name="phone" placeholder="Enter Phone Number" required>

				<input type="text" name="address" placeholder="Enter Address" required>

				<input type="text" name="userName" placeholder="Enter Username" required>

				<input type="password" name="password" placeholder="Enter Password" required>

				<button type="submit">
					Register
				</button>

			</form>

			<h3 class="msg">

				${msg}

			</h3>

			<div class="links">

				<a href="/user/loginPage">

					Already have account? Login

				</a>

			</div>

		</div>

	</body>

	</html>