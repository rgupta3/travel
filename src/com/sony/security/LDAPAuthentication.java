package com.sony.security;

import java.util.Hashtable;

import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.springframework.security.core.context.SecurityContextHolder;
 
/**
 * Demonstrates how to create an initial context to an LDAP server
 * using simple authentication.
 */
 
class LDAPAuthentication {
	
	
	static boolean doLogin(String user, String pass){
		boolean success = false;
    	Hashtable authEnv = new Hashtable(11);
    	Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    	String ldapURL = "ldap://146.215.36.20:389";
 
    	authEnv.put(Context.INITIAL_CONTEXT_FACTORY,"com.sun.jndi.ldap.LdapCtxFactory");
   		authEnv.put(Context.PROVIDER_URL, ldapURL);
   		authEnv.put(Context.SECURITY_AUTHENTICATION, "simple");
   		authEnv.put(Context.SECURITY_PRINCIPAL, user);
   		authEnv.put(Context.SECURITY_CREDENTIALS, pass);
 
    	try {
    		DirContext authContext = new InitialDirContext(authEnv);
    		System.out.println("Authentication Success!");
    		success = true;
    	} catch (AuthenticationException authEx) {
    		System.out.println("Authentication failed!");
    		authEx.printStackTrace();
    	} catch (NamingException namEx) {
    		System.out.println("Something went wrong!");
    		namEx.printStackTrace();
    	}
    	return success;
    }
}
