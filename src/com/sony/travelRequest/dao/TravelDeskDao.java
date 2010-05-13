package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.TravelDesk;

/**
 * Home object for domain model class TravelDesk.
 * @see com.sony.travelRequest.model.TravelDesk
 * @author Hibernate Tools
 */
public class TravelDeskDao extends HibernateDaoSupport {
	
	public TravelDeskDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(TravelDeskDao.class);

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

	public void persist(TravelDesk transientInstance) {
		log.debug("persisting TravelDesk instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TravelDesk instance) {
		log.debug("attaching dirty TravelDesk instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TravelDesk instance) {
		log.debug("attaching clean TravelDesk instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TravelDesk persistentInstance) {
		log.debug("deleting TravelDesk instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TravelDesk merge(TravelDesk detachedInstance) {
		log.debug("merging TravelDesk instance");
		try {
			TravelDesk result = (TravelDesk) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TravelDesk findById(int id) {
		log.debug("getting TravelDesk instance with id: " + id);
		try {
			TravelDesk instance = (TravelDesk) getHibernateTemplate().get("com.sony.travelRequest.model.TravelDesk", id);
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

//	public List<TravelDesk> findByExample(TravelDesk instance) {
//		log.debug("finding TravelDesk instance by example");
//		try {
//			List<TravelDesk> results = (List<TravelDesk>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.TravelDesk").add(
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
