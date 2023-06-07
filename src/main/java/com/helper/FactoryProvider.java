package com.helper;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;

public class FactoryProvider
{
	public static SessionFactory factory;
	
	public static SessionFactory getFactory()
	{
		if(factory==null)
		{
			Configuration c=new Configuration();
			SessionFactory factory=c.configure().buildSessionFactory();
		}
		return factory;
		
	}
	

	
	
}
