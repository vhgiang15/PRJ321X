package javaweb.spring.dao;

import java.util.List;

import javaweb.spring.model.Account;
import javaweb.spring.model.Order;
import javaweb.spring.model.Products;


public interface ShoppingDao {
    public List<Products> search(String characters,int indexPage);
    public List<Products> searchType(String characters,int indexPage);
    public List<Products> getAllProduct(int indexPage);
    public int countProduct ();
    public int countProductSearch (String characters);
    public int countProductSearchType (String characters);
    public Products getProducts(int id);
    public void insertOrder(Order o);
    public boolean checkAccount(Account account);
    public boolean checkUser(String user);
    public void addAccount(Account account); 


}