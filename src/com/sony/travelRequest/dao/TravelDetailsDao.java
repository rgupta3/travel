package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.TravelDetails;

/**
 * Home object for domain model class TravelDetails.
 * @see com.sony.travelRequest.model.TravelDetails
 * @author Hibernate Tools
 */
public class TravelDetailsDao extends HibernateDaoSupport {
	
	public TravelDetailsDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(TravelDetailsDao.class);

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

	public void persist(TravelDetails transientInstance) {
		log.debug("persisting TravelDetails instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TravelDetails instance) {
		log.debug("attaching dirty TravelDetails instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TravelDetails instance) {
		log.debug("attaching clean TravelDetails instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TravelDetails persistentInstance) {
		log.debug("deleting TravelDetails instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TravelDetails merge(TravelDetails detachedInstance) {
		log.debug("merging TravelDetails instance");
		try {
			TravelDetails result = (TravelDetails) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TravelDetails findById(java.lang.String id) {
		log.debug("getting TravelDetails instance with id: " + id);
		try {
			TravelDetails instance = (TravelDetails) getHibernateTemplate().get("com.sony.travelRequest.model.TravelDetails", id);
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

//	public List<TravelDetails> findByExample(TravelDetails instance) {
//		log.debug("finding TravelDetails instance by example");
//		try {
//			List<TravelDetails> results = (List<TravelDetails>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.TravelDetails").add(
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
