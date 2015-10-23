<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/files/css/bootstrap.min.css">
	<style>
	.modal{
    display: block !important; /* I added this to see the modal, you don't need this */
}
  
/* Important part */
.modal-dialog{
    overflow-y: initial !important
}
.modal-body{
    height: 510px;
    overflow-y: auto;
}
	
	</style>
<div style="height: 400px;" ></div>
<form:form commandName="user"
				cssClass="form-horizontal registrationForm col-sm-6 col-sm-offset-3">
				<div class="modal fade " id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<a class=" close"   href="<spring:url value="/annonces.html"></spring:url>"><span aria-hidden="true">&times;</span>
								</a>
								
								<h3 class="panel-heading modal-title" id="myModalLabel"
									style="color: #800000; font-weight: bold;" align="center">Vos
									informations</h3>
							</div>
							<div class="modal-body">

								<div class="panel-body">


									<div class="form-group">


										<form:select path="sex" cssClass="form-control">

											<form:option value="Madame" label="Madame"></form:option>
											<form:option value="Monsieur" label="Monsieur"></form:option>
											<form:option value="Mademoiselle" label="Mademoiselle"></form:option>
										</form:select>
									</div>
									<div class="form-group">
										<label for="firstName" class="control-label">Prénom(s)
											<strong style="color: red">* </strong>
					 					</label>

										<form:input path="firstName" cssClass="form-control" />
										<form:errors path="firstName"></form:errors>

									</div>
									<div class="form-group">

										<label for="lastName" class="control-label">Nom(s) <strong
											style="color: red">* </strong></label>
										<form:input path="lastName" cssClass="form-control" />
										<form:errors path="lastName"></form:errors>
									</div>
									<div class="form-group ">
										<label for="email" class="control-label">Adresse
											e-mail <strong style="color: red">* </strong>
										</label>
										<form:input path="email" cssClass="form-control" />
										<form:errors path="email"></form:errors>
									</div>
									<div class="form-group">
										<label for="adresse" class="control-label">Téléphone
											portable <strong style="color: red">* </strong>
										</label>
										<form:input path="phoneNumber" cssClass="form-control" />
										<form:errors path="phoneNumber"></form:errors>
									</div>


									<div class="form-group">
										<label for="username" class="control-label">Username <strong
											style="color: red">* </strong></label>
										<form:input path="username" cssClass="form-control" />
										<form:errors path="username"></form:errors>
									</div>

									<div class="form-group ">
										<label for="password" class="control-label">Mot de
											passe <strong style="color: red">* </strong>
										</label>
										<form:password path="password" cssClass="form-control" />
										<form:errors path="password" style="color: red"></form:errors>
									</div>
									<div class="form-group">
										<label for="password" class="control-label">Confirmez
											le mot de passe <strong style="color: red">* </strong>
										</label> <input type="Password" name="password_again"
											id="password_again" class="form-control">


									</div>

									<div class="form-group ">
										<label for="details"><strong style="color: red">*
										</strong> : <i>champ obligatoire</i></label>

									</div>
									<div class="form-group form">
										<button type="submit" class="btn btn-lg btn-primary ">
											<span class="glyphicon glyphicon-plus"></span> S'incrire
										</button>
										<a class="btn btn-default btn-lg "   href="<spring:url value="/annonces.html"></spring:url>">Close</a>

									</div>




								</div>






							</div>



						</div>
						
					</div>
				</div>
			</form:form>
			

