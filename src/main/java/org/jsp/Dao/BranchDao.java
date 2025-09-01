package org.jsp.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.jsp.Dto.Branch;
import org.jsp.Dto.Customer;
import org.jsp.Dto.Product;

public class BranchDao {
	private EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("project2");
	
	
	private BranchDao() {
		
	}
	
	public void saveBranch(Branch branch) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(branch);
		entityTransaction.commit();
		entityManager.close();
	}
	public void updateBranch(Branch branch) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(branch);
		entityTransaction.commit();
		entityManager.close();
	}
	
	public Branch loginBranchMail(String mail) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query= entityManager.createQuery("Select u from Branch u where mail=?1");
		query.setParameter(1, mail);
		Branch branch=(Branch) query.getSingleResult();
		entityManager.close();
		return branch;
	}
	
//	public void deleteBranch(Branch branch) {
//		EntityManager entityManager= entityManagerFactory.createEntityManager();
//		EntityTransaction entityTransaction=entityManager.getTransaction();
//		entityTransaction.begin();
//		entityManager.remove(branch);
//		entityTransaction.commit();
//		entityManager.close();
//	}
	public void deleteBranch(Branch branch) {
	    EntityManager entityManager = entityManagerFactory.createEntityManager();
	    EntityTransaction transaction = entityManager.getTransaction();
	    transaction.begin();

	    
	    Branch managedBranch = entityManager.find(Branch.class, branch.getId());

	    
	    Query query = entityManager.createQuery("SELECT p FROM Product p WHERE p.branch.id = :id");
	    query.setParameter("id", managedBranch.getId());
	    List<Product> products = query.getResultList();

	    for (Product p : products) {
	        p.setCustomer(null);  // Remove customer association
	        p.setBranch(null);    // Remove branch association
	        entityManager.remove(p);  // Delete product
	    }

	    entityManager.remove(managedBranch); // Delete branch
	    transaction.commit();
	    entityManager.close();
	}

	private static BranchDao dao;
	
	public static BranchDao getBranchDao() {
		if(dao ==null) {
			dao =new BranchDao();
		}
		return dao;
	}
	
//	===Customer====
	public void saveCustomer(Customer customer) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(customer);
		entityTransaction.commit();
		entityManager.close();
	}
	public Customer fetchCustomer(int id) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		Customer customer=entityManager.find(Customer.class, id);
		entityManager.close();
		return customer;
	}
	public void updateCustomer(Customer customer) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(customer);
		entityTransaction.commit();
		entityManager.close();
	}
	
	public Customer loginCustomerMail(String mail) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query= entityManager.createQuery("Select u from Customer u where mail=?1");
		query.setParameter(1, mail);
		Customer customer=(Customer) query.getSingleResult();
		entityManager.close();
		return customer;
	}
	
//	public void deleteCustomer(Customer customer) {
//		EntityManager entityManager= entityManagerFactory.createEntityManager();
//		EntityTransaction entityTransaction=entityManager.getTransaction();
//		entityTransaction.begin();
//		entityManager.remove(customer);
//		entityTransaction.commit();
//		entityManager.close();
//	}
	
	public void deleteCustomer(Customer customer) {
	    EntityManager entityManager = entityManagerFactory.createEntityManager();
	    EntityTransaction transaction = entityManager.getTransaction();
	    transaction.begin();

	    Query query = entityManager.createQuery("SELECT p FROM Product p WHERE p.customer.id = :id");
	    query.setParameter("id", customer.getId());
	    List<Product> products = query.getResultList();

	    for (Product p : products) {
	        p.setCustomer(null);         
	        entityManager.merge(p);    
	    }

	    entityManager.remove(customer);
	    transaction.commit();
	    entityManager.close();
	}

	
//	===Product===
	public void saveProduct(Product product) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.persist(product);
		entityTransaction.commit();
		entityManager.close();
	}
	public void updateProduct(Product product) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		entityTransaction.begin();
		entityManager.merge(product);
		entityTransaction.commit();
		entityManager.close();
	}
	
	public Product fetchProduct(int id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Product product=entityManager.find(Product.class, id);
		entityManager.close();
		return product;
	}
	
	public List<Product> fetchUnpurchasedProduct() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query =entityManager.createQuery("Select p from Product p where customer_id  IS NULL");
		return query.getResultList();
		 
	}
	public List<Product> fetchCustomerPurchased(int id) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query =entityManager.createQuery("Select p from Product p where customer_id =?1");
		query.setParameter(1, id);
		return query.getResultList();
		
	}
	public List<Product> fetchPurchasedProduct() {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query =entityManager.createQuery("Select p from Product p where p.customer IS NOT NULL");
		return query.getResultList();
		
	}

	public void removeProduct(int id) {
		EntityManager entityManager= entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction=entityManager.getTransaction();
		
		
		Product product=entityManager.find(Product.class, id);
		entityTransaction.begin();
		product.setBranch(null);
		product.setCustomer(null);
		entityManager.merge(product);
		entityManager.remove(product);
		entityTransaction.commit();
		entityManager.close();
	}
	
	
	
	
	
	
	
	
	
	
	
}
