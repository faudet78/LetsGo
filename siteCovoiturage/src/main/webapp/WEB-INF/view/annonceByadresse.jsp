<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/taglib.jsp"%>
<link rel="stylesheet"
	href="../../resources/files/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/style2.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/style2.css">
<!-- <div class="panel-body "> -->
<style type="text/css">
/**
 * Override feedback icon position
 * See http://formvalidation.io/examples/adjusting-feedback-icon-position/
 */
#dateRangeForm .form-control-feedback {
	top: 0;
	right: -15px;
}
</style>
<div class="row ">
	<div class="col-sm-12" style="margin-top: 30px;">
		<div class="col-sm-12 ">
			<c:if test="${!empty message }">
				<div class="alert alert-success " id="removeMe">
					<h4 align="center">${message }
						<a class="push-right " onclick="removeDiv('removeMe');" href="#">&times;</a>
					</h4>
				</div>
			</c:if>


			<div class="panel-heading panel-default text-capitalize"
				style="background-color: #A52A2A;">
				<h4 align="center">
					<span><img width="40" height="40" alt="search"
						src="<%=request.getContextPath()%>/resources/images/Search-1.png"></span>
					<strong class="text-uppercase" style="color: white;">Rechercher
						un covoiturage</strong>
				</h4>
			</div>
			<div class="panel-body" style="background-color: #DCDCDC;"
				align="center">
				<form
					action='<spring:url value="/annonces/chercherAnnonce "></spring:url>'
					class="form-inline">
					<div class="form-group has-feedback field">
						<input type="text" class="form-control"
							placeholder="Adresse de départ" value="${adresseD }"
							id="adresseDepart" name="adresseD" /> <i
							class="form-control-feedback "><img width="20"
							style="margin-top: 7px;" height="20" alt="search"
							src="<%=request.getContextPath()%>/resources/images/map-marker-green.png"></i>
					</div>
					<span style="margin-left: 5px; margin-right: 5px;"
						class="glyphicon glyphicon-arrow-right"></span>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="adresseArrivee"
							placeholder="Adresse d'arrivée" value="${adresseA }"
							name="adresseA" /> <i class="form-control-feedback "><img
							width="20" style="margin-top: 7px;" height="20" alt="search"
							src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i>
					</div>
					<div class="form-group date input-group input-append date"
						id="datePicker">
						<input type="text" class="form-control" name="jourDepart" id="jourDepart"
							value="${jourDepart }" placeholder="Date de départ" /> <span
							class="input-group-addon add-on"><span
							class="glyphicon glyphicon-calendar "></span></span>
					</div>
					<div class="actions form-group">
						<button type="submit" class="btn btn-large btn-success" id="sbtbtn"
							title="Saisissez les adresses">
							<span class="glyphicon glyphicon-chevron-right"></span> Chercher
						</button>
					</div>
				</form>
			</div>
			<div>
				<c:if test="${nbreAnnonces=='0'}">
					<div class="panel">
						<h5>${nbreAnnonces }
							Resultat trouvé de ${adresseD } <span
								style="margin-left: 5px; margin-right: 5px;"
								class="glyphicon glyphicon-arrow-right"></span> ${adresseA }
						</h5>
					</div>
				</c:if>
				<c:if test="${nbreAnnonces=='1' }">
					<div class="panel">
						<h5>${nbreAnnonces }
							Resultat trouvé de ${adresseD } <span
								style="margin-left: 5px; margin-right: 5px;"
								class="glyphicon glyphicon-arrow-right"></span> ${adresseA }
						</h5>
					</div>
				</c:if>
				<c:if test="${nbreAnnonces>'1' }">
					<div class="panel">
						<h5>${nbreAnnonces }
							Resultats trouvés de ${adresseD } <span
								style="margin-left: 5px; margin-right: 5px;"
								class="glyphicon glyphicon-arrow-right"></span> ${adresseA }
						</h5>
					</div>
				</c:if>
			</div>







		</div>
		<div class="col-sm-12 " style="margin-top: 20px;" align="center">
			<c:if test="${maxPages>'0' }">
	page : ${current+1 }/${maxPages }
				<nav>
					<ul class="pagination">




						<li><c:if test="${current=='0' }">
								<a class="btn btn-default" disabled aria-label="Previous"><span
									aria-hidden="true">&laquo;</span></a>
							</c:if> <c:if test="${current>'0' }">
								<a class="btn btn-default" aria-label="Previous"
									href='<spring:url value="/annonces.html?page=${current - 1 }"></spring:url>'><span
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
												href='<spring:url value="/annonces?page=${p}"></spring:url>'>
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
									href='<spring:url value="/
