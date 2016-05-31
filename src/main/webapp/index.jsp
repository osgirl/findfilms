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

<c:if test="${not empty param.searchTerm}">
	<script language="javascript">    
		$( document ).ready(function() {
			
			<%
			//Logic to determine whether we need to repopulate the search results based on users last query.
			String searchParameter = request.getParameter("searchTerm");
			boolean searchParameterDefined = (searchParameter != null && !searchParameter.isEmpty()) ? true : false;
			%>
	   
	   		if (<%=searchParameterDefined%>) {
		   		
	   			FindFilms.searchFilms('<%=searchParameter%>');
		   		
	   			//The search term is returned as a URL encoded value, decode this so it makes sense for the user.
		   		decodedSearchTerm = decodeURIComponent('<%=searchParameter%>');
		   		$('#filmSearch').val(decodedSearchTerm);
		   		
			}

		});
	</script>
</c:if>

<script id="searchResultTableTemplate" type="text/x-handlebars-template">
	{{#ifCond Response "False"}}
		<div class="alert alert-warning lead" role="alert">I couldn't find anything, try again!</div>
	{{else}}
		<table class="table table-hover lead">
      		<thead>
        		<tr>
          			<th>Title</th>
          			<th>Year</th>
          			<th>Type</th>
					<th></th>
        		</tr>
      		</thead>
      		<tbody>
				{{#each Search}}
        			<tr>
          				<td>{{Title}}</td>
          				<td>{{Year}}</td>
          				<td>
							{{#ifCond Type "movie"}}
								<i class="fa fa-film"></i> Film
							{{else}}
								<i class="fa fa-desktop"></i> TV Series
							{{/ifCond}}
						</td>
          				<td>
							<a class="btn btn-large btn-info" href="./film.jsp?id={{imdbID}}&searchTerm={{../searchTerm}}">More Info</a>
						</td>
					</tr>
				{{/each}}
			</tbody>
		</table>
	{{/ifCond}}
</script>

	<body>

		<main class="bs-docs-masthead" id="content" role="main" tabindex="-1">
		<div class="container">
			<span class="bs-docs-booticon bs-docs-booticon-lg bs-docs-booticon-outline glyphicon glyphicon-film"></span>
			<p class="lead">FindFilms is a free service where you can search and explore your favourite films with ease.</p>
		</div>
		</main>

		<div class="bs-docs-featurette">
			<div class="container">
				<h2 class="bs-docs-featurette-title">Find your films, now.</h2>
				<p class="lead">Type your search term below. We'll do some research and get back to you with all the Films and TV Shows we could find. Want more information? Click on 'More Information' for a detailed description such as the Plot, IMDB Rating and Genre.</p>
	
				<div class="input-group lead">
					<input id="filmSearch" type="text" class="form-control" placeholder="Search for..."> 
						<span class="input-group-btn">
							<button id="searchButton" class="btn btn-default" type="button">Search</button>
						</span>
				</div>

				<div id="result"></div>

			</div>
		</div>

	</body>
</html>
