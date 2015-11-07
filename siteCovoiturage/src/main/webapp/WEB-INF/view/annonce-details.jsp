<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="../../resources/files/css/style2.css">
<link rel="stylesheet"
	href="../../resources/files/css/bootstrap.min.css">
<style type="text/css">
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border-top: none;
}
</style>
<div class="panel-body" style="background-color: #FFFAFA;">
	<div class="row">
		<div class="col-sm-12">
			<div class="col-sm-4 ">
				<div class="panel panel-default panel-body ">Contrary to
					popular belief, Lorem Ipsum is not simply random text. It has roots
					in a piece of classical Latin literature from 45 BC, making it over
					2000 years old. Richard McClintock, a Latin professor at
					Hampden-Sydney College in Virginia, looked up one of the more
					obscure Latin words, consectetur, from a Lorem Ipsum passage, and
					going through the cites of the word in classical literature,
					discovered the undoubtable source. Lorem Ipsum comes from sections
					1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The
					Extremes of Good and Evil) by</div>
				<div class="panel panel-default ">
					<div class="panel-heading">
						<h4 style="color: #B22222;">Avec qui voyagez vous ?</h4>
					</div>
					<div class="panel-body">
						<table class="table">
							<tr>
								<td><img alt="Conducteur" width="20" height="20"
									src="<%=request.getContextPath()%>/resources/images/user-1.png"></td>
								<td><c:choose>
										<c:when test="${annonce.user.sex=='masculin' }">
											<a href="#" class="text-capitalize ">${annonce.user.firstName }</a> voyage seul.
						</c:when>
										<c:otherwise>
											<a href="#" class="text-capitalize">${annonce.user.firstName }</a> voyage seule.</c:otherwise>
									</c:choose></td>
							</tr>
							<c:choose>
								<c:when test="${annonce.placeDisponible=='3' }">
									<tr>
										<td><img alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"><img
											alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"><img
											alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"></td>
										<td>Il reste ${annonce.placeDisponible} places de libre.</td>
								</c:when>
								<c:when test="${annonce.placeDisponible=='2' }">
									<tr>
										<td><img alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"><img
											alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"></td>
										<td>Il reste ${annonce.placeDisponible} places de libre.</td>
								</c:when>
								<c:when test="${annonce.placeDisponible=='1' }">
									<tr>
										<td><img alt="Conducteur" width="20" height="20"
											src="<%=request.getContextPath()%>/resources/images/user1.png"></td>
										<td>Il reste ${annonce.placeDisponible} place de libre.</td>
								</c:when>
								<c:otherwise>
									<tr>
										<td></td>
										<td>Aucune place disponible, toutes les places sont
											prises.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 style="color: #B22222;">Véhicule</h4>
					</div>
					<div class="panel-body">
						<c:choose>
							<c:when test="${empty annonce.photo }">
								<img alt="vehicule"
									style="margin-right: 10px; margin-bottom: 10px;"
									class="img-rounded push-left"
									src="<%=request.getContextPath()%>/resources/images/vehicule.jpg"
									width="140" height="140">
							</c:when>
							<c:otherwise>
								<img alt="vehicule"
									style="margin-right: 10px; margin-bottom: 10px;"
									class="img-rounded push-left"
									src="/annonces/photoAnnonce?idAnnonce=${annonce.id }"
									width="140" height="140">



							</c:otherwise>
						</c:choose>
						<h5 class="text-uppercase">
							<strong>${annonce.vehicule }</strong>
						</h5>
						<hr>
						<c:choose>
							<c:when test="${!empty annonce.nbrePortes }">
								<h5>
									Nombre de portes : <strong>${annonce.nbrePortes  }</strong>
								</h5>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${annonce.climatisation==true }">
								<h5>
									Climatisation : <strong>Oui</strong>
								</h5>
							</c:when>
							<c:otherwise>Climatisation : <strong>Non</strong>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${annonce.hasMusic==true }">
								<h5>
									Musique : <strong>Oui</strong>
								</h5>
							</c:when>
							<c:otherwise>Musique : <strong>Non</strong>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="panel-default panel col-sm-5  ">
				<div class="panel-body">
					<h4 class="fromto" style="color: #B22222;">
						Trajet <span class="from trip-roads-stop" style="color: #B22222;">${annonce.adresseDepart }</span>
						<span class="arrow-ie">→ </span><span class="trip-roads-stop"
							style="color: #B22222;"> ${annonce.adresseArrivee }</span>
					</h4>
					<hr>
					<div>
						<table class="table">
							<tr>
								<td><span class="glyphicon glyphicon-calendar cyan size18"></span></td>
								<td><h5>
										<strong> ${annonce.jourDepart }</strong>
									</h5></td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-time size18"></span></td>
								<td><h5>
										<strong> ${annonce.heureDepart }</strong> <small>(depart
											+/-15 minutes)</small>
									</h5></td>
							</tr>
							<tr>
								<td><i><img width="25" height="25" alt="search"
										src="<%=request.getContextPath()%>/resources/images/map-marker-green.png"></i></td>
								<td><h5>${annonce.lieuDepart }</h5></td>
								<td><i><img width="25" height="25" alt="search"
										src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i></td>
								<td><h5>${annonce.lieuArrivee }</h5></td>
							</tr>
						</table>
						<table class="table">
							<tr>
								<c:if test="${!empty annonce.typeTrajet }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/trajet-aller.png"></td>
								</c:if>

								<c:if test="${annonce.musicActive==true }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/msic.jpg"
										width="40" height="40"></td>
								</c:if>
								<c:if test="${annonce.musicActive==false }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/no-music.jpg"
										width="40" height="40"></td>
								</c:if>
								<c:if test="${annonce.animauxActive==true }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/pets.png"
										width="40" height="40"></td>
								</c:if>
								<c:if test="${annonce.animauxActive==false }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/no_dogs_allowed.png"
										width="40" height="40"></td>
								</c:if>
								<c:if test="${annonce.fumeurActive==true }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/smoking.png"
										width="40" height="40"></td>
								</c:if>
								<c:if test="${annonce.fumeurActive==false }">
									<td><img alt=""
										src="<%=request.getContextPath()%>/resources/images/No-Smoking.png"
										width="40" height="40"></td>
								</c:if>
							</tr>
						</table>
					</div>
					<div class="panel-body thumbnail "
						style="background-color: #B0C4DE;">
						<c:choose>
							<c:when test="${!empty annonce.details }">
								<p class="text-capitalize">${annonce.details }</p>
							</c:when>
							<c:otherwise>
								<p>Aucun detail pour ce trajet.</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="panel-body col-sm-10">
					<table class="table">
						<caption>
							<h4 style="color: #B22222;">Details du voyage</h4>
						</caption>
						<c:if test="${annonce.typeTrajet=='Allee simple' }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/trajet-aller.png"></td>
								<td>Ce trajet est un trajet simple.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.typeTrajet=='Allee retour' }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/aller-retour.png"></td>
								<td>Ce trajet est un trajet allez-retour.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.musicActive==true }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/msic.jpg"
									width="40" height="40"></td>
								<td>Votre conducteur aime voyager en musique.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.musicActive==false }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/no-music.jpg"
									width="40" height="40"></td>
								<td>Votre conducteur n'aime pas voyager en musique.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.animauxActive==true }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/pets.png"
									width="40" height="40"></td>
								<td>Les animaux sont autorisés à bord.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.animauxActive==false }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/no_dogs_allowed.png"
									width="40" height="40"></td>
								<td>Les animaux ne sont pas autorisés à bord.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.fumeurActive==true }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/smoking.png"
									width="40" height="40"></td>
								<td>je fume si cela ne dérange pas.</td>
							</tr>
						</c:if>
						<c:if test="${annonce.fumeurActive==false }">
							<tr>
								<td><img alt=""
									src="<%=request.getContextPath()%>/resources/images/No-Smoking.png"
									width="40" height="40"></td>
								<td>Ce trajet est non fumeur.</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
			<div class="panel-default col-sm-3 ">
				<div class="panel-body panel panel-default">
					<table class="table">
						<tr>
							<td><h1 class="price price-green">
									<strong> <span> ${annonce.prix } € </span></strong>
								</h1></td>
							<td><c:if test="${annonce.placeDisponible=='0' }">
									<h4>
										<strong><i>Complet</i></strong>
									</h4>
								</c:if> <c:if test="${annonce.placeDisponible=='1' }">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user-1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
								</c:if> <c:if test="${annonce.placeDisponible=='2' }">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user-1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
								</c:if> <c:if test="${annonce.placeDisponible=='3' }">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user-1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
									<img alt="Conducteur" width="20" height="20"
										src="<%=request.getContextPath()%>/resources/images/user1.png">
								</c:if></td>
						</tr>
						<tr>
							<td style="color: gray;"><h5>Par passager</h5></td>
							<td style="color: gray;"><c:if
									test="${annonce.placeDisponible=='1' }">
									<h5>${annonce.placeDisponible }disponible</h5>
								</c:if> <c:if test="${annonce.placeDisponible>'1' }">
									<h5>${annonce.placeDisponible }disponibles</h5>
								</c:if></td>
						</tr>
					</table>
					<div>
						<form:form commandName="reservation" method="POST"
							cssClass="form-horizontal">
							<c:if test="${annonce.placeDisponible=='1' }">
								<div class="form-group">
									<div class="col-sm-12">
										<form:select path="nombrePlace" 
											cssClass="form-control" >
											<form:option value="1">1 place</form:option>
											</form:select>
									</div>
								</div>
							</c:if>
							<c:if test="${annonce.placeDisponible=='2' }">
								<div class="form-group">
									<div class="col-sm-12">
										<form:select path="nombrePlace" cssClass="form-control">
											<form:option value="1">1 place</form:option>
											<form:option value="2">2 places</form:option>
										</form:select>

									</div>
								</div>

							</c:if>
							<div class="col-sm-12">
								<c:if test="${annonce.placeDisponible=='3' }">
									<div class="form-group">
										<form:select path="nombrePlace" cssClass="form-control">
											<form:option value="1">1 place</form:option>
											<form:option value="2">2 places</form:option>
											<form:option value="3">3 places</form:option>
										</form:select>

									</div>

								</c:if>

								<div class="row ">
									<c:if test="${annonce.placeDisponible>'0' }">
										<input type="submit"
											class="btn btn-large btn-warning col-sm-11 " value="Reserver">
									</c:if>
									<c:if test="${annonce.placeDisponible=='0' }">
										<p>Il est trop tard pour réserver sur ce trajet.
