package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.RequestApproval;

/**
 * Home object for domain model class RequestApprovals.
 * @see com.sony.travelRequest.model.RequestApproval
 * @author Hibernate Tools
 */
public class RequestApprovalsDao extends HibernateDaoSupport {
	
	public RequestApprovalsDao() {
		super();
	}

	private static final Log log = LogFactory.getLog(RequestApprovalsDao.class);

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

	public void persist(RequestApproval transientInstance) {
		log.debug("persisting RequestApprovals instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(RequestApproval instance) {
		log.debug("attaching dirty RequestApprovals instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(RequestApproval instance) {
		log.debug("attaching clean RequestApprovals instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(RequestApproval persistentInstance) {
		log.debug("deleting RequestApprovals instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RequestApproval merge(RequestApproval detachedInstance) {
		log.debug("merging RequestApprovals instance");
		try {
			RequestApproval result = (RequestApproval) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public RequestApproval findById(java.lang.String id) {
		log.debug("getting RequestApprovals instance with id: " + id);
		try {
			RequestApproval instance = (RequestApproval) getHibernateTemplate().get("com.sony.travelRequest.model.RequestApprovals", id);
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

//	public List<RequestApprovals> findByExample(RequestApprovals instance) {
//		log.debug("finding RequestApprovals instance by example");
//		try {
//			List<RequestApprovals> results = (List<RequestApprovals>) sessionFactory
//					.getCurrentSession().createCriteria(
//							"com.sony.travelRequest.model.RequestApprovals")
//					.add(create(instance)).list();
//			log.debug("find by example successful, result size: "
//					+ results.size());
//			return results;
//		} catch (RuntimeException re) {
//			log.error("find by example failed", re);
//			throw re;
//		}
//	}
}
