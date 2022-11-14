package javaweb.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class ControllerAdmin {
	@Autowired
	//private ShoppingDao shoppingDao;
	@RequestMapping("/productAdmin") 
	public String productAdmin()
	{
		return "productAdmin";
	}

}
