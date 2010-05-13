package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.Finance;

/**
 * Home object for domain model class Finance.
 * @see com.sony.travelRequest.model.Finance
 * @author Hibernate Tools
 */
public class FinanceDao extends HibernateDaoSupport {
	
	public FinanceDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(FinanceDao.class);

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

	public void persist(Finance transientInstance) {
		log.debug("persisting Finance instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Finance instance) {
		log.debug("attaching dirty Finance instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Finance instance) {
		log.debug("attaching clean Finance instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Finance persistentInstance) {
		log.debug("deleting Finance instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Finance merge(Finance detachedInstance) {
		log.debug("merging Finance instance");
		try {
			Finance result = (Finance) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Finance findById(int id) {
		log.debug("getting Finance instance with id: " + id);
		try {
			Finance instance = (Finance) getHibernateTemplate().get("com.sony.travelRequest.model.Finance", id);
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

//	public List<Finance> findByExample(Finance instance) {
//		log.debug("finding Finance instance by example");
//		try {
//			List<Finance> results = (List<Finance>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.Finance").add(
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
