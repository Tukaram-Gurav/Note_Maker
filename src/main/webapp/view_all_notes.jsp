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
<title>View All Notes</title>
<%@include file="include/all_css_js.jsp"%>
</head>
<body>

 
	<div class="container"> 
		<%@ include file="include/navbar.jsp"%>
		<h1 class="text-uppercase">All Notes</h1><div class="btn-group" >
  <button type="button"  class="btn btn-secondary dropdown-toggle my-2 my-sm-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   sort by
  </button>
  <div class="dropdown-menu dropdown-menu-right">
   <a href="By_nameservlet"> <button  name="byname"  class="dropdown-item" type="button"> name</button></a>
   <a href="By_nameservlet"> <button name="byprice" class="dropdown-item" type="button">price</button></a>
    <a href="By_nameservlet"><button name="bydate"  class="dropdown-item" type="button">added date</button></a>
  </div>
</div>
		
		<div class="row">
			<div class="col-12">
				<%
					Configuration c = new Configuration();
					SessionFactory sf = c.configure().buildSessionFactory();
					Session s = sf.openSession();

					String name_item=request.getParameter("item_name");
					String price_item=request.getParameter("item_price");
					String date_item=request.getParameter("item_date");
					
					String value=request.getParameter("item1");
					Query q = s.createQuery("from Note"); 
					List<Note> list = q.list();
					for (Note note : list) {
				%>
				<div class="card mt-3 py-3">
					<img class="card-img-top  mx-auto" style="max-width: 100px;"
						src="Images/notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text "><%=note.getContent()%>
						<p class="text-primary"><b> <%=note.getAddDate() %></b></p>
						</p>
						<div class="container text-center">
							<a href="Delete_Sevlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> 
								<a href="Update_Note.jsp?note_id=<%=note.getId()%>"class="btn btn-primary">Update</a>

						</div>
					</div>
				</div>




				<%
					}
					s.close();
				%>

			</div>
		</div>


	</div>
</body>
</html>