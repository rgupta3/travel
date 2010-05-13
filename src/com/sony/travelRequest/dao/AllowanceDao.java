package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.Allowance;

/**
 * Home object for domain model class Allowance.
 * @see com.sony.travelRequest.model.Allowance
 * @author Hibernate Tools
 */
public class AllowanceDao extends HibernateDaoSupport {

	public AllowanceDao() {
		super();
	}
	
	private static final Log log = LogFactory.getLog(AllowanceDao.class);

//	private final SessionFactory sessionFactory = getSessionFactory();
//
//	protected SessionFactory getSessionFactory() {
//		try {
//			return (SessionFactory) new InitialContext()
//					.lookup("SessionFactory");
//		} catch (Exception e) {
//			log.error("Could not locate SessionFactory in JNDI", e);
//			throw new IllegalStateException(
//					"Could not locate SessionFactory in JNDI");
//		}
//	}

	public void persist(Allowance transientInstance) {
		log.debug("persisting Allowance instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Allowance instance) {
		log.debug("attaching dirty Allowance instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Allowance instance) {
		log.debug("attaching clean Allowance instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Allowance persistentInstance) {
		log.debug("deleting Allowance instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Allowance merge(Allowance detachedInstance) {
		log.debug("merging Allowance instance");
		try {
			Allowance result = (Allowance) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Allowance findById(float id) {
		log.debug("getting Allowance instance with id: " + id);
		try {
			Allowance instance = (Allowance) getHibernateTemplate().get("com.sony.travelRequest.model.Allowance", id);
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

//	public List<Allowance> findByExample(Allowance instance) {
//		log.debug("finding Allowance instance by example");
//		try {
//			List<Allowance> results = (List<Allowance>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.Allowance").add(
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
