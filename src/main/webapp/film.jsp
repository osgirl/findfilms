<html>

	<!-- jQuery -->
	<script src="./lib/jquery/jquery-2.1.3.min.js"></script>
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="./lib/bootstrap/css/bootstrap-theme.min.css">
	<script src="./lib/bootstrap/js/bootstrap.min.js"></script>
	<link href="./lib/bootstrap/docs.min.css" rel="stylesheet">
	
	<!-- Handlebars -->
	<script src="./lib/handlebars/handlebars-v3.0.0.js"></script>
	
	<!-- Datatables -->
	<script src="./lib/datatables/jquery.dataTables.min.js"></script>
	<script src="./lib/datatables/dataTables.bootstrap.js"></script>
	
	<!-- Font Awesome - For Additional Glyphicons -->
	<link rel="stylesheet"
		href="./lib/font-awesome/css/font-awesome.min.css">
	
	<!-- Custom Code -->
	<script src="./js/findfilms.js"></script>
	<link href="./css/custom.css" rel="stylesheet">
	
	
	<script id="table-template" type="text/x-handlebars-template">
	<h2 class="bs-docs-featurette-title">{{Title}}</h2>
	<table class="table lead">
		<tbody>
			{{#ifDefined Plot}}
				<tr>
       				<td>Plot</td>
        				<td>{{Plot}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Released}}
      			<tr>
        			<td>Released</td>
        			<td>{{Released}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Genre}}
      			<tr>
        			<td>Genre</td>
        			<td>{{Genre}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Runtime}}
      			<tr>
        			<td>Runtime</td>
        			<td>{{Runtime}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Year}}
      			<tr>
        			<td>Year</td>
        			<td>{{Year}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Actors}}
      			<tr>
        			<td>Actors</td>
        			<td>{{Actors}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined Awards}}
      			<tr>
        			<td>Awards</td>
        			<td>{{Awards}}</td>
      			</tr>
    		{{/ifDefined}}
			{{#ifDefined imdbRating}}
      			<tr>
        			<td>IMDB Rating</td>
        			<td>{{imdbRating}}</td>
      			</tr>
    		{{/ifDefined}}
    	</tbody>
  	</table>
	</script>
	
	<script language="javascript"> 
		$( document ).ready(function() {
			FindFilms.populateDetailsForId("<%=request.getParameter("id")%>");
		});
	</script> 

	<c:if test="${not empty param.searchTerm}" >
	   <script language="javascript">    
	   		$( document ).ready(function() {
		   		$('#backButton').attr("href", "./index.jsp?searchTerm=<%=request.getParameter("searchTerm")%>");
			});
	   </script> 
	</c:if>

	<body>
	
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-left" href="index.jsp" id="backButton">Back</a>
				<a class="navbar-brand" href="./index.jsp"><strong>FindFilms </strong><span class="glyphicon glyphicon-film"></span></a>
			</div>
		</div>
	</nav>
	
	<div class="bs-docs-featurette filmDetails">
		<div class="container" id="resultContent">
			Loading <img style='-webkit-user-select: none' src='./img/ajax-loader.gif'>							
		</div>
	</div>
	
	</body>
</html>
