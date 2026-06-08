<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>

		<meta charset="UTF-8">

		<title>Update User</title>

		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				font-family: Arial;
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

			.card {

				width: 450px;

				background:
					rgba(255, 255, 255, 0.08);

				border:
					1px solid rgba(255, 255, 255, 0.15);

				backdrop-filter: blur(12px);

				padding: 35px;

				border-radius: 20px;

				color: white;
			}

			h1 {

				text-align: center;

				margin-bottom: 25px;
			}

			.input-box {

				margin-bottom: 18px;
			}

			label {

				display: block;

				margin-bottom: 8px;

				font-size: 15px;

				color: #dcdcdc;
			}

			input {

				width: 100%;

				padding: 12px;

				border: none;

				outline: none;

				border-radius: 10px;

				background:
					rgba(255, 255, 255, 0.08);

				color: white;

				font-size: 15px;
			}

			input[readonly] {

				background:
					rgba(255, 255, 255, 0.03);

				color: #a9a9a9;
			}

			.btn {

				width: 100%;

				padding: 13px;

				border: none;

				border-radius: 10px;

				background: white;

				color: black;

				font-size: 16px;

				font-weight: bold;

				cursor: pointer;

				margin-top: 10px;
			}

			.btn:hover {

				background: #dcdcdc;
			}

			.msg {

				color: lightgreen;

				text-align: center;

				margin-top: 15px;
			}

			a {

				text-decoration: none;
			}

			.back {

				margin-top: 15px;

				display: block;

				text-align: center;

				color: white;
			}
		</style>

	</head>

	<body>

		<div class="card">

			<h1>
				Update User
			</h1>

			<form action="/user/update" method="post">

				<input type="hidden" name="id" value="${user.id}">

				<div class="input-box">

					<label>
						Name
					</label>

					<input type="text" name="name" value="${user.name}" required>

				</div>

				<div class="input-box">

					<label>
						Username
					</label>

					<input type="text" value="${user.userName}" readonly>

				</div>

				<div class="input-box">

					<label>
						Email
					</label>

					<input type="email" name="email" value="${user.email}" required>

				</div>

				<div class="input-box">

					<label>
						Age
					</label>

					<input type="number" name="age" value="${user.age}">

				</div>

				<div class="input-box">

					<label>
						Phone
					</label>

					<input type="text" name="phone" value="${user.phone}">

				</div>

				<div class="input-box">

					<label>
						Address
					</label>

					<input type="text" name="address" value="${user.address}">

				</div>

				<div class="input-box">

					<label>
						Role
					</label>

					<input type="text" name="role" value="${user.role}" required>

				</div>

				<button class="btn">

					Update User

				</button>

			</form>

			<h3 class="msg">
				${msg}
			</h3>

			<a href="/user/getall" class="back">

				Back To Users

			</a>

		</div>

	</body>

	</html>