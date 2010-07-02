package com.sony.travelRequest.dao;

// Generated Jun 28, 2010 4:43:17 PM by Hibernate Tools 3.2.5.Beta



import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

//import com.sony.travelRequest.model.TravelRequest;
import com.sony.travelRequest.model.TravelSettlement;

/**
 * Home object for domain model class TravelSettlement.
 * @see com.sony.travelRequest.model.TravelSettlement
 * @author Hibernate Tools
 */
public class TravelSettlementDao extends HibernateDaoSupport {

	public TravelSettlementDao()
	{
		super();
	}
	private static final Log log = LogFactory
			.getLog(TravelSettlementDao.class);
	
	

	/*private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}*/

	public void persist(TravelSettlement transientInstance) {
		log.debug("persisting TravelSettlement instance");
		try {
			getHibernateTemplate().saveOrUpdate(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(TravelSettlement instance) {
		log.debug("attaching dirty TravelSettlement instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TravelSettlement instance) {
		log.debug("attaching clean TravelSettlement instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(TravelSettlement persistentInstance) {
		log.debug("deleting TravelSettlement instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TravelSettlement merge(TravelSettlement detachedInstance) {
		log.debug("merging TravelSettlement instance");
		try {
			TravelSettlement result = (TravelSettlement) getHibernateTemplate()
			.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public TravelSettlement findById(int id) {
		log.debug("getting TravelSettlement instance with id: " + id);
		try {
			/*TravelSettlement instance = (TravelSettlement) sessionFactory
					.getCurrentSession().get("TravelSettlement", id);*/
			
			TravelSettlement instance = (TravelSettlement) getHibernateTemplate().load(
					TravelSettlement.class, id);
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

	/*public List<TravelSettlement> findByExample(TravelSettlement instance) {
		log.debug("finding TravelSettlement instance by example");
		try {
			List<TravelSettlement> results = (List<TravelSettlement>) sessionFactory
					.getCurrentSession().createCriteria("TravelSettlement")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}*/
}