s.html?page=${current + 1 }"></spring:url>'><span
									aria-hidden="true">&raquo;</span></a>
							</c:if></li>
					</ul>
				</nav>
			</c:if>
			<c:choose>
				<c:when test="${!empty annonces }">
					<c:forEach items="${annonces }" var="annonce">
						<a class="trip-search-oneresult"
							href='<spring:url value="/annonces/${annonce.id}.html"></spring:url>'>
							<div class=" row">
								<div class="col-sm-2 user " style="padding-right: 10px;">

									<img class="img-circle "
										src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/avatar/driver-male-72.png"
										width="60" height="60" style="margin-right: 2px;">
									<div>
										<h5>
											<strong>${annonce.user.firstName }</strong>
										</h5>
									</div>
								</div>
								<div class="col-sm-5 col-sm-offset-2 ">
									<div class="row" align="left">
										<h3 class="time light-gray">${annonce.jourDepart }</h3>
										<h3 class="fromto">
											<span class="trip-roads-stop text-uppercase ">${annonce.adresseDepart }</span>
											<span class="arrow-ie">→</span> <span
												class="trip-roads-stop text-uppercase">${annonce.adresseArrivee }</span>
											<i aria-hidden="true"
												class="glyphicon glyphicon-road blue size18 tip "
												title="Ce trajet emprunte l'autoroute"></i>
										</h3>
									</div>
									<div class="row " align="left">
										<i><img width="20" style="margin-top: 7px;" height="20"
											alt="search"
											src="<%=request.getContextPath()%>/resources/images/map-marker-green.png"></i>
										<span class="text-capitalize">${annonce.lieuDepart }</span>
									</div>
									<div class="row" align="left">
										<i><img width="20" style="margin-top: 7px;" height="20"
											alt="search"
											src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i><span
											class="text-capitalize">${annonce.lieuArrivee }</span>
									</div>
									<div class="row" align="left">
										<h5>
											Véhicule : <strong class="text-uppercase">${annonce.vehicule }</strong>
										</h5>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="price price-green row">
										<strong> <span> ${annonce.prix } € </span>
										</strong> <span class="priceUnit">par place</span>
									</div>
									<div class="row">
										<c:if test="${annonce.placeDisponible=='1' }">
											<h5>
												<strong>1</strong> place restante
											</h5>
										</c:if>
										<c:if test="${annonce.placeDisponible=='0' }">
											<h5>
												<strong>Complet</strong>
											</h5>
										</c:if>
										<c:if test="${annonce.placeDisponible>'1' }">
											<h5>
												<strong>${annonce.placeDisponible }</strong> places
												restantes
											</h5>
										</c:if>

									</div>
								</div>


							</div>
							<hr>
						</a>
					</c:forEach>
					<div align="center">
						<c:if test="${maxPages>'0' }">
	page : ${current+1 }/${maxPages }

				<nav>
								<ul class="pagination">
									<li><c:if test="${current=='0' }">
											<a class="btn btn-default" disabled aria-label="Previous"><span
												aria-hidden="true">&laquo;</span></a>
										</c:if> <c:if test="${current>'0' }">
											<a class="btn btn-default" aria-label="Previous"
												href='<spring:url value="/chercherAnnonce?adresseD=${adresseD }&adresseA=${adresseA }&page=${current - 1 }"></spring:url>'><span
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
															href='<spring:url value="/chercherAnnonce?adresseD=${adresseD }&adresseA=${adresseA }&page=${p}"></spring:url>'>
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
												href='<spring:url value="/chercherAnnonce?adresseD=${adresseD }&adresseA=${adresseA }&page=${current + 1 }"></spring:url>'><span
												aria-hidden="true">&raquo;</span></a>
										</c:if></li>
								</ul>
							</nav>
						</c:if>
						<p class="push-right">
							<a href='<spring:url value="/annonces.html"></spring:url>'
								style="text-decoration: underline;"><span
								class="glyphicon glyphicon-arrow-left"> </span>Retour a liste
								des annonces</a>
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="red " style="margin-bottom: 30px;">
						<h3 align="center" style="margin-top: 20px; margin-bottom: 20px;">Desole,
							Aucun trajet n'a ete trouve!</h3>
						<br> <br>
						<p class="push-right">
							<a href='<spring:url value="/annonces.html"></spring:url>'
								style="text-decoration: underline;"><span
								class="glyphicon glyphicon-arrow-left"> </span>Retour a liste
								des annonces</a>
						</p>
					</div>
				</c:otherwise>
			</c:choose>
			
	</div>
</div>