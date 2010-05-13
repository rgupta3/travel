package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.TravelResv;

/**
 * Home object for domain model class TravelResv.
 * @see com.sony.travelRequest.model.TravelResv
 * @author Hibernate Tools
 */
public class TravelResvDao extends HibernateDaoSupport {
	
	public TravelResvDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(TravelResvDao.class);

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

	public void persist(TravelResv transientInstance) {
		log.debug("persisting TravelResv instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TravelResv instance) {
		log.debug("attaching dirty TravelResv instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TravelResv instance) {
		log.debug("attaching clean TravelResv instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TravelResv persistentInstance) {
		log.debug("deleting TravelResv instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TravelResv merge(TravelResv detachedInstance) {
		log.debug("merging TravelResv instance");
		try {
			TravelResv result = (TravelResv) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TravelResv findById(java.util.Date id) {
		log.debug("getting TravelResv instance with id: " + id);
		try {
			TravelResv instance = (TravelResv) getHibernateTemplate().get("com.sony.travelRequest.model.TravelResv", id);
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

//	public List<TravelResv> findByExample(TravelResv instance) {
//		log.debug("finding TravelResv instance by example");
//		try {
//			List<TravelResv> results = (List<TravelResv>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.TravelResv").add(
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