<a href='<c:url value="/annonces.html"></c:url>'>Rechercher un autre trajet</a></p>
											</c:if>

								</div>




							</div>



						</form:form>


					</div>
				</div>
				<div class="panel-default panel">
					<div class="panel-heading ">
						<h4 style="color: #B22222;">Conducteur</h4>
					</div>
					<div class="panel-body">
						<div class="user">
							<img class="img-circle push-left " style="margin-right: 10px;"
								src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/avatar/driver-male-72.png"
								width="50" height="50">
							<div style="margin-bottom: 10px;">
								<h2 class="username">${annonce.user.firstName }</h2>
								<c:choose>
									<c:when test="${annonce.user.sex=='homme' }">
										<p>Connecté depuis le ${annonce.user.dateInscription }</p>
									</c:when>
									<c:otherwise>
										<p>Connectée depuis le ${annonce.user.dateInscription }</p>
									</c:otherwise>
								</c:choose>
							</div>

							<c:if test="${!empty annonce.user.commentaire  }">
								<div class="thumbnail panel panel-info">
									<p>${annonce.user.commentaire }</p>
								</div>
							</c:if>

							<div class="push-right">
								<a data-toggle="modal" data-target="#profil">Voir le profil
									complet</a>
							</div>
							<div>
								<div class="modal fade" role="dialog"
									aria-labelledby="profilModal" id="profil">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title" style="color: #B22222;">Informations
													sur le conducteur</h4>
											</div>
											<div class="modal-body">
												<div class="container-fluid">
													<div class="row">
														<div class="col-sm-2">
															<img class="img-circle push-left "
																src="https://d1ovtcjitiy70m.cloudfront.net/vi-1/images/avatar/driver-male-72.png"
																width="100" height="100">
														</div>
														<div class="col-sm-9 push-right">
															<h4>${annonce.user.firstName }
																${annonce.user.lastName }</h4>
															<p>
																Date d'incription : <strong>${annonce.user.dateInscription }</strong>
															</p>
														</div>
													</div>
													<br> <br>
													<div class="row">
														<div class="panel ">
															<div class="panel-heading">
																<h4 style="color: #B22222;">Activités</h4>
															</div>
															<div class="panel-body">
																<p>Annonces publiées : ${ nbreAnnonces}</p>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="panel ">
															<div class="panel-heading">
																<h4 style="color: #B22222;">Autres trajets proposés</h4>
															</div>
															<div class="panel-body">
																<h5>
																	<strong>Les 10 premiers trajets sur ${ nbreAnnonces}</strong>
																</h5>
																<br>
																<table class="table">
																	<c:forEach items="${annonces}" var="annonce">
																		<tr>
																			<td>${annonce.adresseDepart }-
																				${annonce.adresseArrivee }</td>
																			<td>${annonce.prix }€</td>
																			<td>${annonce.jourDepart }</td>
																		</tr>
																	</c:forEach>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">fermer</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>
