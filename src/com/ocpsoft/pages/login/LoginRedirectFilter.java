package com.ocpsoft.pages.login;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
public class LoginRedirectFilter implements Filter {
	public static final String LAST_URL_REDIRECT_KEY = LoginRedirectFilter.class
			.getName()
			+ "LAST_URL_REDIRECT_KEY";

	public void destroy() {
	}

	public void doFilter(final ServletRequest request,
			final ServletResponse response, final FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest) request).getSession();
		String redirectUrl = (String) session
				.getAttribute(LAST_URL_REDIRECT_KEY);
		if (this.isAuthenticated() && (redirectUrl != null)
				&& !redirectUrl.isEmpty()) {
			session.removeAttribute(LAST_URL_REDIRECT_KEY);
			HttpServletResponse resp = (HttpServletResponse) response;
			resp.sendRedirect(redirectUrl);
		} else {
			chain.doFilter(request, response);
		}
	}

	private boolean isAuthenticated() {
		boolean result = false;
		SecurityContext context = SecurityContextHolder.getContext();
		if (context instanceof SecurityContext) {
			Authentication authentication = context.getAuthentication();
			if (authentication instanceof AnonymousAuthenticationToken) {
				// not authenticated
			} else if (authentication instanceof Authentication) {
				result = true;
			}
		}
		return result;
	}

	public void init(final FilterConfig filterConfig) throws ServletException {
	}
}