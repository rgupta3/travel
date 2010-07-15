package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.TravelRequest;
import com.sony.travelRequest.util.RequestStatus;

/**
 * Home object for domain model class TravelRequest.
 * 
 * @see com.sony.travelRequest.model.TravelRequest
 * @author Hibernate Tools
 */
public class TravelRequestDao extends HibernateDaoSupport implements RequestStatus{

	public TravelRequestDao() {
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
			TravelRequest result = (TravelRequest) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/*
	 * public TravelRequest findById(int id) {
	 * log.debug("getting TravelRequest instance with id: " + id); try {
	 * //TravelRequest instance = (TravelRequest)
	 * getHibernateTemplate().get("com.sony.travelRequest.model.TravelRequest",
	 * id); TravelRequest instance =
	 * (TravelRequest)getHibernateTemplate().getSessionFactory
	 * ().openSession().createCriteria(TravelRequest.class).add(
	 * Restrictions.like("id", id) ).uniqueResult(); if (instance == null) {
	 * log.debug("get successful, no instance found"); } else {
	 * log.debug("get successful, instance found"); }
	 * getHibernateTemplate().getSessionFactory().close(); return instance; }
	 * catch (RuntimeException re) { log.error("get failed", re); throw re; } }
	 */

	public TravelRequest findById(int id) {
		log.debug("getting TravelRequest instance with id: " + id);
		TravelRequest instance = null;
		try {
			instance = (TravelRequest) getHibernateTemplate().load(
					TravelRequest.class, id);
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

	public List<TravelRequest> findIt() {

		List<TravelRequest> result = (List<TravelRequest>) getHibernateTemplate().execute(
					new HibernateCallback() {
						public Object doInHibernate(Session session) {
							Criteria criteria = session.createCriteria(
									TravelRequest.class);
							criteria.addOrder(
									Order.asc("date"));
							return criteria.list();
						}
					});
		return result;
	}

	public List<TravelRequest> findElement(final String searchItem,
			final String searchElement) {

		List<TravelRequest> result = (List<TravelRequest>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Criteria criteria = session.createCriteria(
								TravelRequest.class).add(
										Restrictions.like(searchItem, searchElement));
						return criteria.list();
					}
				});
	return result;

	}
	
	public List<TravelRequest> findElementforEmp(final String searchItem, final String searchElement,final String id) {
		
		List<TravelRequest> result = (List<TravelRequest>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Criteria criteria = session.createCriteria(TravelRequest.class).add( Restrictions.like(searchItem, searchElement) ).
						add( Restrictions.like("employee.id", id) );
						return criteria.list();
					}
					});
		return result;	
		
	}

	public List<TravelRequest> findbyEmployeeId(final String id) {
		
		List<TravelRequest> result = (List<TravelRequest>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Criteria criteria = session.createCriteria(TravelRequest.class).add( Restrictions.like("employee.id", id) );
						return criteria.list();
					}
					});
		return result;	
		
		
		
	}

	// public List<TravelRequest> findByExample(TravelRequest instance) {
	// log.debug("finding TravelRequest instance by example");
	// try {
	// List<TravelRequest> results = (List<TravelRequest>) sessionFactory
	// .getCurrentSession()createCriteria(
	// "com.sony.travelRequest.model.TravelRequest").add(
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
