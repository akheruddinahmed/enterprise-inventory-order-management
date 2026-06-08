<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ page import="java.util.List" %>
		<%@ page import="managementSystem.entity.Product" %>

			<!DOCTYPE html>
			<html>

			<head>

				<meta charset="UTF-8">

				<title>Display Products</title>

				<style>
					* {
						margin: 0;
						padding: 0;
						box-sizing: border-box;
						font-family: Arial, sans-serif;
					}

					body {

						background:
							linear-gradient(135deg,
								#0f0f0f,
								#181818,
								#202020);

						min-height: 100vh;

						padding: 40px;
					}

					.container {

						width: 95%;

						margin: auto;

						background:
							rgba(255, 255, 255, 0.08);

						border:
							1px solid rgba(255, 255, 255, 0.15);

						backdrop-filter: blur(12px);

						padding: 30px;

						border-radius: 18px;

						box-shadow:
							0 8px 32px rgba(0, 0, 0, 0.5);
					}

					h1 {

						text-align: center;

						color: white;

						margin-bottom: 25px;
					}

					table {

						width: 100%;

						border-collapse: collapse;

						margin-top: 20px;
					}

					table th {

						background: white;

						color: black;

						padding: 14px;
					}

					table td {

						padding: 14px;

						text-align: center;

						color: white;

						border-bottom:
							1px solid rgba(255, 255, 255, 0.1);
					}

					.top {

						display: flex;

						justify-content: space-between;

						align-items: center;
					}

					select {

						padding: 10px;

						border: none;

						border-radius: 8px;

						outline: none;
					}

					button {

						padding: 10px 14px;

						border: none;

						border-radius: 8px;

						cursor: pointer;

						font-weight: bold;
					}

					.action-btn {

						background: white;

						color: black;
					}

					.action-btn:hover {

						background: #dcdcdc;
					}

					.msg {

						text-align: center;

						color: lightgreen;

						margin-top: 15px;

						font-size: 18px;
					}

					.add-btn {

						text-decoration: none;

						padding: 10px 15px;

						background: white;

						color: black;

						border-radius: 8px;

						font-weight: bold;
					}

					.add-btn:hover {

						background: #dcdcdc;
					}

					.action-box {

						display: flex;

						justify-content: center;

						gap: 10px;
					}

					.empty {

						text-align: center;

						color: white;

						margin-top: 30px;

						font-size: 22px;
					}
				</style>

			</head>

			<body>

				<% String role=(String)session.getAttribute("role"); List<Product> list =
					(List<Product>)request.getAttribute("list");

						%>

						<div class="container">

							<div class="top">

								<h1>

									All Products

								</h1>

								<div>

									<% if("ADMIN".equals(role)){ %>

										<a href="/product" class="add-btn">

											Add Product

										</a>

										<a href="/admin/home" class="add-btn">

											Dashboard

										</a>

										<% } else { %>

											<a href="/user/home" class="add-btn">

												Back To Home

											</a>

											<% } %>

								</div>

							</div>

							<br>

							<!--	SORT -->

							<form action="/product/getall">

								<select name="field">

									<option value="price">

										Sort By Price

									</option>

									<option value="category">

										Sort By Category

									</option>

									<option value="name">

										Sort By Name

									</option>

									<option value="stock">

										Sort By Stock

									</option>

								</select>

								<button type="submit" class="action-btn">

									Sort

								</button>

							</form>

							<!--	EMPTY CHECK -->

							<% if(list==null || list.isEmpty()){ %>

								<h2 class="empty">

									No Products Available

								</h2>

								<% } else { %>

									<!--	TABLE -->

									<table>

										<tr>

											<th>Name</th>

											<th>Price</th>

											<th>Stock</th>

											<th>Category</th>

											<th>Description</th>

											<th>Action</th>

										</tr>

										<% for(Product p : list){ %>

											<tr>

												<td>

													<%=p.getName()%>

												</td>

												<td>

													<%=p.getPrice()%>

												</td>

												<td>

													<%=p.getStock()%>

												</td>

												<td>

													<%=p.getCategory()%>

												</td>

												<td>

													<%=p.getDescription()%>

												</td>

												<td>

													<div class="action-box">

														<!--	ORDER -->

														<a href="/orders?productId=<%=p.getId()%>" class="add-btn">

															Order

														</a>

														<!--	ADMIN ONLY -->

														<% if("ADMIN".equals(role)){ %>

															<!--	UPDATE -->

															<a href="/product/fetch?id=<%=p.getId()%>" class="add-btn"
																onclick="return confirm(
								'Are you sure you want to update this product?')">

																Update

															</a>

															<!--	DELETE -->

															<form action="/product/delete" method="post">

																<input type="hidden" name="id" value="<%=p.getId()%>">

																<button type="submit" class="action-btn" onclick="return confirm(
									'Are you sure you want to delete this product?')">

																	Delete

																</button>

															</form>

															<% } %>

													</div>

												</td>

											</tr>

											<% } %>

									</table>

									<% } %>

						</div>

			</body>

			</html>