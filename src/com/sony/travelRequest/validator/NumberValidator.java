package com.sony.travelRequest.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class NumberValidator implements Validator {
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {

		String number = (String) value;
		String cid = component.getClientId(context);

	      if(!number.matches("^([0-9]+)*$")){
			context.addMessage(cid, new FacesMessage(" invalid number "));
			context.renderResponse();
			return;
		}    	  
	}
}
