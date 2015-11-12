<%@include file="../layout/taglib.jsp"%>
<link type="stylesheet" rel="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel-heading">
	<ul class="nav nav-tabs ">
		<li><a
			href='<spring:url value="/annonces/dashboard/annonces.html"></spring:url>'>Vos
				annonces</a></li>
		<li class="active"><a data-toggle="tab"
			href='<spring:url value="/annonces/dashboard/reservations.html"></spring:url>'>Vos
				réservations</a></li>
		<li><a href="#alertes">Alertes</a></li>
	</ul>
</div>
<div class="tab-content panel-body">

	<div class="tab-pane active ">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<div class="panel-title">
					<h3>Vos réservations</h3>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${!empty reservations}">
						<div align="center">
							<c:if test="${maxPages>'0' }">
								<nav>
									<ul class="pagination">
										<li><c:if test="${current=='0' }">
												<a class="btn btn-default" disabled aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a>
											</c:if> <c:if test="${current>'0' }">
												<a class="btn btn-default" aria-label="Previous"
													href='<spring:url value="/annonces/dashboard/reservations.html?page=${currents - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty reservations }">
												<c:forEach begin="0" end="${maxPages-1 }" var="p">
													<c:choose>
														<c:when test="${p==current }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/reservations.html?page=${p}"></spring:url>'>
																${p+1} </a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if></li>
										<li><c:if test="${current==maxPages-1 }">
												<a class="btn btn-default" aria-label="Next" disabled><span
													aria-hidden="true">&raquo;</span></a>
											</c:if> <c:if test="${current<maxPages-1 }">
												<a class="btn btn-default" aria-label="Next"
													href='<spring:url value="/annonces/dashboard/reservations.html?page=${current + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>
							</c:if>
						</div>
						<table
							class="table table-hover table-striped table-condensed table-responsive table-bordered">

							<tr class="info">

								<th class="text-center">Adresse de départ</th>
								<th class="text-center">Adresse d'arrivée</th>
								<th class="text-center">Date de départ</th>
								<th>Heure de départ</th>
								<th class="text-center">Nombre de places reservées</th>
								<th class="text-center">Prix total</th>
							</tr>
							<c:forEach items="${reservations}" var="reservation">
								<tr>
									<td class="text-center">${reservation.annonce.adresseDepart}</td>
									<td class="text-center">${reservation.annonce.adresseArrivee}</td>
									<td class="text-center">${reservation.annonce.jourDepart}</td>
									<td class="text-center">${reservation.annonce.heureDepart}</td>
									<td class="text-center">${reservation.nombrePlace}</td>
									<td class="text-center">${reservation.prixTotal}</td>


								</tr>
							</c:forEach>


						</table>
						<div align="center">
							<c:if test="${maxPages>'0' }">
								<nav>
									<ul class="pagination">
										<li><c:if test="${current=='0' }">
												<a class="btn btn-default" disabled aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a>
											</c:if> <c:if test="${current>'0' }">
												<a class="btn btn-default" aria-label="Previous"
													href='<spring:url value="/annonces/dashboard/reservations.html?page=${currents - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty reservations }">
												<c:forEach begin="0" end="${maxPages-1 }" var="p">
													<c:choose>
														<c:when test="${p==current }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/reservations.html?page=${p}"></spring:url>'>
																${p+1} </a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if></li>
										<li><c:if test="${current==maxPages-1 }">
												<a class="btn btn-default" aria-label="Next" disabled><span
													aria-hidden="true">&raquo;</span></a>
											</c:if> <c:if test="${current<maxPages-1 }">
												<a class="btn btn-default" aria-label="Next"
													href='<spring:url value="/annonces/dashboard/reservations.html?page=${current + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>
							</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<div style="height: 200px;">
							<h5 class="warning">Oups.. Jusqu'à présent aucun covoiturage
								n'a été réservé. Recherchez un covoiturage en cliquant sur le
								lien ci-dessous.</h5>
							<br> <a class="btn btn-success"
								href='<spring:url value="/annonces.html"></spring:url>'
								style="color: white;">Rechercher </a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
