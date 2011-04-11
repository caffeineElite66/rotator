package com.cn.rotator.web;

import com.cn.rotator.service.RotatorService;
import java.net.MalformedURLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.inject.Inject;
import java.net.URL;

@Controller
@RequestMapping("/Go")
public class GoController {
	
	private RotatorService rotatorService;
	
	@Inject
	public GoController(RotatorService rotatorService) {
		this.rotatorService = rotatorService;
	}
	
	@RequestMapping(value="/{rid}", method = RequestMethod.GET)
	public String go(@PathVariable("rid") long rotatorId, Model model) throws MalformedURLException {
		URL url = rotatorService.getDestinationPath(rotatorId);
		return "redirect:" + url.toString();
	}
	
	
}
