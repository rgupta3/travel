package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.HotelResv;

/**
 * Home object for domain model class HotelResv.
 * @see com.sony.travelRequest.model.HotelResv
 * @author Hibernate Tools
 */
public class HotelResvDao extends HibernateDaoSupport {
	
	public HotelResvDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(HotelResvDao.class);

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

	public void persist(HotelResv transientInstance) {
		log.debug("persisting HotelResv instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(HotelResv instance) {
		log.debug("attaching dirty HotelResv instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(HotelResv instance) {
		log.debug("attaching clean HotelResv instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(HotelResv persistentInstance) {
		log.debug("deleting HotelResv instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public HotelResv merge(HotelResv detachedInstance) {
		log.debug("merging HotelResv instance");
		try {
			HotelResv result = (HotelResv) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public HotelResv findById(java.lang.String id) {
		log.debug("getting HotelResv instance with id: " + id);
		try {
			HotelResv instance = (HotelResv) getHibernateTemplate().get("com.sony.travelRequest.model.HotelResv", id);
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

//	public List<HotelResv> findByExample(HotelResv instance) {
//		log.debug("finding HotelResv instance by example");
//		try {
//			List<HotelResv> results = (List<HotelResv>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.HotelResv").add(
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
