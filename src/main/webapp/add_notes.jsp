<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="include/all_css_js.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Notes</title>
</head>
<body>
	<div class="container">
		<%@ include file="include/navbar.jsp"%>
		<br>
		<h1>Please fill your note details</h1>
		<!--Add Form here  -->
		<form action="Save_note_Servlet" method="post">
			<div class="form-group">
				<label for="title" >Note Title</label> <input type="text" name="title" required
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter title">

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" name="content" required placeholder="Enter your content"
					class="form-control" style="height: 250px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>

		</form>

	</div>

</body>
</html>