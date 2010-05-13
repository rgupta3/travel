package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.Employee;

/**
 * Home object for domain model class Employee.
 * 
 * @see com.sony.travelRequest.model.Employee
 * @author Hibernate Tools
 */
public class EmployeeDao extends HibernateDaoSupport {

	public EmployeeDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(EmployeeDao.class);


//	protected SessionFactory getSessionFactory() {
//		try {
////			return new Configuration().configure().buildSessionFactory();
//			return (SessionFactory) new InitialContext().lookup("java:comp/env/hibernate/SessionFactory");
//			// (SessionFactory) new InitialContext()
//			// .lookup("java:comp/env/hibernate/SessionFactory");
//			// (SessionFactory) new InitialContext()
//			// .lookup("SessionFactory");
//			// new Configuration().configure().buildSessionFactory();
//		} catch (Exception e) {
//			log.error("blah Could not locate SessionFactory in JNDI", e);
//			throw new IllegalStateException(
//					"blah Could not locate SessionFactory in JNDI");
//		}
//	}


	public void persist(Employee transientInstance) {
		log.debug("persisting Employee instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Employee instance) {
		log.debug("attaching dirty Employee instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Employee instance) {
		log.debug("attaching clean Employee instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Employee persistentInstance) {
		log.debug("deleting Employee instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Employee merge(Employee detachedInstance) {
		log.debug("merging Employee instance");
		try {
			Employee result = (Employee) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Employee findById(int id) {
		log.debug("getting Employee instance with id: " + id);
		try {
			Employee instance = (Employee) getHibernateTemplate().get("com.sony.travelRequest.model.Employee", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

//	public List<Employee> findByExample(Employee instance) {
//		log.debug("finding Employee instance by example");
//		try {
//			List<Employee> results = (List<Employee>) getHibernateTemplate().createCriteria(
//							"com.sony.travelRequest.model.Employee").add(
//							create(instance)).list();
//			log.debug("find by example successful, result size: "
//					+ results.size());
//			return results;
//		} catch (RuntimeException re) {
//			log.error("find by example failed", re);
//			throw re;
//		}
//	}

}
