<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="jakarta.tags.core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>All Users</title>

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
					font-family: Arial;
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

					font-size: 42px;
				}

				.back {

					text-decoration: none;

					background: white;

					color: black;

					padding: 12px 20px;

					border-radius: 10px;

					font-weight: bold;
				}

				table {

					width: 100%;

					border-collapse: collapse;

					background:
						rgba(255, 255, 255, 0.08);

					border-radius: 20px;

					overflow: hidden;

					color: white;
				}

				th {

					background: white;

					color: black;

					padding: 18px;

					font-size: 18px;
				}

				td {

					padding: 20px;

					text-align: center;

					border-bottom:
						1px solid rgba(255, 255, 255, 0.1);
				}

				.action-btn {

					text-decoration: none;

					background: white;

					color: black;

					padding: 10px 14px;

					border-radius: 10px;

					font-weight: bold;

					margin: 4px;

					display: inline-block;
				}

				.action-btn:hover {

					background: #dcdcdc;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<div class="top">

					<h1>
						All Users
					</h1>

					<a href="/admin/home" class="back">

						Back To Dashboard

					</a>

				</div>

				<table>

					<tr>

						<th>ID</th>

						<th>Name</th>

						<th>Email</th>

						<th>Phone</th>

						<th>Role</th>

						<th>Actions</th>

					</tr>

					<c:forEach items="${list}" var="user">

						<tr>

							<td>
								${user.id}
							</td>

							<td>
								${user.name}
							</td>

							<td>
								${user.email}
							</td>

							<td>
								${user.phone}
							</td>

							<td>
								${user.role}
							</td>

							<td>

								<a href="/user/updatePage?id=${user.id}" class="action-btn">

									Update

								</a>

								<a href="/orders/userOrders?id=${user.id}" class="action-btn">

									Order Details

								</a>

							</td>

						</tr>

					</c:forEach>

				</table>

			</div>

		</body>

		</html>