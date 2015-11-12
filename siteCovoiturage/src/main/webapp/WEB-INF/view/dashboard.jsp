<%@include file="../layout/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link type="stylesheet" rel="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<div class="panel-heading">
	<ul class="nav nav-tabs ">
		<li class="active"><a data-toggle="tab" href="#annonces">Vos
				annonces</a></li>
		<li><a data-toggle="tab" href="#reservations">Vos
				réservations</a></li>
		<li><a data-toggle="tab" href="#alertes">Alertes</a></li>
	</ul>
</div>
<div class="tab-content panel-body">
	<div class="tab-pane active" id="annonces">

		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">
					<h3>Vos trajets publiés</h3>
				</div>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${!empty annonces }">
						<div align="center">
							<c:if test="${maxPages>'0' }">
								<nav>
									<ul class="pagination">
										<li><c:if test="${current=='0' }">
												<a class="btn btn-default" disabled aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a>
											</c:if> <c:if test="${current>'0' }">
												<a class="btn btn-default" aria-label="Previous"
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${current - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty annonces }">
												<c:forEach begin="0" end="${maxPages-1 }" var="p">
													<c:choose>
														<c:when test="${p==current }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/annonces.html?page=${p}"></spring:url>'>
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
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${current + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>
							</c:if>
						</div>
						<table
							class="table table-hover table-striped table-condensed table-responsive table-bordered">

							<tr class="warning">
								<th class="text-center">Adresse de départ</th>
								<th class="text-center">Adresse d'arrivée</th>
								<th class="text-center">Lieu de départ</th>
								<th class="text-center">Lieu d'arrivée</th>
								<th class="text-center">Nombre de places proposées</th>
								<th class="text-center">Date de départ</th>
								<th>Heure de départ</th>
							</tr>
							<c:forEach items="${annonces}" var="annonce">
								<tr>
									<td class="text-center">${annonce.adresseDepart }</td>
									<td class="text-center">${annonce.adresseArrivee }</td>
									<td class="text-center">${annonce.lieuDepart }</td>
									<td class="text-center">${annonce.lieuArrivee }</td>
									<td class="text-center">${annonce.placeProposees }</td>
									<td class="text-center">${annonce.jourDepart }</td>
									<td class="text-center">${annonce.heureDepart }</td>
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
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${current - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty annonces }">
												<c:forEach begin="0" end="${maxPages-1 }" var="p">
													<c:choose>
														<c:when test="${p==current }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/annonces.html?page=${p}"></spring:url>'>
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
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${current + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>
							</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<div style="height: 200px;">
							<h5>Vous n'avez pas de trajet à venir. Créez une nouvelle
								annonce en cliquant sur le lien ci-dessous.</h5>
							<br> <a class="btn btn-success"
								href='<spring:url value="/annonces/posterAnnonce.html"></spring:url>'
								style="color: white;">Publier une annonce</a>
						</div>

					</c:otherwise>
				</c:choose>



			</div>

		</div>
	</div>
	<div class="tab-pane " id="reservations">
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
							<c:if test="${maxPagess>'0' }">
								<nav>
									<ul class="pagination">
										<li><c:if test="${currents=='0' }">
												<a class="btn btn-default" disabled aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a>
											</c:if> <c:if test="${currents>'0' }">
												<a class="btn btn-default" aria-label="Previous"
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${currents - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty reservations }">
												<c:forEach begin="0" end="${maxPagess-1 }" var="p">
													<c:choose>
														<c:when test="${p==currents }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/annonces.html?page=${p}"></spring:url>'>
																${p+1} </a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if></li>
										<li><c:if test="${currents==maxPagess-1 }">
												<a class="btn btn-default" aria-label="Next" disabled><span
													aria-hidden="true">&raquo;</span></a>
											</c:if> <c:if test="${currents<maxPagess-1 }">
												<a class="btn btn-default" aria-label="Next"
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${currents + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>
							</c:if>
						</div>
						<table
							class="table table-hover table-striped table-condensed table-responsive table-bordered">

							<tr class="warning">

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
							<c:if test="${maxPagess>'0' }">
								<nav>
									<ul class="pagination">
										<li><c:if test="${currents=='0' }">
												<a class="btn btn-default" disabled aria-label="Previous"><span
													aria-hidden="true">&laquo;</span></a>
											</c:if> <c:if test="${currents>'0' }">
												<a class="btn btn-default" aria-label="Previous"
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${currents - 1 }"></spring:url>'><span
													aria-hidden="true">&laquo;</span></a>
											</c:if></li>
										<li><c:if test="${!empty reservations }">
												<c:forEach begin="0" end="${maxPagess-1 }" var="p">
													<c:choose>
														<c:when test="${p==currents }">
															<a class="btn btn-primary active">${p+1}</a>
														</c:when>
														<c:otherwise>
															<a class="btn btn-primary"
																href='<spring:url value="/annonces/dashboard/annonces.html?page=${p}"></spring:url>'>
																${p+1} </a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if></li>
										<li><c:if test="${currents==maxPagess-1 }">
												<a class="btn btn-default" aria-label="Next" disabled><span
													aria-hidden="true">&raquo;</span></a>
											</c:if> <c:if test="${currents<maxPagess-1 }">
												<a class="btn btn-default" aria-label="Next"
													href='<spring:url value="/annonces/dashboard/annonces.html?page=${currents + 1 }"></spring:url>'><span
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
	$activetabhome = (params.activeTab is null or params.activeTab == 'home') ? 'class="active"' : '';
	$activetabprofile = (params.activeTab == 'profile') ? 'class="active"' : '';
	<div class="tab-pane " id="alertes" style="height: 397px;">vos
		alertes</div>
</div>
<script type="text/javascript">
	var hash = location.hash, hashPieces = hash.split('?'), activeTab = $('[href='
			+ hashPieces[0] + ']');
	activeTab && activeTab.tab('show');
</script>