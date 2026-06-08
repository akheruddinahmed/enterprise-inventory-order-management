<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>

			<meta charset="UTF-8">

			<title>Reports</title>

			<style>
				* {
					margin: 0;
					padding: 0;
					box-sizing: border-box;
					font-family: Arial;
				}

				body {

					min-height: 100vh;

					padding: 40px;

					background:
						linear-gradient(135deg,
							#0f0f0f,
							#181818,
							#202020);

					color: white;
				}

				.container {

					width: 95%;

					margin: auto;
				}

				.top {

					display: flex;

					justify-content: space-between;

					align-items: center;

					margin-bottom: 35px;
				}

				h1 {

					font-size: 40px;
				}

				.btn {

					text-decoration: none;

					background: white;

					color: black;

					padding: 12px 20px;

					border-radius: 10px;

					font-weight: bold;
				}

				.section {

					margin-top: 40px;
				}

				.card {

					background:
						rgba(255, 255, 255, 0.08);

					border:
						1px solid rgba(255, 255, 255, 0.15);

					backdrop-filter: blur(10px);

					padding: 25px;

					border-radius: 18px;

					margin-bottom: 25px;
				}

				.card h2 {

					margin-bottom: 20px;
				}

				table {

					width: 100%;

					border-collapse: collapse;
				}

				th {

					background: white;

					color: black;

					padding: 14px;
				}

				td {

					padding: 14px;

					text-align: center;

					border-bottom:
						1px solid rgba(255, 255, 255, 0.1);
				}

				.status {

					color: #00ff99;

					font-weight: bold;
				}

				.pending {

					color: orange;

					font-weight: bold;
				}

				select {

					padding: 8px;

					border-radius: 8px;

					border: none;
				}

				.update-btn {

					padding: 8px 14px;

					border: none;

					border-radius: 8px;

					background: white;

					font-weight: bold;

					cursor: pointer;

					margin-left: 8px;
				}

				.pagination {

					margin-top: 20px;

					display: flex;

					justify-content: center;

					gap: 20px;
				}

				.pagination a {

					text-decoration: none;

					color: black;

					background: white;

					padding: 10px 18px;

					border-radius: 10px;

					font-weight: bold;
				}

				.empty {

					padding: 25px;

					font-size: 20px;

					font-weight: bold;

					color: #00ff99;
				}

				.stock-input {

					padding: 8px;

					width: 90px;

					border: none;

					border-radius: 8px;
				}
			</style>

		</head>

		<body>

			<div class="container">

				<div class="top">

					<h1>
						Reports Dashboard
					</h1>

					<a href="/admin/home" class="btn">

						Back To Dashboard

					</a>

				</div>

				<!-- LOW STOCK PRODUCTS -->

				<div class="section">

					<div class="card">

						<h2>
							⚠ Low Stock Products
						</h2>

						<table>

							<tr>

								<th>
									ID
								</th>

								<th>
									Product Name
								</th>

								<th>
									Stock Left
								</th>

								<th>
									Add Stock
								</th>

							</tr>

							<c:choose>

								<c:when test="${empty lowStock}">

									<tr>

										<td colspan="4" class="empty">

											No Product In Low Stock

										</td>

									</tr>

								</c:when>

								<c:otherwise>

									<c:forEach items="${lowStock}" var="p">

										<tr>

											<td>
												${p.id}
											</td>

											<td>
												${p.name}
											</td>

											<td class="pending">
												${p.stock}
											</td>

											<td>

												<form action="/product/addStock" method="post">

													<input type="hidden" name="id" value="${p.id}">

													<input type="number" name="stock" min="1" required
														class="stock-input">

													<button type="submit" class="update-btn">

														Add

													</button>

												</form>

											</td>

										</tr>

									</c:forEach>

								</c:otherwise>

							</c:choose>

						</table>

						<div class="pagination">

							<c:if test="${lowPage > 0}">

								<a href="?lowPage=${lowPage-1}
						&completedPage=${completedPage}
						&pendingPage=${pendingPage}">

									Previous

								</a>

							</c:if>

							<c:if test="${lowHasNext}">

								<a href="?lowPage=${lowPage+1}
						&completedPage=${completedPage}
						&pendingPage=${pendingPage}">

									Next

								</a>

							</c:if>

						</div>

					</div>

				</div>

				<!-- COMPLETED ORDERS -->

				<div class="section">

					<div class="card">

						<h2>
							✅ Completed Orders
						</h2>

						<table>

							<tr>

								<th>
									Order ID
								</th>

								<th>
									User
								</th>

								<th>
									Status
								</th>

							</tr>

							<c:choose>

								<c:when test="${empty completedOrders}">

									<tr>

										<td colspan="3" class="empty">

											No Completed Orders

										</td>

									</tr>

								</c:when>

								<c:otherwise>

									<c:forEach items="${completedOrders}" var="o">

										<tr>

											<td>
												${o.id}
											</td>

											<td>
												${o.user.name}
											</td>

											<td class="status">
												${o.status}
											</td>

										</tr>

									</c:forEach>

								</c:otherwise>

							</c:choose>

						</table>

						<div class="pagination">

							<c:if test="${completedPage > 0}">

								<a href="?lowPage=${lowPage}
						&completedPage=${completedPage-1}
						&pendingPage=${pendingPage}">

									Previous

								</a>

							</c:if>

							<c:if test="${completedHasNext}">

								<a href="?lowPage=${lowPage}
						&completedPage=${completedPage+1}
						&pendingPage=${pendingPage}">

									Next

								</a>

							</c:if>

						</div>

					</div>

				</div>

				<!-- PENDING ORDERS -->

				<div class="section">

					<div class="card">

						<h2>
							🕒 Pending Orders
						</h2>

						<table>

							<tr>

								<th>
									Order ID
								</th>

								<th>
									User
								</th>

								<th>
									Status
								</th>

								<th>
									Action
								</th>

							</tr>

							<c:choose>

								<c:when test="${empty pendingOrders}">

									<tr>

										<td colspan="4" class="empty">

											No Pending Orders

										</td>

									</tr>

								</c:when>

								<c:otherwise>

									<c:forEach items="${pendingOrders}" var="o">

										<tr>

											<td>
												${o.id}
											</td>

											<td>
												${o.user.name}
											</td>

											<td class="pending">
												${o.status}
											</td>

											<td>

												<form action="/orders/update" method="post">

													<input type="hidden" name="id" value="${o.id}">

													<select name="status">

														<option value="PLACED">
															PLACED
														</option>

														<option value="SHIPPED">
															SHIPPED
														</option>

														<option value="DELIVERED">
															DELIVERED
														</option>

													</select>

													<button type="submit" class="update-btn">

														Update

													</button>

												</form>

											</td>

										</tr>

									</c:forEach>

								</c:otherwise>

							</c:choose>

						</table>

						<div class="pagination">

							<c:if test="${pendingPage > 0}">

								<a href="?lowPage=${lowPage}
						&completedPage=${completedPage}
						&pendingPage=${pendingPage-1}">

									Previous

								</a>

							</c:if>

							<c:if test="${pendingHasNext}">

								<a href="?lowPage=${lowPage}
						&completedPage=${completedPage}
						&pendingPage=${pendingPage+1}">

									Next

								</a>

							</c:if>

						</div>

					</div>

				</div>

			</div>

		</body>

		</html>