<!doctype html>
<html lang="en">
<head>
<%@include file="include/all_css_js.jsp"%>
<title>Home Page</title>
</head>
<body>

	<div class="container-fluid p-0 m-0">
		<%@ include file="include/navbar.jsp"%>
  <div class="card py-3">
		<br>
		 <img class="img-fluid mx-auto" style="max-width:400px;"
			src="Images/notes.png" alt="Card image cap">
			<h1 class="text-primary text-uppercase text-center mt-3">start taking your notes</h1>
		<div class="container text-center">
			<a href="add_notes.jsp"><button class="btn btn-outline-primary text-center">sumbit</button></a>
		</div>
	</div>
</div>


</body>
</html>