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
					<strong class="text-uppercase" style="color: white;">Rechercher un covoiturage</strong>
				</h4>
			</div>
			<div class="panel-body" style="background-color: #DCDCDC;"
				align="center">
				<form id="formChercherAnnonce" action='<spring:url value="/annonces/chercherAnnonce "></spring:url>' class="form-inline">
					<div class="form-group has-feedback ">
						<input id="adresseDepart" type="text" class="form-control" placeholder="Départ" value="${adresseD }" name="adresseD" /> 
						<i class="form-control-feedback ">
							<img width="20" style="margin-top: 7px;" height="20" alt="search" src="<%=request.getContextPath()%>/resources/images/map-marker-green.png">
						</i>
					</div>
					<span style="margin-left: 5px; margin-right: 5px;"
						class="glyphicon glyphicon-arrow-right"></span>
					<div class="form-group has-feedback ">
						<input type="text" class="form-control" id="adresseArrivee"
							placeholder="Arrivée" value="${adresseA }"
							name="adresseA" /> <i class="form-control-feedback "><img
							width="20" style="margin-top: 7px;" height="20" alt="search"
							src="<%=request.getContextPath()%>/resources/images/map-marker-red.png"></i>
					</div>
					<div class="form-group date input-group input-append date "
						id="datePicker">
						<input type="text" class="form-control" name="jourDepart" id="jourDepart"
							value="${jourDepart }" placeholder="Date de départ" /> <span
							class="input-group-addon add-on"><span
							class="glyphicon glyphicon-calendar "></span></span>
					</div>
					<div class=" form-group">
						<button type="submit" class="btn btn-large btn-success" id="sbtbtn"
							title="Saisissez les adresses">
							<span class="glyphicon glyphicon-chevron-right"></span> Chercher
						</button>
					</div>
				</form>
			</div>
		</div>
		<div style="height: 600px;">
		</div>
		
		
			</div>
</div>