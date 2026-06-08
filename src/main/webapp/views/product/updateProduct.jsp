<%@ page language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="managementSystem.entity.Product"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Product</title>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:Arial,sans-serif;
}

body{

	height:100vh;

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

.box{

	width:400px;

	background:rgba(255,255,255,0.08);

	border:1px solid rgba(255,255,255,0.15);

	backdrop-filter:blur(12px);

	padding:35px;

	border-radius:18px;

	box-shadow:
	0 8px 32px rgba(0,0,0,0.5);
}

h1{

	text-align:center;

	color:white;

	margin-bottom:10px;
}

p{

	text-align:center;

	color:#cfcfcf;

	margin-bottom:20px;
}

input{

	width:100%;

	padding:13px;

	margin-top:15px;

	border:none;

	outline:none;

	border-radius:10px;

	background:rgba(255,255,255,0.12);

	color:white;

	font-size:15px;
}

input::placeholder{

	color:#d5d5d5;
}

input:focus{

	background:rgba(255,255,255,0.18);
}

button{

	width:100%;

	padding:13px;

	margin-top:22px;

	border:none;

	border-radius:10px;

	background:white;

	color:black;

	font-size:16px;

	font-weight:bold;

	cursor:pointer;
}

button:hover{

	background:#e6e6e6;
}

.msg{

	color:lightgreen;

	text-align:center;

	margin-top:15px;

	font-size:18px;

	font-weight:bold;
}

.links{

	margin-top:20px;

	text-align:center;
}

.links a{

	color:white;

	text-decoration:none;

	font-size:16px;
}

.links a:hover{

	color:#dcdcdc;
}

</style>

</head>

<body>

	<%

	Product p =
	(Product)request.getAttribute("product");

	%>

	<div class="box">

		<h1>Update Product</h1>

		<p>Edit Product Details</p>

		<%

		if(p != null){

		%>

		<form action="/product/update?id=<%=p.getId()%>"
			  method="post">

			<input type="text"
				   name="name"
				   value="<%=p.getName()%>"
				   required>

			<input type="number"
				   name="price"
				   value="<%=p.getPrice()%>"
				   required>

			<input type="number"
				   name="stock"
				   value="<%=p.getStock()%>"
				   required>

			<input type="text"
				   name="category"
				   value="<%=p.getCategory()%>">

			<input type="text"
				   name="description"
				   value="<%=p.getDescription()%>">

			<button type="submit">

				Update Product

			</button>

		</form>

		<%

		}else{

		%>

		<h3 class="msg">

			Product Not Found

		</h3>

		<%

		}

		%>

		<h3 class="msg">

			${msg}

		</h3>

		<div class="links">

			<a href="/product/getall">

				Back To Products

			</a>

		</div>

	</div>

</body>

</html>