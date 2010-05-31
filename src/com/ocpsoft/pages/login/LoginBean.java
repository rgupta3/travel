package com.ocpsoft.pages.login;

import java.io.IOException;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.security.BadCredentialsException;
import org.springframework.security.ui.AbstractProcessingFilter;
import org.springframework.stereotype.Component;

import com.ocpsoft.pretty.PrettyContext;

@Component
@Scope("request")
public class LoginBean {

	private String username = "";
	private String password = "";
	private boolean rememberMe = false;
	private boolean loggedIn = false;

	public String doLogin() throws IOException, ServletException {

		FacesUtils facesUtils = new FacesUtils();
		String redirect = facesUtils.getRequestParameter("redirect");
		if ((redirect != null) && !redirect.isEmpty()) {
			redirect = PrettyContext.getCurrentInstance()
					.getOriginalRequestUrl();
			Map<String, Object> sessionMap = FacesContext.getCurrentInstance()
					.getExternalContext().getSessionMap();
			sessionMap.put(LoginRedirectFilter.LAST_URL_REDIRECT_KEY, redirect);
		}
		facesUtils.getExternalContext().dispatch("/j_spring_security_check");
		facesUtils.getFacesContext().responseComplete();
		return null;

		/*
		 * ExternalContext context = FacesContext.getCurrentInstance()
		 * .getExternalContext();
		 * 
		 * RequestDispatcher dispatcher = ((ServletRequest)
		 * context.getRequest())
		 * .getRequestDispatcher("/j_spring_security_check");
		 * 
		 * dispatcher.forward((ServletRequest) context.getRequest(),
		 * (ServletResponse) context.getResponse());
		 * 
		 * FacesContext.getCurrentInstance().responseComplete();
		 * 
		 * System.out.println("login"); // It's OK to return null here because
		 * Faces is just going to exit. return null;
		 */

	}

	@PostConstruct
	@SuppressWarnings("unused")
	private void handleErrorMessage() {
		Exception e = (Exception) FacesContext
				.getCurrentInstance()
				.getExternalContext()
				.getSessionMap()
				.get(
						AbstractProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY);

		if (e instanceof BadCredentialsException) {
			FacesContext
					.getCurrentInstance()
					.getExternalContext()
					.getSessionMap()
					.put(
							AbstractProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY,
							null);
			FacesContext.getCurrentInstance().addMessage(
					null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Username or password not valid.", null));
		}
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(final String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(final String password) {
		this.password = password;
	}

	public boolean isRememberMe() {
		return this.rememberMe;
	}

	public void setRememberMe(final boolean rememberMe) {
		this.rememberMe = rememberMe;
	}

	public boolean isLoggedIn() {
		return this.loggedIn;
	}

	public void setLoggedIn(final boolean loggedIn) {
		this.loggedIn = loggedIn;
	}
}
