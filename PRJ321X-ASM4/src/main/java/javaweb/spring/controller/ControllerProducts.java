package javaweb.spring.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javaweb.spring.dao.ShoppingDao;
import javaweb.spring.model.Products;

@Controller

public class ControllerProducts {
	@Autowired
	private ShoppingDao shoppingDao;
	@RequestMapping(value="/product")
	public ModelAndView getLisProducts (ModelAndView model, HttpServletRequest request) throws IOException{
		int nameID=Integer.parseInt(request.getParameter("id"));
		Products products= shoppingDao.getProducts(nameID);
		model.addObject("product",products);
		model.setViewName("product");
		return model;		
	}
}
