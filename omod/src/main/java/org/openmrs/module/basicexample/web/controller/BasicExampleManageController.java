/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.basicexample.web.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.*;
import org.openmrs.api.PatientService;
import org.openmrs.api.context.Context;
import org.openmrs.validator.PatientIdentifierValidator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.ModelAndView;

/**
 * The main controller.
 */
@Controller
public class  BasicExampleManageController {
	protected final Log log = LogFactory.getLog(getClass());

	@RequestMapping(value = "/module/basicexample/create", method = RequestMethod.GET)
	public String create(@RequestParam(value = "id", required = false) String id,
							   @RequestParam(value = "surname", required = false) String surname,
							   @RequestParam(value = "fname", required = false) String fname,
							   @RequestParam(value = "lname", required = false) String lname,
							   @RequestParam(value = "dob", required = false) Date dob,
							   @RequestParam(value = "gender", required = false) String gender,
							   @RequestParam(value = "address", required = false) String address
	) {
//		ModelAndView model = new ModelAndView();
//		model.setViewName("manage");
		//int pid = Integer.parseInt(id);






			Patient patient = new Patient();
			PersonName personName = new PersonName();
			PersonAddress personAddress = new PersonAddress();

//			PatientIdentifier patientIdentifier = new PatientIdentifier();
//			PatientIdentifierType patientIdentifierType = Context.getPatientService().getPatientIdentifierTypeByUuid("8d79403a-c2cc-11de-8d13-0010c6dffd0f");
//			patientIdentifier.setDateCreated(new Date());
//			patientIdentifier.setIdentifierType(patientIdentifierType);
//			patientIdentifier.setLocation(Context.getLocationService().getDefaultLocation());
//			patientIdentifier.setIdentifier(String.valueOf(id));
//			patientIdentifier.setPreferred(true);
			//patientIdentifier.setPatientIdentifierId(pid);
		personName.setGivenName(surname);
		personName.setMiddleName(fname);
		personName.setFamilyName(lname);
		personName.setPreferred(true);

		personAddress.setAddress1(address);

		patient.setBirthdate(dob);
		patient.setGender(gender);

		patient.addName(personName);

		PatientIdentifier openmrsId = new PatientIdentifier();
			PatientService patientService = Context.getPatientService();

			String TARGET_ID_KEY = "patientmodule.idType";
			String TARGET_ID = Context.getAdministrationService().getGlobalProperty(TARGET_ID_KEY);
			PatientIdentifierType patientIdentifierType = patientService.getPatientIdentifierTypeByName(TARGET_ID);
			openmrsId.setIdentifier(id);
			openmrsId.setDateCreated(new Date());
			openmrsId.setLocation(Context.getLocationService().getDefaultLocation());
			openmrsId.setIdentifierType(patientIdentifierType);
			PatientIdentifierValidator.validateIdentifier(openmrsId);
			patient.addIdentifier(openmrsId);
			//save the if id not taken patient
			if (!patientService.isIdentifierInUseByAnotherPatient(openmrsId)) {
				patientService.savePatient(patient);
			}
		ModelAndView model = new ModelAndView();

		List<Patient> allPatients = Context.getPatientService().getAllPatients();
		model.addObject("patients", allPatients);
		return "redirect:manage.form";



	}

	@RequestMapping(value = "/module/basicexample/manage", method = RequestMethod.GET)
	public void manage(ModelMap model) {
		List<Patient> allPatients = Context.getPatientService().getAllPatients();
		model.addAttribute("patients", allPatients);
	}
}