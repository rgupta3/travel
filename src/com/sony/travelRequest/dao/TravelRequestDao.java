package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA
import java.util.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.hibernate.criterion.Order;
import com.sony.travelRequest.model.TravelRequest;

/**
 * Home object for domain model class TravelRequest.
 * @see com.sony.travelRequest.model.TravelRequest
 * @author Hibernate Tools
 */
public class TravelRequestDao extends HibernateDaoSupport {
	
	public TravelRequestDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(TravelRequestDao.class);

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

	public void persist(TravelRequest transientInstance) {
		log.debug("persisting TravelRequest instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TravelRequest instance) {
		log.debug("attaching dirty TravelRequest instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TravelRequest instance) {
		log.debug("attaching clean TravelRequest instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TravelRequest persistentInstance) {
		log.debug("deleting TravelRequest instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TravelRequest merge(TravelRequest detachedInstance) {
		log.debug("merging TravelRequest instance");
		try {
			TravelRequest result = (TravelRequest) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TravelRequest findById(int id) {
		log.debug("getting TravelRequest instance with id: " + id);
		try {
			//TravelRequest instance = (TravelRequest) getHibernateTemplate().get("com.sony.travelRequest.model.TravelRequest", id);
			TravelRequest instance = (TravelRequest)getHibernateTemplate().getSessionFactory().openSession().createCriteria(TravelRequest.class).add( Restrictions.like("id", id) ).uniqueResult();
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			getHibernateTemplate().getSessionFactory().close();			
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	
	
public List<TravelRequest> findIt() {
		
		try {
			List<TravelRequest> result;
			result =(List<TravelRequest>) getHibernateTemplate().getSessionFactory().openSession().createCriteria(TravelRequest.class).addOrder( Order.desc("date")).list();
			getHibernateTemplate().getSessionFactory().close();
			return result;
			//return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
	}
public List<TravelRequest> findElement(String searchItem, String searchElement) {
	
	try {
		List<TravelRequest> result;
		result =(List<TravelRequest>) getHibernateTemplate().getSessionFactory().openSession().createCriteria(TravelRequest.class).add( Restrictions.like(searchItem, searchElement) ).list();
		getHibernateTemplate().getSessionFactory().close();
		return result;
		//return instance;
	} catch (RuntimeException re) {
		log.error("get failed", re);
		throw re;
	}
	
}

//	public List<TravelRequest> findByExample(TravelRequest instance) {
//		log.debug("finding TravelRequest instance by example");
//		try {
//			List<TravelRequest> results = (List<TravelRequest>) sessionFactory
//					.getCurrentSession()createCriteria(
//							"com.sony.travelRequest.model.TravelRequest").add(
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
