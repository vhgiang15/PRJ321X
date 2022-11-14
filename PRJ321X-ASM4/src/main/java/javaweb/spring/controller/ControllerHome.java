package javaweb.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javaweb.spring.dao.ShoppingDao;
import javaweb.spring.model.Products;

@Controller
public class ControllerHome {
	@Autowired
	private ShoppingDao shoppingDao;
	@RequestMapping(value= {"/","/home","/page"})
	  public ModelAndView home(ModelAndView model, HttpServletRequest request) throws Exception {
		String indexString=request.getParameter("indexPage");
		String beginPageString=request.getParameter("beginPage");
		int indexPage,beginPage=1;
		if(indexString==null) {indexPage=1;beginPage=1;}
		else {indexPage=Integer.parseInt(indexString);}	
		if(beginPageString!=null) {beginPage=Integer.parseInt(beginPageString);}
		if(indexPage%3==1) {beginPage=indexPage;}
		List<Products> listProducts= shoppingDao.getAllProduct(indexPage);
		int count=shoppingDao.countProduct();
		int endPage=count/6;
		if(count%6!=0) { endPage++;}
		model.addObject("indexPage", indexPage);
		model.addObject("beginPage", beginPage);
		model.setViewName("home");
		model.addObject("listP",listProducts);
		model.addObject("endPage",endPage);
	    return model;
	  }
	@RequestMapping(value= {"/search"})
	  public ModelAndView search(ModelAndView model, HttpServletRequest request) throws Exception {
		String textSearch= request.getParameter("textSearch");
		String indexString=request.getParameter("indexPage");
		String beginPageString=request.getParameter("beginPage");
		int indexPage, beginPage=1;
		if(indexString==null) {indexPage=1;beginPage=1;}
		else {indexPage=Integer.parseInt(indexString);}
		if(beginPageString!=null) {beginPage=Integer.parseInt(beginPageString);}
		if(indexPage%3==1) {beginPage=indexPage;}
		List<Products> listProducts= shoppingDao.search(textSearch, indexPage);
		int count=shoppingDao.countProductSearch(textSearch); ////
		int endPage=count/6;
		if(count%6!=0) { endPage++;}	
		model.addObject("indexPage", indexPage);
		model.addObject("beginPage", beginPage);
		model.setViewName("resultSearch");
		model.addObject("textSearch",textSearch);
		model.addObject("listP",listProducts);
		model.addObject("endPage",endPage);
		if(endPage==0) {
			model.addObject("alert","show");		
			
		} else {model.addObject("alert","none");	}
	    return model;
	  }
	
	
	@RequestMapping(value= {"/productType"})
	  public ModelAndView productType(ModelAndView model, HttpServletRequest request) throws Exception {
		String textSearch= request.getParameter("textSearch");
		String indexString=request.getParameter("indexPage");
		String beginPageString=request.getParameter("beginPage");
		int indexPage, beginPage=1;
		if(indexString==null) {indexPage=1;beginPage=1;}
		else {indexPage=Integer.parseInt(indexString);}
		if(beginPageString!=null) {beginPage=Integer.parseInt(beginPageString);}
		if(indexPage%3==1) {beginPage=indexPage;}
		List<Products> listProducts= shoppingDao.searchType(textSearch, indexPage);
		int count=shoppingDao.countProductSearchType(textSearch);
		int endPage=count/6;
		if(count%6!=0) { endPage++;}	
		model.addObject("indexPage", indexPage);
		model.addObject("beginPage", beginPage);
		model.setViewName("productSearch");
		model.addObject("textSearch",textSearch);
		model.addObject("listP",listProducts);
		model.addObject("endPage",endPage);
		if(endPage==0) {
			model.addObject("alert","show");		
			
		} else {model.addObject("alert","none");	}
	    return model;
	  }
	
	
	
	@RequestMapping("/register")
	public ModelAndView register(ModelAndView model) {
		model.setViewName("register");
		model.addObject("display", "none");
		return model;	
	}
	
	@RequestMapping("/aboutUS")
	public String aboutUS() {
		return "aboutUS";
	}

	@RequestMapping("/login")
	public ModelAndView login(@CookieValue(value = "userC",defaultValue = "") String user, @CookieValue(value = "passC",defaultValue = "") String pass,HttpServletRequest request) 
	{
		HttpSession session= request.getSession();
		session.invalidate();
		ModelAndView model = new ModelAndView("login");
		model.addObject("user",user);
		model.addObject("pass",pass);
		model.addObject("display","none");	
		return model;

	}
}
