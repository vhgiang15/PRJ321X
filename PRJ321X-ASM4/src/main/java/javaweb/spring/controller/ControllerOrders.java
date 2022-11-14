package javaweb.spring.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javaweb.spring.dao.ShoppingDao;
import javaweb.spring.model.Cart;
import javaweb.spring.model.Order;
import javaweb.spring.model.ProductOrders;


@Controller
public class ControllerOrders {
	@Autowired
	private ShoppingDao shoppingDao;
	@RequestMapping(value = "/cart")
	public ModelAndView addCart(ModelAndView model, HttpServletRequest request) throws Exception {
		String srcProduct = request.getParameter("src");
		String nameProduct = request.getParameter("name");
		int idProduct = Integer.parseInt(request.getParameter("id"));
		float priceProduct = Float.parseFloat(request.getParameter("price"));
		ProductOrders productOrders = new ProductOrders(srcProduct, idProduct, 1, nameProduct, priceProduct);
		HttpSession session = request.getSession();
		

		if (session.getAttribute("order") == null) {
			Order order = new Order();
			Cart cart = new Cart();
			cart.add(productOrders);
			order.setlProduct(cart.getItems());
			order.setPrice(cart.getAmount());
			session.setAttribute("order", order);
		} else {
			Order order = (Order) session.getAttribute("order");
			Cart cart = new Cart();
			cart.setItems(order.getlProduct());
			cart.add(productOrders);
			order.setlProduct(cart.getItems());
			order.setPrice(cart.getAmount());
			session.setAttribute("order", order);
		}
		model.addObject("order");
		model.addObject("displayAlert","none");
		model.addObject("error","none");
		model.addObject("enableSubmit","show");
		model.setViewName("cart");
		return model;

	}
	
	@RequestMapping(value = "/showCart")
	public ModelAndView showCart(ModelAndView model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		session.setAttribute("order", order);
		model.addObject("order");
		model.addObject("displayAlert","none");
		model.addObject("error","none");
		model.addObject("enableSubmit","show");
		model.setViewName("cart");
		return model;
	}
	
	
	@RequestMapping(value = "/increase")
	public ModelAndView increaseProduct(ModelAndView model, HttpServletRequest request) throws Exception {
		int idProduct = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		Cart cart = new Cart();
		cart.setItems(order.getlProduct());
		cart.increaseProduct(idProduct);
		order.setlProduct(cart.getItems());
		order.setPrice(cart.getAmount());
		session.setAttribute("order", order);
		model.addObject("order");
		model.addObject("displayAlert", "none");
		model.addObject("error", "none");
		model.addObject("enableSubmit", "show");
		model.setViewName("cart");
		return model;

	}
	
	@RequestMapping(value = "/decrease")
	public ModelAndView decreaseProduct(ModelAndView model, HttpServletRequest request) throws Exception {
		int idProduct = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		Cart cart = new Cart();
		cart.setItems(order.getlProduct());
		cart.decreaseProduct(idProduct);
		order.setlProduct(cart.getItems());
		order.setPrice(cart.getAmount());
		session.setAttribute("order", order);
		model.addObject("order");
		model.addObject("displayAlert", "none");
		model.addObject("error", "none");
		model.addObject("enableSubmit", "show");
		model.setViewName("cart");
		return model;

	}
	
	
	
	@RequestMapping(value="/remove")
	public ModelAndView remove(ModelAndView model, HttpServletRequest request) throws Exception{
		int idProduct=Integer.parseInt(request.getParameter("id"));
		HttpSession session= request.getSession();
		Order order= (Order) session.getAttribute("order");
		Cart cart = new Cart();
		cart.setItems(order.getlProduct());
		cart.remove(idProduct);
		order.setlProduct(cart.getItems());
		order.setPrice(cart.getAmount());
		if(order.getPrice()==0) {
			model.addObject("enableSubmit","none");
		} else {
			model.addObject("enableSubmit","show");
		}
		session.setAttribute("order", order);
		model.addObject("order");
		model.addObject("displayAlert","none");
		model.addObject("error","none");
		model.setViewName("cart");		
		return model;
	}
	
	@RequestMapping(value="/submitOrder")
	public ModelAndView submit(ModelAndView model, HttpServletRequest request) throws Exception {
		String name=request.getParameter("fullname");
		String mail= request.getParameter("mail");
		String address = request.getParameter("address");
		String phone= request.getParameter("phone");
		
		HttpSession session= request.getSession();
		Order order= (Order) session.getAttribute("order");
		Cart cart = new Cart();
		cart.setItems(order.getlProduct());
		order.setAddress(address);    
		order.setPhoneNumber(phone);
		order.setUserMail(mail);
		order.setFullname(name);
		if(name.equals("")|| mail.equals("")||address.equals("")||phone.equals("")||cart.getAmount()==0) {	
			model.addObject("displayAlert","none");
			model.addObject("error","show");
			session.setAttribute("order", order);
			model.addObject("order");
			model.setViewName("cart");

		} else {
			shoppingDao.insertOrder(order);
			model.addObject("displayAlert","show");
			model.addObject("error","none");
			model.addObject("enableSubmit","none");
			session.invalidate();
			model.setViewName("cart");
		}
		
		return model;
	}
	
	 

}
