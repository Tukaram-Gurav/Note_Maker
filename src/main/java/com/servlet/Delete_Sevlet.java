package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;

import com.entities.Note;

public class Delete_Sevlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		try
		{
			int id=Integer.parseInt(request.getParameter("note_id"));
			
			Configuration c=new Configuration();
			SessionFactory sf=c.configure().buildSessionFactory();
			Session s=sf.openSession();
			Transaction tx=s.beginTransaction();
						
			Note note=(Note) s.get(Note.class,id);
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("view_all_notes.jsp");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

	
}
