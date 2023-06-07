package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.*;
import com.entities.Note;
import com.helper.FactoryProvider;
public class Save_note_Servlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
					
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		Note note=new Note(title,content,new Date());
		
	
//		System.out.println(d+" "+note.getId());	
		
//		System.out.println("Id :"+note.getId()+"NAme :"+note.getTitle());
		
		Configuration c=new Configuration();
		SessionFactory sf=c.configure().buildSessionFactory();
		Session s=sf.openSession();
		
//		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		s.save(note);
		tx.commit();
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		out.println("<h1 style='text-align:center;>Notes added successfully</h1>");

		
		
		out.println("<h2 style='text-align:center;><a href='view_all_notes.jsp'>View all Notes</a></h2>");

		
		s.close();
		}
		catch(Exception e)
		
		{
			System.out.println("Exception");
			e.printStackTrace();
		}
	}

}
