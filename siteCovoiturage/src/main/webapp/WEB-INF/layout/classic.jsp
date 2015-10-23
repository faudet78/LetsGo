
<%@include file="../layout/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
/* Adjust the height of section */
#profileForm .content {
	min-height: 100px;
}

.tooltip-inner {
	max-width: 350px;
	/* If max-width does not work, try using width instead */
	width: 350px;
}

#profileForm .content>.body {
	width: 100%;
	height: auto;
	padding: 15px;
	position: relative;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
	margin: 0 auto;
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin .checkbox {
	font-weight: normal;
}

.form-signin .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}

.form-signin .form-control:focus {
	z-index: 2;
}

.form-signin input[type="email"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style2.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style1.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/jquery.steps.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/style.css">

<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
<link rel="stylesheet" href="../../resources/files/css/style2.css">
<link rel="stylesheet" href="../../resources/files/css/style1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.steps.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<!--jquery js autocomplete  -->

<%-- <script type="text/javascript"
	src="https://<a href="http://www.jqueryscript.net/tags.php?/map/">map</a>s.googleapis.com/maps/api/js?sensor=true&libraries=places"></script> --%>
<title><tiles:getAsString name="title"></tiles:getAsString></title>
</head>
<body>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<security:authorize access="!isAuthenticated()">
					<h5 class="pull-right">
						<a style="color: black;"
							href="<spring:url value="/annonces/login.html"></spring:url>"><span
							class="glyphicon glyphicon-log-in"></span> Connexion</a> | <a
							style="color: black;"
							href="<spring:url value="/annonces/inscription.html"></spring:url>"><span
							class="glyphicon glyphicon-registration-mark"></span> Inscription</a>

					</h5>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<h5 class="pull-right">
						<a style="color: black;" href="#"><span class="glyphicon "></span>
							Bonjour ${user } </a> | <a style="color: black;"
							href="<spring:url value="/logout"></spring:url>"><span
							class="glyphicon glyphicon-log-out"></span> Se deconnecter</a>
					</h5>
				</security:authorize>
				<br>
			</div>
			<div class="">
				<a href="#"><img alt=""
					src="<%=request.getContextPath()%>/resources/images/banniere.gif"></a>
			</div>
			<div id='cssmenu'>
				<ul>
					<li><a href="<spring:url value="/annonces.html"></spring:url>"><span>Accueil</span></a></li>
					<li class='active has-sub'><a href='#'><span>Assistance</span></a>
						<ul>
							<li class='has-sub'><a href='#'><span>Assistance1</span></a>
							<li class='has-sub'><a href='#'><span>Assistance2</span></a>
							</li>
						</ul>
					<li><a
						href="<spring:url value="/annonces/posterAnnonce.html"></spring:url>"><span>Publier
								votre annonce</span></a></li>
				</ul>
			</div>

			<!--Formulaire de connexion  -->










			<tiles:insertAttribute name="body"></tiles:insertAttribute>

			<div class="footer  col-sm-12 panel-footer">
				<tiles:insertAttribute name="footer"></tiles:insertAttribute>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(
				function() {
					$(window).load(function() {
						$('#myModal').modal('show');
					});
					$(window).load(function() {
						$('#myModal1').modal('show');
					});

					$('.field input').keyup(
							function() {

								var empty = false;
								$('.field input').each(function() {
									if ($(this).val().length == 0) {
										empty = true;
									}
								});

								if (empty) {
									$('.actions button').attr('disabled',
											'disabled');
								} else {
									$('.actions button')
											.attr('disabled', false).attr(
													'title', '');
								}
							});

					$('#dateRangePicker').datepicker({
						format : 'dd/mm/yyyy',
						startDate : '01/01/2010',
						endDate : '12/30/2020'
					});
					

				});
		$('.registrationForm')
				.validate(
						{
							rules : {

								firstName : {
									required : true,
									minlength : 1

								},
								lastName : {
									required : true,
									minlength : 1

								},
								email : {
									required : true,
									email : true

								},
								username : {
									required : true,
									minlength : 1,
									remote : {
										url : "<spring:url value='/annonces/available' />",
										type : "get",
										data : {
											username : function() {
												return $("#username").val();

											}

										}

									}

								},
								password : {
									required : true,
									minlength : 1

								},
								phoneNumber : {
									required : true,
									minlength : 1

								},
								password_again : {
									required : true,
									minlength : 1,
									equalTo : "#password"
								}

							},
							highlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-success').addClass('has-error');

							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error').addClass('has-success');

							},
							messages : {

								firstName : "Veuillez saisir un prénom!",
								lastName : "Veuillez saisir un nom de famille!",
								email : {
									required : "Veuillez saisir une adresse email!",
									email : "L'adresse email que vous avez saisie est invalide!"
								},
								username : {
									remote : "Un compte avec cet identifiant existe dejà!",
									required : "Veuillez saisir un idientifiant!"

								},
								phoneNumber : "Veuillez saisir un numero de telephone!",
								password : "Veuillez saisir un mot de passe!",
								password_again : {
									required : "Veuillez confirmer votre mot de passe!",
									equalTo : "Les mots de passes ne correspondent pas!"
								}

							}
						});
	</script>
</body>
</html>