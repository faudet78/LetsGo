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
				<form action='<spring:url value="/annonces/chercherAnnonce "></spring:url>' class="form-inline">



					<div class="form-group has-feedback field">
						<input type="text" class="form-control"
							placeholder="Adresse de départ" value="${adresseD }"
							id="adresseD" name="adresseD" /> <i
							class="form-control-feedback "><img width="20"
							style="margin-top: 7px;" height="20" alt="search"
							src="<%=request.getContextPath()%>/resources/images/map-marker-green.png"></i>
					</div>
					<span style="margin-left: 5px; margin-right: 5px;"
						class="glyphicon glyphicon-arrow-right"></span>
					<div class="form-group has-feedback field">
						<input type="text" class="form-control" id="adresseA"
							placeholder="Adresse d'arrivée" value="${adresseA }"
							name="adresseA" /> <i class="form-control-feedback "><img
							width="20" style="margin-top: 7px;" height="20" alt="search"
							src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i>
					</div>


					<div class="form-group date input-group input-append date field " id="dateRangePicker">
								<input type="text" class="form-control" name="jourDepart"
									value="${jourDepart }" placeholder="Date de départ" /> <span
									class="input-group-addon add-on"><span
									class="glyphicon glyphicon-calendar "></span></span>
					</div>







					<div class="actions form-group">
						<button type="submit" class="btn btn-large btn-success"
							title="Saisissez les adresses" disabled="disabled">
							<span class="glyphicon glyphicon-chevron-right"></span> Chercher
						</button>
					</div>
				</form>
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

			<ul class="trip-search-results">
				<c:choose>
					<c:when test="${!empty annonces }">
						<c:forEach items="${annonces }" var="annonce">
							<li class="trip relative"><a class="trip-search-oneresult"
								href='<spring:url value="/annonces/${annonce.id}.html"></spring:url>'>



								<div class="row">
										<div class="user col-sm-3 ">
											<img class="photo"
												src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/avatar/driver-male-72.png"
												width="72" height="72">

											<div class="user-info">
												<h2 class="username">${annonce.user.firstName }</h2>
												<br />
											</div>

										</div>

										<div class="description span5 col-sm-4 " >
											<h3 class="time light-gray">${annonce.jourDepart }</h3>
											<h3 class="fromto">
												<span class="from trip-roads-stop">${annonce.adresseDepart }</span>
												<span class="arrow-ie">→</span> <span
													class="trip-roads-stop">${annonce.adresseArrivee }</span> <i
													aria-hidden="true"
													class="glyphicon glyphicon-road blue size18 tip "
													title="Ce trajet emprunte l'autoroute"></i>
											</h3>
											<dl class="geo-from">
												<dt>
													<i><img width="20" style="margin-top: 7px;" height="20"
														alt="search"
														src="<%=request.getContextPath()%>/resources/images/map-marker-green.png"></i>
												</dt>
												<dd class="tip " title="Départ">${annonce.lieuDepart }</dd>
											</dl>
											<dl class="geo-to">
												<dt>
													<i><img width="20" style="margin-top: 7px;" height="20"
														alt="search"
														src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i>
												</dt>
												<dd class="tip " title="Arrivée">${annonce.lieuArrivee }</dd>
											</dl>
											<dl class="car-type" title="Confort : normal">
												<dt>
													Véhicule : <strong class="text-uppercase">${annonce.vehicule }</strong>
												</dt>
												<dd>
													<span class="rating-car star_2 tip"
														title="Confort : normal"></span>
												</dd>
											</dl>
										</div>

										<div class="offer span2 align-right col-sm-4 ">


											<div class="price price-green">
												<strong> <span> ${annonce.prix } € </span>
												</strong> <span class="priceUnit">par place</span>
											</div>
											<div class="availability">
												<c:if test="${annonce.placeDisponible=='1' }">
													<strong>1</strong> place restante
										</c:if>
												<c:if test="${annonce.placeDisponible=='0' }">
													<strong>Complet</strong>
												</c:if>
												<c:if test="${annonce.placeDisponible>'1' }">
													<strong>${annonce.placeDisponible }</strong> places
												restantes
										</c:if>

											</div>

										</div>

</div>



							</a></li>
						</c:forEach>
						<div class="" style="text-align: center;">

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
													href='<spring:url value="/annonces.html?page=${current + 1 }"></spring:url>'><span
													aria-hidden="true">&raquo;</span></a>
											</c:if></li>
									</ul>
								</nav>

							</c:if>
						</div>
					</c:when>
					<c:otherwise>
						<div class="red " style="margin-bottom: 30px;">
							<h3 align="center" style="margin-top: 20px; margin-bottom: 20px;">Desole,
								Aucun trajet n'a ete trouve!</h3>
							<br> <br>

						</div>

					</c:otherwise>
				</c:choose>


			</ul>
		</div>

	</div>









</div>













<!-- </div> -->
