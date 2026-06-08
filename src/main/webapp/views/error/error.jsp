<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Error Page</title>

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

				width: 450px;

				background: rgba(255, 255, 255, 0.08);

				border: 1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 40px;

				border-radius: 18px;

				box-shadow:
					0 8px 32px rgba(0, 0, 0, 0.5);

				text-align: center;
			}

			.error-icon {

				font-size: 70px;

				margin-bottom: 15px;
			}

			h1 {

				color: white;

				margin-bottom: 15px;

				font-size: 32px;
			}

			p {

				color: #dcdcdc;

				font-size: 18px;

				margin-bottom: 30px;

				word-break: break-word;
			}

			a {

				text-decoration: none;

				padding: 12px 20px;

				background: white;

				color: black;

				border-radius: 10px;

				font-weight: bold;

				display: inline-block;

				transition: 0.3s;
			}

			a:hover {

				background: #dcdcdc;

				transform: scale(1.03);
			}
		</style>

	</head>

	<body>

		<div class="box">

			<div class="error-icon">

				⚠️

			</div>

			<h1>

				Something Went Wrong

			</h1>

			<p>

				${msg}

			</p>

			<a href="/product">

				Go Back

			</a>

		</div>

	</body>

	</html>