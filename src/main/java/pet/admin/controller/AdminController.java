package pet.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("admin")
public class AdminController {

	@RequestMapping("index.do")
	private String index() {
		log.info("admin����");
		return "/admin/adminIndex";
	}
}
