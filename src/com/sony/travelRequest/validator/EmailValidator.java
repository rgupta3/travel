package com.sony.travelRequest.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class EmailValidator implements Validator {
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {

		String email = (String) value;
		String cid = component.getClientId(context);

	      if(!email.matches("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")){
		//if(!email.contains("@") || !email.contains(".")) {
			context.addMessage(cid, new FacesMessage(" invalid email "));
			context.renderResponse();
			return;
		}    	  
	}
}
