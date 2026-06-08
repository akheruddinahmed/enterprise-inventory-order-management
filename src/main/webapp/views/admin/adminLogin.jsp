<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Admin Login</title>

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

				font-size: 34px;
			}

			p {

				text-align: center;

				color: #dcdcdc;

				margin-bottom: 22px;

				font-size: 16px;
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

				font-size: 15px;
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

				font-size: 17px;

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

				margin-top: 24px;

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
				Admin Login
			</h1>

			<p>
				Admin access only
			</p>

			<form action="${pageContext.request.contextPath}/user/login" method="post">

				<input type="text" name="userName" placeholder="Enter Admin Username" required>

				<input type="password" name="password" placeholder="Enter Password" required>

				<button type="submit">
					Login
				</button>

			</form>

			<h3 class="msg">
				${msg}
			</h3>

			<div class="links">

				<a href="${pageContext.request.contextPath}/">
					Back To Home
				</a>

			</div>

		</div>

	</body>

	</html>