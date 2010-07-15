package com.sony.travelRequest.dao;

// Generated Apr 14, 2010 7:38:10 PM by Hibernate Tools 3.3.0.GA
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sony.travelRequest.model.Authorities;
import com.sony.travelRequest.util.RequestStatus;

/**
 * Home object for domain model class Authorities.
 * 
 * @see com.sony.Authorities.model.Authorities
 * @author Hibernate Tools
 */
public class AuthoritiesDao extends HibernateDaoSupport implements RequestStatus{

	public AuthoritiesDao() {
		super();
	}

	private static Logger log = Logger.getLogger(AuthoritiesDao.class);

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

	public void persist(Authorities transientInstance) {
		log.debug("persisting Authorities instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Authorities instance) {
		log.debug("attaching dirty Authorities instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Authorities instance) {
		log.debug("attaching clean Authorities instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Authorities persistentInstance) {
		log.debug("deleting Authorities instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Authorities merge(Authorities detachedInstance) {
		log.debug("merging Authorities instance");
		try {
			Authorities result = (Authorities) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	/*
	 * public Authorities findById(int id) {
	 * log.debug("getting Authorities instance with id: " + id); try {
	 * //Authorities instance = (Authorities)
	 * getHibernateTemplate().get("com.sony.Authorities.model.Authorities",
	 * id); Authorities instance =
	 * (Authorities)getHibernateTemplate().getSessionFactory
	 * ().openSession().createCriteria(Authorities.class).add(
	 * Restrictions.like("id", id) ).uniqueResult(); if (instance == null) {
	 * log.debug("get successful, no instance found"); } else {
	 * log.debug("get successful, instance found"); }
	 * getHibernateTemplate().getSessionFactory().close(); return instance; }
	 * catch (RuntimeException re) { log.error("get failed", re); throw re; } }
	 */

	public Authorities findById(final String id) {
		log.debug("getting Authorities instance with id: " + id);
		List<Authorities> result = (List<Authorities>) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session) {
						Criteria criteria = session.createCriteria(
								Authorities.class);
						criteria.add(Restrictions.like("username", id));
						return criteria.list();
					}
				});
	return result.get(0);
		/*Authorities instance = null;
		try {
			instance = (Authorities) getHibernateTemplate().load(
					Authorities.class, id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (Exception re) {
			log.error("get failed", re);
		}
		return instance;*/
	}

	
}
