<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title><spring:message code="message.resetPassword"></spring:message></title>
</head>
<body>
	<div class="container">
		<div class="col-md-7 col-md-offset-2" style="padding-top: 20px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<h3>Réinitialisez votre mot de passe</h3>
					</div>
				</div>
				<div class="panel-body">
					<div class="form-group col-md-8">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" value="" />
					</div>
					<div class="form-group">
						<button class="btn btn-primary" type="submit"
							onclick="resetPass()">Réinitialiser</button>
					</div>
					


				</div>
				<div class="panel-footer">
						Nouveau ?<a href="<c:url value="registration.html" />"><i>
								S'inscrire</i> </a>
						<a class="pull-right" href="<c:url value="login.html" />">Retour
							à la page de connexion </a>
					
				</div>

			</div>
			<div style="height: 100px;"></div>
		</div>
		
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
		function resetPass() {
			var email = $("#email").val();
			$
					.post(
							"<c:url value="/user/resetPassword"></c:url>",
							{
								email : email
							},
							function(data) {
								window.location.href = "<c:url value="/login.html"></c:url>"
										+ "?message=" + data.message;
							})
					.fail(
							function(data) {
								if (data.responseJSON.error
										.indexOf("MailError") > -1) {
									window.location.href = "<c:url value="/emailError.html"></c:url>";
								} else {
									window.location.href = "<c:url value="/login.html"></c:url>"
											+ "?message="
											+ data.responseJSON.message;
								}
							});
		}

		$(document).ajaxStart(function() {
			$("title").html("LOADING ...");
		});
	</script>
</body>

</html>