package com.poly.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUntil {
	private static EntityManagerFactory factory ;
	public static EntityManager getEntityManager() {
		
		factory = Persistence.createEntityManagerFactory("asmjava4");
		if(factory == null || factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("asmjava4");
		
		}
		return factory.createEntityManager(); 
		
	}
	public static void shutDown() {
		if(factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
