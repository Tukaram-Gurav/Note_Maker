<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.hibernate.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Note</title>
<%@include file="include/all_css_js.jsp"%>
</head>
<body>
	<div class="container">
		<%@ include file="include/navbar.jsp"%>
		<br>
		<h1>Edit note details</h1>
		<%
			int id = Integer.parseInt(request.getParameter("note_id"));

			Configuration c = new Configuration();
			SessionFactory sf = c.configure().buildSessionFactory();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();

			Note note = (Note) s.get(Note.class, id);
		%>
		<form action="UPdate_Note_Servlet" method="post">
			<div class="form-group">
			<input value="<%=note.getId()%>" name="id" type="hidden">
				<label for="title">Note Title</label> <input type="text"
					name="title" required class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter title" 
					value="<%=note.getTitle() %>"/>

			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" name="content" required
					placeholder="Enter your content" class="form-control"
					style="height: 250px"
					><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>

		</form>
	</div>
</body>
</html>