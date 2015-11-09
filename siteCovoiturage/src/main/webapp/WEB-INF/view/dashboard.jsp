<%@include file="../layout/taglib.jsp"%>
<link type="stylesheet" rel="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<style>
.panel .panel-body {
	overflow: auto;
}
</style>
<div class="panel-heading">
	<ul class="nav nav-tabs ">
		<li class="active"><a data-toggle="tab" href="#annonces">Vos
				annonces</a></li>
		<li><a data-toggle="tab" href="#reservations">Vos
				réservations</a></li>
		<li><a data-toggle="tab" href="#alertes">Alertes</a></li>
	</ul>
</div>
<div class="tab-content panel-body" style="height: 397px;">
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
					</c:when>
					<c:otherwise>
						<div>
							<h5>Vous n'avez pas de trajet à venir. Créez une nouvelle
								annonce en cliquant sur le lien ci-dessous</h5>
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
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="panel-title">
					<h3>Vos réservations</h3>
				</div>
			</div>
			<div class="panel-body">
				<%-- <c:choose>
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
													href='<spring:url value="/annonces/dashboard/reservations.html?page=${current - 1 }"></spring:url>'><span
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

							<tr class="warning">
								<th class="text-center">user</th>
								
							</tr>
							<c:forEach items="${reservations}" var="reservation">
								<tr>
									<td class="text-center">${reservation.user.id }</td>
									
								</tr>
							</c:forEach>


						</table>
					</c:when>
					<c:otherwise>
						<div>
							<h5>Vous n'avez pas de trajet à venir. Créez une nouvelle
								annonce en cliquant sur le lien
								ci-dessous</h5><br>
							<a class="btn btn-success" href='<spring:url value="/annonces/posterAnnonce.html"></spring:url>' style="color: white;">Publier une annonce</a>
						</div>

					</c:otherwise>
				</c:choose>
 --%>
				vos reservations

			</div>

		</div>
		
	</div>
	<div class="tab-pane " id="alertes">vos alertes</div>
</div>
