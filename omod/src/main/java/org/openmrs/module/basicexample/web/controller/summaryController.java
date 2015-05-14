package org.openmrs.module.basicexample.web.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Encounter;
import org.openmrs.api.context.Context;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * The main controller.
 */
@Controller
public class  summaryController {

    protected final Log log = LogFactory.getLog(getClass());

    @RequestMapping(value = "/module/basicexample/summary", method = RequestMethod.GET)
    public void manage(ModelMap model,@RequestParam(required = false, value="patientId") Integer ptId)
    {
        model.addAttribute("allSummary", Context.getEncounterService().getEncountersByPatient(Context.getPatientService().getPatient(ptId)));

    }
}