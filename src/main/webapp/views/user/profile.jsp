<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">

	<title>My Profile</title>

	<style>

		*{
			margin:0;
			padding:0;
			box-sizing:border-box;
			font-family:Arial;
		}

		body{

			min-height:100vh;

			display:flex;

			justify-content:center;

			align-items:center;

			background:
			linear-gradient(
			135deg,
			#0f0f0f,
			#181818,
			#202020);
		}

		.card{

			width:420px;

			background:
			rgba(255,255,255,0.08);

			border:
			1px solid rgba(255,255,255,0.15);

			backdrop-filter:blur(12px);

			padding:28px;

			border-radius:18px;

			color:white;
		}

		h1{

			text-align:center;

			margin-bottom:22px;

			font-size:42px;
		}

		.info{

			margin-bottom:14px;
		}

		label{

			font-size:15px;

			color:#dcdcdc;
		}

		.value{

			margin-top:6px;

			background:
			rgba(255,255,255,0.08);

			padding:11px;

			border-radius:10px;

			font-size:15px;

			word-wrap:break-word;
		}

		.btn{

			margin-top:18px;

			width:100%;

			padding:12px;

			border:none;

			border-radius:10px;

			background:white;

			color:black;

			font-size:16px;

			font-weight:bold;

			cursor:pointer;
		}

		a{

			text-decoration:none;
		}

	</style>

</head>

<body>

	<div class="card">

		<h1>
			My Profile
		</h1>

		<div class="info">

			<label>
				Name
			</label>

			<div class="value">
				${user.name}
			</div>

		</div>

		<div class="info">

			<label>
				Username
			</label>

			<div class="value">
				${user.userName}
			</div>

		</div>

		<div class="info">

			<label>
				Email
			</label>

			<div class="value">
				${user.email}
			</div>

		</div>

		<div class="info">

			<label>
				Age
			</label>

			<div class="value">
				${user.age}
			</div>

		</div>

		<div class="info">

			<label>
				Phone
			</label>

			<div class="value">
				${user.phone}
			</div>

		</div>

		<div class="info">

			<label>
				Address
			</label>

			<div class="value">
				${user.address}
			</div>

		</div>

		<div class="info">

			<label>
				Role
			</label>

			<div class="value">
				${user.role}
			</div>

		</div>

		<a href="/user/home">

			<button class="btn">

				Back To Dashboard

			</button>

		</a>

	</div>

</body>

</html>