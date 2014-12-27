<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PHP, jQuery search demo</title>
 <link href="resources/css/search.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="resources/js/jquery-1.11.2.js"></script>
<script type="text/javascript">
 
$(function() {
 
    $(".search_button").click(function() {
        // getting the value that user typed
        var searchString    = $("#search_box").val();
        // forming the queryString
        var data            = 'search='+ searchString;
         
        // if searchString is not empty
        if(searchString) {
            // ajax call
            $.ajax({
                type: "POST",
                url: "do_search.php",
                data: data,
                beforeSend: function(html) { // this happens before actual call
                    $("#results").html(''); 
                    $("#searchresults").show();
                    $(".word").html(searchString);
               },
               success: function(html){ // this happens after we get results
                    $("#results").show();
                    $("#results").append(html);
              }
            });    
        }
        return false;
    });
});
</script>
 
</head>
<body>
<div id="container">
<div style="margin:20px auto; text-align: center;">
<form method="post" action="do_search.php">
    <input type="text" name="search" id="search_box" class='search_box'/>
    <input type="submit" value="Search" class="search_button" /><br />
</form>
</div>      
<div>
 
<div id="searchresults">Search results :</div>
<ul id="results" class="update">
</ul>
 
</div>
</div>
   
</body>
</html>
<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<link href="resources/css/search.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="resources/js/jquery-1.11.2.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700|Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<!--//webfonts-->
<script>
$(document).ready(function(){ 
	
	// Add the value of "Search..." to the input field and a class of .empty
	$("#search").val("Search...").addClass("empty");
	
	// When you click on #search
	$("#search").focus(function(){
		
		// If the value is equal to "Search..."
		if($(this).val() == "Search...") {
			// remove all the text and the class of .empty
			$(this).val("").removeClass("empty");;
		}
		
	});
	
	// When the focus on #search is lost
	$("#search").blur(function(){
		
		// If the input field is empty
		if($(this).val() == "") {
			// Add the text "Search..." and a class of .empty
			$(this).val("Search...").addClass("empty");	
		}
		
	});

});
</script>
<title>Home - Multi Search</title>
</head>
<body>
<h1>Search on Cloud</h1>

<form action="" id="search-form">
    <fieldset>
        <input type="text" id="search" name="search" />
        <input type="submit" id="search-submit" value="" />
    </fieldset>
</form>
</body>
</html> --%>