package com.sony.travelRequest.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class ReqIdValidator implements Validator {
	public void validate(FacesContext context, UIComponent component,
			Object value) throws ValidatorException {

		String reqId = (String) value;
		String cid = component.getClientId(context);
		try {
			Integer.parseInt(reqId);
		} catch (NumberFormatException e) {
			context.addMessage(cid, new FacesMessage("invalid request id"));
			context.renderResponse();
			return;
		}
	}
}
