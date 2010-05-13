package com.sony.travelRequest.listener;

import javax.faces.component.UIViewRoot;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
import javax.faces.event.PhaseEvent;
import javax.faces.event.PhaseId;
import javax.faces.event.PhaseListener;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate3.SessionHolder;
import org.springframework.orm.hibernate3.support.OpenSessionInViewFilter;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.jsf.FacesContextUtils;

import com.sony.travelRequest.model.TravelRequest;

public class RedirectPhaseListener extends OpenSessionInViewFilter implements
		PhaseListener {
	private static final long serialVersionUID = 1L;

	public RedirectPhaseListener() {
	}

	public PhaseId getPhaseId() {
		return PhaseId.ANY_PHASE;
	}

	public void afterPhase(PhaseEvent phaseEvent) {
		FacesContext ctx = phaseEvent.getFacesContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.getExternalContext().getRequest();

		String path = request.getRequestURL().toString();
		String reqIdStr = request.getParameter("reqId");
		if (path!=null && path.contains("/travel/travelFormSum.faces") && reqIdStr!=null) {
			System.out.println("After: " + phaseEvent.getPhaseId());
			SessionFactory sessionFactory = lookupSessionFactory(phaseEvent
					.getFacesContext());
			SessionHolder sessionHolder = (SessionHolder) TransactionSynchronizationManager
					.unbindResource(sessionFactory);
			logger
					.info("Closing single Hibernate Session in OpenSessionInViewPhaseListener");
			closeSession(sessionHolder.getSession(), sessionFactory);
		}
	}

	@SuppressWarnings("deprecation")
	public void beforePhase(PhaseEvent phaseEvent) {
		FacesContext ctx = phaseEvent.getFacesContext();
		HttpServletRequest request = (HttpServletRequest) ctx
				.getExternalContext().getRequest();

		String path = request.getRequestURL().toString();
		String reqIdStr = request.getParameter("reqId");
		if (path!=null && path.contains("/travel/travelFormSum.faces") && reqIdStr!=null) {
/*			ValueBinding vb = ctx.getApplication().createValueBinding(
					"#{navigationBean}");
			NavigationBean nb = (NavigationBean) vb.getValue(ctx);
*/
			
			System.out.println("From Request, reqId:"+reqIdStr);
			SessionFactory sessionFactory = lookupSessionFactory(phaseEvent
					.getFacesContext());
			logger
					.info("Opening single Hibernate Session in OpenSessionInViewPhaseListener");
			Session session = getSession(sessionFactory);
			TransactionSynchronizationManager.bindResource(sessionFactory,
					new SessionHolder(session));

			Integer reqId = Integer.valueOf(reqIdStr);
			String role = request.getParameter("role");
			TravelRequest trDB = (TravelRequest) session.createCriteria(
					TravelRequest.class).add(
					Restrictions.like("id", reqId)).uniqueResult();

			ValueBinding valueBindingTr = ctx.getApplication().createValueBinding(
					"#{travelRequest}");
			if(role!=null) {
				trDB.setShowTravelApproval(true);
			}
			
			valueBindingTr.setValue(ctx, trDB);

			try {

				String newPageViewId = null;
				newPageViewId = "/travelFormSum.jsp";

				UIViewRoot newPage = ctx.getApplication().getViewHandler()
						.createView(ctx, newPageViewId);
				ctx.setViewRoot(newPage);
				ctx.renderResponse();

			} catch (Exception e) {

			}
		}
	}

	protected SessionFactory lookupSessionFactory(FacesContext facesContext) {
		WebApplicationContext wac = FacesContextUtils
				.getRequiredWebApplicationContext(facesContext);
		return (SessionFactory) wac.getBean(DEFAULT_SESSION_FACTORY_BEAN_NAME,
				SessionFactory.class);
	}

	protected Session getSession(SessionFactory sessionFactory)
			throws DataAccessResourceFailureException {
		Session session = SessionFactoryUtils.getSession(sessionFactory, true);
		session.setFlushMode(FlushMode.AUTO);
		logger.info("getting session");
		return session;
	}

	protected void closeSession(Session session, SessionFactory factory) {
		logger.info("closing session");
		session.flush();
		super.closeSession(session, factory);
	}

}
