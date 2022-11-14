package javaweb.spring.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javaweb.spring.dao.ShoppingDao;
import javaweb.spring.model.Account;

@Controller  

public class ControllerAccount {
	@Autowired
	private ShoppingDao shoppingDao;
	@RequestMapping(value = "/submitLogin", method = RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model= new ModelAndView("admin");
		String user = request.getParameter("name");
		String pass = request.getParameter("password"); 
		String check= request.getParameter("check");
		Account account= new Account();
		account.setUser_mail(user);
		account.setUser_pass(pass);
		if(shoppingDao.checkAccount(account)) // check Account and account is correct
		{
			HttpSession session = request.getSession();
			session.setAttribute("account", account);
			Cookie cookieU= new Cookie("userC", user);
			Cookie cookieP= new Cookie("passC", pass);
			cookieU.setMaxAge(60*60);
			if(check !=null) {
				cookieP.setMaxAge(60*60);					
			} else {
				cookieP.setMaxAge(0);	
			}
			response.addCookie(cookieP);
			response.addCookie(cookieU);
		
			
		} else {					//Account wrong
			
			model.setViewName("login");
			model.addObject("display","show");	
		}	
		return model;		
	}
	
	@RequestMapping(value = "/registerSubmit", method = RequestMethod.POST)
	public ModelAndView registerSubmit(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView model= new ModelAndView("register");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String userName = request.getParameter("fullName");
		String pass = request.getParameter("password");
		String passConfirm = request.getParameter("confirm_pwd");
		String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";

		if(!email.matches(regexMail))
		{
			model.addObject("alertMessage","Email is not syntax");
			model.addObject("display","show");
			return model;			
		}
		if(!pass.equals(passConfirm)) {
			model.addObject("alertMessage","Confirm pass is wrong");
			model.addObject("display","show");
			return model;
		}
		Account account= new Account(email, pass, 2, userName, address, phone);
		if(shoppingDao.checkUser(email))
		{
			model.addObject("alertMessage","Email is exsist");
			model.addObject("display","show");
			return model;
				
		} else {
			shoppingDao.addAccount(account);
			model.addObject("alertMessage","Register successfull !");
			model.addObject("display","show");				
		}
		return model;
	
	}
}
