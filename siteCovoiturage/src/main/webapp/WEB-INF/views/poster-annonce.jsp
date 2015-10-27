<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">

<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&libraries=places"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.placepicker.js"></script>


<div class="">
	<div class="panel-heading"
		style="background-color: #d9edf7; border-color: #ddd;">
		<h3 style="color: #800000; font-weight: bold;" align="center">PUBLIER
			UNE ANNONCE</h3>
		<h5 align="center">Publiez en une minute votre annonce de
			covoiturage</h5>
	</div>
	<div class="panel-body">
		<form:form id="annonceForm" modelAttribute="annonce"
			enctype="multipart/form-data"
			cssClass="form-horizontal registrationForm">
			<c:if test="${success eq true }">
				<div class="alert alert-success">
					<h4 align="center">Votre annonce a été créée avec succès</h4>
				</div>
			</c:if>
			<h3>TRAJET</h3>
			<fieldset>
				<h5>
					<strong>Départ</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group">
						<label for="adresseDepart"
							class="control-label col-sm-3 col-sm-offset-2">Ville de
							départ <strong style="color: red">*</strong>
						</label>
						<div class="col-sm-3 has-feedback">
							<form:input path="adresseDepart"
								cssClass="form-control placepicker"
								placeholder="Exemple : Paris" />
							<i class="form-control-feedback"> <img width="20"
								style="margin-top: 7px;" height="20" alt="search"
								src="<%=request.getContextPath()%>/resources/images/map-marker-green.png">
							</i>
							<form:errors path="adresseDepart"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="lieuDepart"
							class="control-label col-sm-3 col-sm-offset-2">Lieu de
							départ</label>
						<div class="col-sm-3">
							<form:input path="lieuDepart" cssClass="form-control"
								placeholder="Lieu de départ" data-toggle="tooltip"
								data-placement="right"
								title="Indiquer un lieu de départ, pour donner plus de précisions à vos passagers" />
							<form:errors path="lieuDepart"></form:errors>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3 col-sm-offset-2">Date
							et heure de départ <strong style="color: red">*</strong>
						</label>
						<div class="col-sm-2">
							<div id="datePicker"
								class="form-group input-group input-append field date">
								<form:input path="jourDepart" cssClass="form-control"
									placeholder="JJ/MM/AAAA" />
								<span class="input-group-addon add-on"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-group input-group input-append field date">
								<form:input path="heureDepart" cssClass="form-control"
									placeholder="HH:MM" id="heurePicker" />
								<span class="input-group-addon add-on"> <span
									class="glyphicon glyphicon-time"></span>
								</span>
							</div>
						</div>
					</div>
				</div>
				<h5>
					<strong>Arrivée</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group has-feedback">
						<label for="adresseArrivee"
							class="control-label col-sm-3 col-sm-offset-2 ">Ville
							d'arrivée <strong style="color: red">*</strong>
						</label>
						<div class="col-sm-3">
							<form:input path="adresseArrivee"
								cssClass="form-control placepicker"
								placeholder="Exemple : Marseille" />
							<i class="form-control-feedback"> <img width="20"
								style="margin-top: 7px;" height="20" alt="search"
								src="<%=request.getContextPath()%>/resources/images/map-marker-red.png">
							</i>
							<form:errors path="adresseArrivee"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="lieuDArrivee"
							class="control-label col-sm-3 col-sm-offset-2">Lieu
							d'arrivée</label>
						<div class="col-sm-3">
							<form:input path="lieuDepart" cssClass="form-control"
								placeholder="Lieu d'arrivée" data-toggle="tooltip"
								data-placement="right"
								title="Indiquer un lieu d'arrivée, pour donner plus de précisions à vos passagers" />
							<form:errors path="lieuDepart"></form:errors>
						</div>
					</div>
				</div>
			</fieldset>
			<h3>INFORMATIONS</h3>
			<fieldset>
				<h5>
					<strong>Places proposées</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group">
						<label for="nbrePersonnes"
							class="control-label col-sm-3 col-sm-offset-2">A combien
							partez-vous ? <strong style="color: red">*</strong>
						</label>
						<div class="col-sm-2">
							<form:select path="nbrePersonnes" cssClass="form-control">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
							</form:select>
							<form:errors path="nbrePersonnes"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="placeProposees"
							class="control-label col-sm-3 col-sm-offset-2">Combien de
							places proposez-vous ? <strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2">
							<form:select path="placeProposees" cssClass="form-control">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option selected="selected" value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
							</form:select>
							<form:errors path="placeProposees"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="nbreSacs"
							class="control-label col-sm-3 col-sm-offset-2">Nombre de
							valises / sacs de voyage acceptés au total ?</label>
						<div class="col-sm-2">
							<form:select path="nbreSacs" cssClass="form-control">
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option selected="selected" value="3">3</form:option>
								<form:option value="4">4</form:option>
								<form:option value="5">5</form:option>
								<form:option value="6">6</form:option>
								<form:option value="7">7</form:option>
							</form:select>
							<form:errors path="nbreSacs"></form:errors>
						</div>
					</div>
				</div>
				<h5>
					<strong>Prix par place</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group">
						<label for="prix" class="control-label col-sm-3 col-sm-offset-2 ">Prix
							demandé ( € ) <strong style="color: red">*</strong>
						</label>
						<div class="col-sm-2 ">
							<form:input path="prix" cssClass="form-control" value="25" />
							<form:errors path="prix"></form:errors>
						</div>
					</div>
				</div>
				<h5>
					<strong>Details sur le trajet</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group">
						<label for="prix" class="control-label col-sm-3 col-sm-offset-2 ">Veuillez
							ajouter plus de détails sur votre trajet. Cela vous évitera
							beaucoup de questions de vos passagers. </label>
						<div class="col-sm-4 ">
							<form:textarea path="details" cssClass="form-control" cols="50"
								data-toggle="tooltip" data-placement="right"
								title="Assurez-vous que vos passagers aient toutes les informations nécessaires à disposition, afin qu'ils vous posent moins de questions sur le trajet."
								placeholder="Exemple : “je partirai de la Porte d'Orléans à 10h. Il y a de la place pour une petite valise par personne !”"
								rows="4" />
							<form:errors path="details"></form:errors>
						</div>
					</div>
				</div>
			</fieldset>
			<h3>DETAILS VEHICULE</h3>
			<fieldset>
				<h5>
					<strong>Détails concernant le véhicule</strong>
				</h5>
				<div class="thumbnail"
					style="background-color: #F5F5F5; padding-top: 15px;">
					<div class="form-group">
						<label for="adresseDepart"
							class="control-label col-sm-3 col-sm-offset-2">Marque<strong
							style="color: red"> *</strong>
						</label>
						<div class="col-sm-3 has-feedback">
							<form:input path="vehicule" cssClass="form-control"
								placeholder="Exemple: Renault Clio 2" data-toggle="tooltip"
								data-placement="right"
								title="Indiquer une marque de véhicule, pour donner plus de précisions à vos passagers" />
							<form:errors path="vehicule"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="model" class="control-label col-sm-3 col-sm-offset-2">Modèle<strong
							style="color: red"> *</strong>
						</label>
						<div class="col-sm-3 has-feedback">
							<form:input path="model" cssClass="form-control"
								placeholder="Exemple: Classe C" data-toggle="tooltip"
								data-placement="right"
								title="Indiquer une marque de véhicule, pour donner plus de précisions à vos passagers" />
							<form:errors path="model"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="nbrePortes"
							class="control-label col-sm-3 col-sm-offset-2">Nombre de
							portes<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2">
							<form:select path="nbrePortes" cssClass="form-control">
								<form:option value="2">2</form:option>
								<form:option value="4">4</form:option>
							</form:select>
							<form:errors path="nbrePortes"></form:errors>
						</div>
					</div>
					<div class="form-group ">
						<label for="climatisation"
							class="control-label col-sm-3 col-sm-offset-2">Votre
							véhicule est il climatisé?<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2 ">
							<form:errors path="climatisation"></form:errors>


							<label class="radio-inline"><form:radiobutton
									path="climatisation" value="0" /> Non </label> <label
								class="radio-inline"> <form:radiobutton
									path="climatisation" value="1" /> Oui
							</label>
						</div>
					</div>
					<div class="form-group ">
						<label for="hasMusic"
							class="control-label col-sm-3 col-sm-offset-2">Ecoutez-vous
							de la musique?<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2 ">



							<label class="radio-inline"><form:radiobutton
									path="hasMusic" value="0" /> Non </label> <label class="radio-inline">
								<form:radiobutton path="hasMusic" value="1" /> Oui
							</label>
							<form:errors path="hasMusic"></form:errors>
						</div>
					</div>
					<div class="form-group ">
						<label for="animauxActive"
							class="control-label col-sm-3 col-sm-offset-2">Animaux
							autorisés<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2 ">
							<form:errors path="animauxActive"></form:errors>


							<label class="radio-inline"><form:radiobutton
									path="animauxActive" value="0" /> Non </label> <label
								class="radio-inline"> <form:radiobutton
									path="animauxActive" value="1" /> Oui
							</label>
						</div>
					</div>
					<div class="form-group ">
						<label for="fumeurActive"
							class="control-label col-sm-3 col-sm-offset-2">Autorisation
							de fumer?<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-2 ">
							<form:errors path="fumeurActive"></form:errors>
							<label class="radio-inline"><form:radiobutton
									path="fumeurActive" value="0" /> Non </label> <label
								class="radio-inline"> <form:radiobutton
									path="fumeurActive" value="1" /> Oui
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="model" class="control-label col-sm-3 col-sm-offset-2">Télécharger
							une photo<strong style="color: red"> *</strong>
						</label>
						<div class="col-sm-3 has-feedback">
							<input type="file" value="photo" data-toggle="tooltip"
								name="file" data-placement="right"
								title="Télécharger une photo, pour donner plus de précisions à vos passagers">
							<form:errors path="model"></form:errors>
						</div>
					</div>


				</div>

			</fieldset>







			<h3>VALIDATION</h3>
			<fieldset>
				<legend>Terms and Conditions</legend>
				<input id="acceptTerms-2" name="acceptTerms" type="checkbox"
					class="required"> <label for="acceptTerms-2">I
					agree with the Terms and Conditions.</label>
				<button type="submit" class="btn btn-lg">publier</button>
			</fieldset>
		</form:form>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$(".placepicker").placepicker();
		$('[data-toggle="tooltip"]').tooltip();
	});

	var form = $("#annonceForm").show();

	form.steps(
			{
				headerTag : "h3",
				bodyTag : "fieldset",
				transitionEffect : "slideLeft",
				onStepChanging : function(event, currentIndex, newIndex) {
					// Allways allow previous action even if the current form is not valid!
					if (currentIndex > newIndex) {
						return true;
					}
					// Forbid next action on "Warning" step if the user is to young
					if (newIndex === 3 && Number($("#age-2").val()) < 18) {
						return false;
					}
					// Needed in some cases if the user went back (clean up)
					if (currentIndex < newIndex) {
						// To remove error styles
						form.find(".body:eq(" + newIndex + ") label.error")
								.remove();
						form.find(".body:eq(" + newIndex + ") .error")
								.removeClass("error");
					}
					form.validate().settings.ignore = ":disabled,:hidden";
					return form.valid();
				},
				onStepChanged : function(event, currentIndex, priorIndex) {
					// Used to skip the "Warning" step if the user is old enough.
					if (currentIndex === 2 && Number($("#age-2").val()) >= 18) {
						form.steps("next");
					}
					// Used to skip the "Warning" step if the user is old enough and wants to the previous step.
					if (currentIndex === 2 && priorIndex === 3) {
						form.steps("previous");
					}
				},
				onFinishing : function(event, currentIndex) {
					form.validate().settings.ignore = ":disabled";
					return form.valid();
				},
				onFinished : function(event, currentIndex) {
					form.submit();
					alert("Submitted!");
				},
				labels : {
					cancel : "Cancel",
					current : "current step:",
					pagination : "Pagination",
					finish : "Publier",
					next : "Suivant",
					previous : "Précédent",
					loading : "Loading ..."
				}

			}).validate({
		errorPlacement : function errorPlacement(error, element) {
			element.before(error);
		},
		rules : {
			confirm : {
				equalTo : "#password-2"
			}
		}
	});
</script>
