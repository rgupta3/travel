package com.sony.travelRequest.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class RoleValidator implements Validator {
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {

		String role = (String) value;
		String cid = component.getClientId(context);
		if(role==null || role.isEmpty() || "travel".equals(role) || "employee".equals(role)) {
			context.addMessage(cid, new FacesMessage(" invalid role"));
			context.renderResponse();
			return;
		}
	}
}
