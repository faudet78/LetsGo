<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div style="height: 400px;"></div>
<div class="modal fade " id="myModal1" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel"
>
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"><a class=" close"
				href="<spring:url value="/annonces.html"></spring:url>"
			><span aria-hidden="true">&times;</span> </a>
				<h3 class="panel-heading modal-title" id="myModalLabel"
					style="color: #800000; font-weight: bold;" align="center"
				>Connectez-vous</h3></div>
			<div class="modal-body">
				<h4 colspan="2" style="color: red">
					<center>${message}</center>
				</h4>
				<form class="form-signin"
				action="<%=request.getContextPath()%>/j_spring_security_check"
				method="post"
			><label for=name " class="sr-only">Username</label> <input
					type="text" id="inputEmail" class="form-control" name="j_username"
					placeholder="Username" required autofocus
				> <label for="inputPassword" class="sr-only">Password</label> <input
					type="password" id="inputPassword" name="j_password"
					class="form-control" placeholder="Password" required
				>
					<div class="checkbox"><label> <input type="checkbox"
							value="remember-me"
						> Remember me
					</label></div>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Se
						connecter</button> <br> <label>Pas encore inscrit? <a
						style="color: blue;"
						href="<spring:url value="/annonces/inscription.html"></spring:url>"
					>Cliquez ici</a>
				</label></form>
		</div>
			<div class="modal-footer"></div>
	</div>
</div>
</div>
