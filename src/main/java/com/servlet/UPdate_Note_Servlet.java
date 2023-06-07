package com.servlet;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import com.entities.Note;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UPdate_Note_Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id=Integer.parseInt(request.getParameter("id"));
		String title=request.getParameter("title");
		String Content=request.getParameter("content");
		
		Configuration c=new Configuration();
		SessionFactory sf=c.configure().buildSessionFactory();
		Session s=sf.openSession();
		Transaction tx=s.beginTransaction();
		Note note=(Note) s.get(Note.class, id);
		note.setId(id);
		note.setTitle(title);
		note.setContent(Content);
		note.setAddDate(new Date());
		
		
		
		tx.commit();
		s.close();
		response.sendRedirect("view_all_notes.jsp");
		
		
		
		
	}

}
