package com.poly.dao;

import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.util.JpaUntil;

public class AbstractDao<T> { // <T> generate
	
	public static final EntityManager entityManager = JpaUntil.getEntityManager();
	
	@SuppressWarnings("deprecation")
	@Override
		protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
		}
	
	//abstractclass Find Id
	public T findById(Class<T> clazz , Integer id) {
	
		return entityManager.find(clazz, id);
	}
	
	//abstractclass Find All
	public List<T> findAll(Class<T> clazz,boolean existIsAtive){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(existIsAtive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(),clazz);
		return query.getResultList();
		//select * from entity where isActive = 1
		
	}
	
	//abstractclass Find All for Paging
	// pageNumber : lấy phần tử thứ pageNumber trong list ...
	//pageSize : set 1 page có bao nhiêu phần tử
	public List<T> findAll(Class<T> clazz,boolean existIsAtive , int pageNumber , int pageSize){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(existIsAtive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(),clazz);
		query.setFirstResult((pageNumber -1 )*pageSize);
		query.setMaxResults(pageSize );
		return query.getResultList();
		//select * from entity where isActive = 1
		/*
		 5 phan tu
		 muon 1 trang có 2 phan tu
		 =>>> tong so trang :3 
		 trang 1 [0] [1]
		 trang 2 [2] [3]
		  trang 3 [4] 
		  muon lay cac phan tu o trang thu 2 >>> pageNumber = 3  , page size = 2
		  (3 -1 ) * 2 = 4 >>> bat dau lay phan tu thu 4 , va lay tong cong 2 phan tu 
		 
		 */
	}
	public List<T> findAll(Class<T> clazz,boolean existIsAtive , int pageNumber , int pageSize,String column){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if(existIsAtive == true) {
			sql.append(" WHERE isActive = 1");
		}if(column.length()>1) {
			sql.append("AND o.href NOT IN ('"+column+"')");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(),clazz);
		query.setFirstResult((pageNumber -1 )*pageSize);
		query.setMaxResults(pageSize );
		return query.getResultList();
		//select * from entity where isActive = 1
		/*
		 5 phan tu
		 muon 1 trang có 2 phan tu
		 =>>> tong so trang :3 
		 trang 1 [0] [1]
		 trang 2 [2] [3]
		  trang 3 [4] 
		  muon lay cac phan tu o trang thu 2 >>> pageNumber = 3  , page size = 2
		  (3 -1 ) * 2 = 4 >>> bat dau lay phan tu thu 4 , va lay tong cong 2 phan tu 
		 
		 */
	}
	//object... tham so co do dai bien doi
	public T findSingle(Class<T> clazz , String sql ,Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql,clazz);
		for (int i = 0 ; i < params.length;i++) {
			query.setParameter(i, params[i]);
		}
		List<T> result= query.getResultList();
		if(result.isEmpty()) {
			return null;			
		}
		return result.get(0);
	}
	
	
	public List<T> findList(Class<T> clazz , String sql ,Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql,clazz);
		for (int i = 0 ; i < params.length;i++) {
			query.setParameter(i, params[i]);
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findListByNativeQuery( String sql ,Object... params) {
		Query query = entityManager.createNativeQuery(sql);
		for (int i = 0 ; i < params.length;i++) {
			query.setParameter(i, params[i]);
		}

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findListByNativeQueryPage( String sql , int pageNumber , int pageSize , Object... params ) {
		Query query = entityManager.createNativeQuery(sql);
		for (int i = 0 ; i < params.length;i++) {
			query.setParameter(i, params[i]);
		}
		query.setFirstResult((pageNumber -1 )*pageSize);
		query.setMaxResults(pageSize );
		return query.getResultList();
	}
	public T create(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
		System.out.println("create succed");	
		return entity;
		} catch (Exception e) {
			System.out.println("Cannot insert entity "+entity.getClass().getSimpleName());
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			throw new RuntimeException();
		}
		
	}
	
	public T update(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
		System.out.println("Update succed");	
		return entity;
		} catch (Exception e) {
			System.out.println("Cannot update entity "+entity.getClass().getSimpleName());
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			throw new RuntimeException();
		}
		
	}

	public T delete(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity);
			entityManager.getTransaction().commit();
		System.out.println("Remove succed");	
		return entity;
		} catch (Exception e) {
			System.out.println("Cannot Remove entity "+entity.getClass().getSimpleName());
			e.printStackTrace();
			entityManager.getTransaction().rollback();
			throw new RuntimeException();
		}
		
	}	
	@SuppressWarnings("unchecked")
	public List<T> callStored(String namedStored , Map<String , Object> params){
		StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStored);
		params.forEach((key,value)-> query.setParameter(key, value));
		return (List<T>)query.getResultList();
		
	}
}
