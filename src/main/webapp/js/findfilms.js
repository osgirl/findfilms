var FindFilms = {};

var filmResult;

$(document).ready(
	function() {

		Handlebars.registerHelper('ifCond', function(v1, v2, options) {
			if (v1 === v2) {
				return options.fn(this);
			}
			return options.inverse(this);
		});
					
		Handlebars.registerHelper('ifDefined', function(v1, options) {
			if (v1 != "N/A") {
				return options.fn(this);
			}
			return options.inverse(this);
		});

		var typingTimer;
		var doneTypingInterval = 500;

		// Event for when the user types a new character in the filter box.
		$('#filmSearch').on("input", 
			function() {
				
				$('#result').empty();
				
				if ($('#filmSearch').val().length > 0) {
					spinnerHtml = "<img style='-webkit-user-select: none' src='./img/ajax-loader.gif'>";
					$('#result').html(spinnerHtml);
				}
				
				clearTimeout(typingTimer);
				typingTimer = setTimeout(FindFilms.searchFilms, doneTypingInterval);
			}
		);

		$('#myInput').keypress(function() {
			clearTimeout(typingTimer);
		});

		$('#searchButton').click(function() {
			FindFilms.searchFilms();
		});

		FindFilms.searchFilms = function(term) {

			var searchTerm = (term) ? term : $('#filmSearch').val();

			if (searchTerm.length > 1) {
	
				$.ajax(
					{
						method : "GET",
						url : "https://www.omdbapi.com/?s=*" + searchTerm + "*&y=&plot=short&r=json",
						success : function(response) {
							var source = $("#searchResultTableTemplate").html();
							filmResult = response;
							filmResult.searchTerm = encodeURIComponent(searchTerm);
							var template = Handlebars.compile(source);
							var html = template(filmResult);
							$('#result').empty();
							$('#result').html(html);

							$('.table').dataTable({
								"bPaginate" : true,
								"bLengthChange" : false,
								"bFilter" : false,
								"bInfo" : false,
								"bAutoWidth" : false,
								"fnDrawCallback" : function(oSettings) {
									if (oSettings._iDisplayLength >= oSettings.fnRecordsDisplay()) {
										$(oSettings.nTableWrapper).find('.dataTables_paginate').hide();
									}
							}
						});
					}
				});
			
			} else {
				$('#result').empty();
			}
		};
		
		FindFilms.populateDetailsForId = function(imdbId){ 
			
			$.ajax({
				method : "GET",
				url : "https://www.omdbapi.com/?i=" + imdbId + "&y=&plot=full&r=json",
				success : function(response) {
					var source = $("#table-template").html();
					filmResult = response;
					var template = Handlebars.compile(source);
					var html = template(filmResult);
					$('#resultContent').empty();
					$('#resultContent').html(html);
				}
			});
			
		};
		
		
	});