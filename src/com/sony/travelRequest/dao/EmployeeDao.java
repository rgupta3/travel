package com.sony.travelRequest.dao;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.Employee;

/**
 * Home object for domain model class Employee.
 * 
 * @see com.sony.Employee.model.Employee
 * @author Hibernate Tools
 */
public class EmployeeDao extends HibernateDaoSupport {

	public EmployeeDao() {
		super();
	}

	private static Logger log = Logger.getLogger(TravelRequestDao.class);

	// private final SessionFactory sessionFactory = getSessionFactory();
	//
	// protected SessionFactory getSessionFactory() {
	// try {
	// return (SessionFactory) new InitialContext()
	// .lookup("SessionFactory");
	// } catch (Exception e) {
	// log.error("Could not locate SessionFactory in JNDI", e);
	// throw new IllegalStateException(
	// "Could not locate SessionFactory in JNDI");
	// }
	// }

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
			Employee result = (Employee) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/*
	 * public Employee findById(int id) {
	 * log.debug("getting Employee instance with id: " + id); try {
	 * //Employee instance = (Employee)
	 * getHibernateTemplate().get("com.sony.Employee.model.Employee",
	 * id); Employee instance =
	 * (Employee)getHibernateTemplate().getSessionFactory
	 * ().openSession().createCriteria(Employee.class).add(
	 * Restrictions.like("id", id) ).uniqueResult(); if (instance == null) {
	 * log.debug("get successful, no instance found"); } else {
	 * log.debug("get successful, instance found"); }
	 * getHibernateTemplate().getSessionFactory().close(); return instance; }
	 * catch (RuntimeException re) { log.error("get failed", re); throw re; } }
	 */

	public Employee findById(int id) {
		log.debug("getting Employee instance with id: " + id);
		Employee instance = null;
		try {
			instance = (Employee) getHibernateTemplate().load(
					Employee.class, id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
				
			}
			return instance;
		} catch (Exception re) {
			log.error("get failed", re);
		}
		return instance;
	}

	// public List<Employee> findByExample(Employee instance) {
	// log.debug("finding Employee instance by example");
	// try {
	// List<Employee> results = (List<Employee>) sessionFactory
	// .getCurrentSession()createCriteria(
	// "com.sony.Employee.model.Employee").add(
	// create(instance)).list();
	// log.debug("find by example successful, result size: "
	// + results.size());
	// return results;
	// } catch (RuntimeException re) {
	// log.error("find by example failed", re);
	// throw re;
	// }
	// }
}
