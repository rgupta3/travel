package com.sony.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

public class CustomAuthunticationProvider implements AuthenticationProvider {

	
	private static String userid;
	
	public static String getUserid() {
		return userid;
	}

	public static void setUserid(String userid) {
		CustomAuthunticationProvider.userid = userid;
	}

	public Authentication authenticate(Authentication auth)
			throws AuthenticationException {
		System.out.println("<<Username>>" + auth.getPrincipal());
		System.out.println("<<Password>>" + auth.getCredentials());

		setUserid(auth.getPrincipal().toString());
		
		String username=getUserid()+"@ap.sony.com";
		boolean success = LDAPAuthentication.doLogin(username, auth
				.getCredentials().toString());

		System.out.println("Logged in:" + success);

		if (!success) {
			throw new BadCredentialsException("password is invalid");
		}

		List<GrantedAuthority> gaList = new ArrayList<GrantedAuthority>();

		List<String> roles = getUserRoles(auth.getPrincipal().toString());

		if (roles == null) {
			GrantedAuthority ga = new GrantedAuthorityImpl("ROLE_USER");
			gaList.add(ga);
		} else {
			for (String role : roles) {
				GrantedAuthority ga = new GrantedAuthorityImpl(role);
				gaList.add(ga);
			}
		}
		return new UsernamePasswordAuthenticationToken(auth.getPrincipal(),
				auth.getCredentials(), gaList);
	}

	private List<String> getUserRoles(String principal) {
		// TODO(Priyanka) Auto-generated method stub
		List<String> userRoles = null;
		/* userRoles = Do Hibernate query here */;
		
		if(getUserid().equals("501200I647"))
		{
			userRoles = new ArrayList<String>();
			userRoles.add("ROLE_SUPERVISOR");
		}

		return userRoles;
	}

	public boolean supports(Class arg0) {
		return (UsernamePasswordAuthenticationToken.class
				.isAssignableFrom(arg0));
	}

}