<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>User Login</title>

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

			input:focus {

				background:
					rgba(255, 255, 255, 0.18);
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

				transition: 0.3s;
			}

			button:hover {

				background: #dcdcdc;

				transform: scale(1.02);
			}

			.github-btn {

				display: block;

				width: 100%;

				text-align: center;

				padding: 14px;

				margin-top: 16px;

				text-decoration: none;

				background: #24292e;

				color: white;

				border-radius: 10px;

				font-size: 16px;

				font-weight: bold;

				transition: 0.3s;
			}

			.github-btn:hover {

				background: black;

				transform: scale(1.02);
			}

			.or {

				text-align: center;

				color: #d5d5d5;

				margin-top: 18px;

				font-size: 14px;
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

				font-size: 15px;

				transition: 0.3s;
			}

			.links a:hover {

				color: #dcdcdc;
			}

			.home-link {

				display: block;

				margin-top: 15px;
			}
		</style>

	</head>

	<body>

		<div class="box">

			<h1>

				User Login

			</h1>

			<p>

				Login to continue

			</p>



			<!-- LOGIN FORM -->

			<form action="${pageContext.request.contextPath}/user/login" method="post">

				<input type="text" name="userName" placeholder="Enter Username" required>

				<input type="password" name="password" placeholder="Enter Password" required>

				<button type="submit">
					Login
				</button>

			</form>



			<!-- OR -->

			<div class="or">

				──────── OR ────────

			</div>



			<!-- GITHUB LOGIN -->

			<a href="/oauth2/authorization/github" class="github-btn">

				Continue With GitHub

			</a>



			<!-- MESSAGE -->

			<h3 class="msg">

				${msg}

			</h3>



			<!-- LINKS -->

			<div class="links">

				<a href="/user">

					New User? Register Here

				</a>

				<a href="/" class="home-link">

					Back To Home

				</a>

			</div>

		</div>

	</body>

	</html>