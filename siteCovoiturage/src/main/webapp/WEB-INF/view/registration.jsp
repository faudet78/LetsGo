<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/ladda.min.css">

<link rel="stylesheet"
	href="../../resources/files/css/bootstrap.min.css">
<style>
.password-verdict {
	color: #000;
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value="/resources/js/pwstrength.js" />"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/spin.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/ladda.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="label.form.title"></spring:message></title>
</head>
<body>
	<div class="container">
		<div class="col-md-7 col-md-offset-2" style="padding-top: 20px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<h3>Veuillez entrer vos informations</h3>
					</div>

				</div>
				<div class="panel-body">
					<form action="/" method="POST" enctype="utf8"
						class="form-horizontal col-md-6 col-md-offset-3">

						<div class="form-group">
							<div class="col-md-12">
								<input name="firstName" value="" class="form-control "
									required placeholder="Prénom" /> <span id="firstNameError"
									class="alert alert-danger col-sm-4" style="display: none"></span>

							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control " name="lastName" value=""
									required placeholder="Nom" /><span id="lastNameError"
									class="alert alert-danger col-sm-4" style="display: none"></span>

							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input type="email" class="form-control " name="email"
									value="" required placeholder="Email" /> <span id="emailError"
									class="alert alert-danger col-sm-4" style="display: none"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input id="password" class="form-control "
									name="password" value="" type="password" required
									placeholder="Mot de passe" /><span id="passwordError"
									class="alert alert-danger col-sm-4" style="display: none"></span>
							</div>
						</div>
						<div class="form-group ">
							<div class="col-md-12">
								<input id="matchPassword" class="form-control "
									name="matchingPassword" value="" type="password" required
									placeholder="Confirmation mot de passe" /><span
									id="globalError" class="alert alert-danger col-md-12"
									style="display: none"></span>
							</div>
						</div>
						<br>
						<button type="submit" class="btn btn-primary ladda-button "
							data-style="expand-right" data-size="s" data-color="green">
							<spring:message code="label.form.register"></spring:message>
						</button>
					</form>
					<div style="height: 100px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('form').submit(function(event) {
								register(event);
							});
							Ladda.bind('button', {
								callback : function(instance) {
									var progress = 0;
									var interval = setInterval(function() {
										progress = Math.min(progress
												+ Math.random() * 0.1, 1);
										instance.setProgress(progress);

										if (progress === 1) {
											instance.stop();
											clearInterval(interval);
										}
									}, 600);
								}
							});
							$(":password")
									.keyup(
											function() {
												if ($("#password").val() != $(
														"#matchPassword").val()) {
													$("#globalError")
															.show()
															.html(
																	'<spring:message code="PasswordMatches.user"></spring:message>');
												} else {
													$("#globalError").html("")
															.hide();
												}
											});

							options = {
								common : {
									minChar : 8
								},
								ui : {
									showVerdictsInsideProgressBar : true,
									scores : [ 17, 26, 40, 50 ],
									verdicts : [ "Faible", "Normale", "Moyen",
											"Fort", "Très Fort" ],
									showverdicts : true,
									showErrors : true,
									errorMessages : {
										wordLength : '<spring:message code="error.wordLength"/>',
										wordNotEmail : '<spring:message code="error.wordNotEmail"/>',
										wordSequences : '<spring:message code="error.wordSequences"/>',
										wordLowercase : '<spring:message code="error.wordLowercase"/>',
										wordUppercase : '<spring:message code="error.wordUppercase"/>',
										wordOneNumber : '<spring:message code="error.wordOneNumber"/>',
										wordOneSpecialChar : '<spring:message code="error.wordOneSpecialChar"/>'
									}
								}
							};
							$('#password').pwstrength(options);
						});

		function register(event) {
			event.preventDefault();
			$(".alert").html("").hide();
			$(".error-list").html("");
			if ($("#password").val() != $("#matchPassword").val()) {
				$("#globalError")
						.show()
						.html(
								'<spring:message code="PasswordMatches.user"></spring:message>');
				return;
			}
			var formData = $('form').serialize();
			$
					.post(
							"<c:url value="/user/registration"/>",
							formData,
							function(data) {
								if (data.message == "success") {
									window.location.href = "<c:url value="/successRegister.html"></c:url>";
								}

							})
					.fail(
							function(data) {
								if (data.responseJSON.error
										.indexOf("MailError") > -1) {
									window.location.href = "<c:url value="/emailError.html"></c:url>";
								} else if (data.responseJSON.error == "UserAlreadyExist") {
									$("#emailError").show().html(
											data.responseJSON.message);
								} else if (data.responseJSON.error
										.indexOf("InternalError") > -1) {
									window.location.href = "<c:url value="/login.html"></c:url>"
											+ "?message="
											+ data.responseJSON.message;
								} else {
									var errors = $
											.parseJSON(data.responseJSON.message);
									$.each(errors, function(index, item) {
										$("#" + item.field + "Error").show()
												.html(item.defaultMessage);
									});
									errors = $
											.parseJSON(data.responseJSON.error);
									$.each(errors, function(index, item) {
										$("#globalError").show().append(
												item.defaultMessage + "<br>");
									});
								}
							});
		}
	</script>
</body>

</html>