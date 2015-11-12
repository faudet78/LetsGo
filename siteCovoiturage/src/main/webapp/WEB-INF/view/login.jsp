<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />

<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<title><spring:message code="label.pages.home.title"></spring:message></title>
<script type="text/javascript">
	function validate() {
		if (document.f.j_username.value == ""
				&& document.f.j_password.value == "") {
			alert("${noUser} & ${noPass}");
			document.f.j_username.focus();
			return false;
		}
		if (document.f.j_username.value == "") {
			alert("${noUser}");
			document.f.j_username.focus();
			return false;
		}
		if (document.f.j_password.value == "") {
			alert("${noPass}");
			document.f.j_password.focus();
			return false;
		}
	}
</script>
<style type="text/css">
.wrapper {
	width: 500px;
	margin-left: auto;
	margin-right: auto
}

label {
	padding-left: 0 !important
}
</style>
</head>
<body>
	<c:if test="${param.message != null}">
		<div class="alert alert-info">${param.message}</div>
	</c:if>

	<div class="container">
		<div class="col-md-7 col-md-offset-2" style="padding-top: 20px;">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">
						<h3>Connectez-vous</h3>
					</div>

				</div>
				<div class="panel-body">
					<c:if test="${param.error != null}">
						<c:choose>
							<c:when
								test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.disabled"></spring:message>
								</div>
							</c:when>
							<c:when
								test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User account has expired'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.expired"></spring:message>
								</div>
							</c:when>
							<c:when
								test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'blocked'}">
								<div class="alert alert-danger">
									<spring:message code="auth.message.blocked"></spring:message>
								</div>
							</c:when>
							<c:otherwise>
								<div class="alert alert-danger">
									<!-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> -->
									<spring:message code="message.badCredentials"></spring:message>
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
					<form name='f' action="j_spring_security_check" method='POST'
						class="form-horizontal col-md-6 col-md-offset-3"
						onsubmit="return validate();">
						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control" type='text' name='j_username'
									value=''  placeholder="Email" required   >
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<input class="form-control" type='password' name='j_password'
									placeholder="Mot de passe" required oninvalid="this.setCustomValidity('Mot de passe obligatoire')" />
							</div>
						</div>
						<input class="btn btn-primary" name="submit" type="submit"
							value=<spring:message code="label.form.submit"></spring:message> />
					</form>

					<div class="col-md-7 col-md-offset-3"
						style="padding-top: 5px; padding-bottom: 5px;">
						Nouveau ?<a href="<c:url value="registration.html" />"><i>
								S'inscrire</i> </a>
					</div>
					<div class="col-md-8 col-md-offset-3">
						Mot de passe oublié? <a
							href="<c:url value="/forgetPassword.html" />"><i>Réinitialiser
								votre mot de passe</i></a>
					</div>


				</div>
				<div style="height: 50px;"></div>
			</div>
		</div>
	</div>
</body>

</html>