package javaweb.spring.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

import javaweb.spring.model.Account;
import javaweb.spring.model.Order;
import javaweb.spring.model.ProductOrders;
import javaweb.spring.model.Products;

public class ShoppingDaoImpl implements ShoppingDao {
	private JdbcTemplate jdbcTemplate;
	private PreparedStatement ps;
	private ResultSet rs;

	public ShoppingDaoImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public List<Products> search(String characters, int indexPage) {
		String sql="select * from (SELECT *,ROW_NUMBER() OVER(order by product_id) AS row_num  FROM products where product_name like ?) as temp where row_num between ?*6-5 and ?*6";
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, "%"+characters+"%");
			ps.setInt(2, indexPage);
			ps.setInt(3, indexPage);
			rs=ps.executeQuery();
			List<Products> list= new ArrayList<>();
			while(rs.next()) {
				Products aProducts= new Products();
				aProducts.setId(rs.getInt("product_id"));
				aProducts.setName(rs.getString("product_name"));
				aProducts.setDescription(rs.getString("product_des"));
				aProducts.setPrice(rs.getFloat("product_price"));
				aProducts.setSrc(rs.getString("product_img_source"));
				aProducts.setType(rs.getString("product_type"));
				aProducts.setBrand(rs.getString("product_brand"));
				list.add(aProducts);
			}
			conn.close();
			return list;
			
		} catch (Exception e) {
			
		}	
		return null;
	}
	
	@Override
	public List<Products> getAllProduct(int indexPage) {
		String sql="select * from (SELECT *,ROW_NUMBER() OVER(order by product_id) AS row_num  FROM products) as temp where row_num between ?*6-5 and ?*6";
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, indexPage);
			ps.setInt(2, indexPage);
			rs=ps.executeQuery();
			List<Products> list= new ArrayList<>();
			while(rs.next()) {
				Products aProducts= new Products();
				aProducts.setId(rs.getInt("product_id"));
				aProducts.setName(rs.getString("product_name"));
				aProducts.setDescription(rs.getString("product_des"));
				aProducts.setPrice(rs.getFloat("product_price"));
				aProducts.setSrc(rs.getString("product_img_source"));
				aProducts.setType(rs.getString("product_type"));
				aProducts.setBrand(rs.getString("product_brand"));
				list.add(aProducts);
			}
			conn.close();
			return list;
			
		} catch (Exception e) {
			
		}	
		return null;
	}
	
	@Override
	public int countProduct() {
		String sql="select count(product_id) from products";
		int count=0;
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();			
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				count=rs.getInt(1);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return count;
	}
	@Override
	public int countProductSearch (String characters) {
		String sql="select count(product_id) from products where product_name like ?";
		int count=0;
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();			
			ps= conn.prepareStatement(sql);
			ps.setString(1, "%"+characters+"%");
			rs=ps.executeQuery();
			while(rs.next()) {
				count=rs.getInt(1);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return count;
	}
	
	
	@Override
	public int countProductSearchType (String characters) {
		String sql="select count(product_id) from products where product_type=?";
		int count=0;
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();			
			ps= conn.prepareStatement(sql);
			ps.setString(1,characters);
			rs=ps.executeQuery();
			while(rs.next()) {
				count=rs.getInt(1);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return count;
	}

	
	@Override
	public Products getProducts(int id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM products where product_id="+id;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Products>() {

			@Override
			public Products extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {
					Products aProducts = new Products();
					aProducts.setId(rs.getInt("product_id"));
					aProducts.setName(rs.getString("product_name"));
					aProducts.setDescription(rs.getString("product_des"));
					aProducts.setPrice(rs.getFloat("product_price"));
					aProducts.setSrc(rs.getString("product_img_source"));
					aProducts.setType(rs.getString("product_type"));
					aProducts.setBrand(rs.getString("product_brand"));
					return aProducts;
				}
				return null;
			}
		});

	}


	@Override
	public void insertOrder(Order o) {
		String sql = "INSERT INTO orders (nameCustomer,user_mail, order_address, order_phone)" + " VALUES (?, ?, ?, ?)";
		try {
			Connection conn = jdbcTemplate.getDataSource().getConnection();
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, o.getFullname());
			ps.setString(2, o.getUserMail());
			ps.setString(3, o.getAddress());
			ps.setString(4, o.getPhoneNumber());		
			ps.execute();	
			ResultSet rs=ps.getGeneratedKeys();
			if(rs.next()) {
				int idLastInsert= rs.getInt(1);
				List<ProductOrders> list= o.getlProduct();
				for(ProductOrders p: list) {
					sql = "INSERT INTO orders_detail (order_id,product_id, amount_product,price_product)" + " VALUES (?, ?, ?, ?)";
					jdbcTemplate.update(sql,idLastInsert,p.getProductId(),p.getQuantity(),p.getPriceProduct());			
				}
			}			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();

		}


	}

	@Override
	public boolean checkAccount(Account account) {
		boolean result=false;
		String sql="select account_role from account where user_mail=? and password=?";
		int account_role=0;
		try {
			Connection conn = jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, account.getUser_mail());
			ps.setString(2, account.getUser_pass());
			rs=ps.executeQuery();
			if(rs.next()) {
				account_role=rs.getInt(1);				
			}
			if(account_role==1) { result=true;}
			conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	@Override
	public boolean checkUser(String user) {
		String sql="SELECT user_name from account where user_mail=?";
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1, user);
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;	
			}
		} catch ( Exception e) {
			
		}
		return false;		
	}
	
	@Override
	public void addAccount(Account account) {
		String sql = "INSERT INTO account (user_mail,password, account_role, user_name,user_address,user_phone)" + " VALUES (?, ?, ?, ?,?,?)";
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1,account.getUser_mail());
			ps.setString(2, account.getUser_pass());
			ps.setInt(3,account.getAccount_role());
			ps.setString(4, account.getUser_name());
			ps.setString(5, account.getUser_address());
			ps.setString(6, account.getUser_phone());
			ps.execute();			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

	@Override
	public List<Products> searchType(String characters, int indexPage) {
		String sql="select * from (SELECT *,ROW_NUMBER() OVER(order by product_id) AS row_num  FROM products where product_type=?) as temp where row_num between ?*6-5 and ?*6";
		try {
			Connection conn= jdbcTemplate.getDataSource().getConnection();
			ps=conn.prepareStatement(sql);
			ps.setString(1,characters);
			ps.setInt(2, indexPage);
			ps.setInt(3, indexPage);
			rs=ps.executeQuery();
			List<Products> list= new ArrayList<>();
			while(rs.next()) {
				Products aProducts= new Products();
				aProducts.setId(rs.getInt("product_id"));
				aProducts.setName(rs.getString("product_name"));
				aProducts.setDescription(rs.getString("product_des"));
				aProducts.setPrice(rs.getFloat("product_price"));
				aProducts.setSrc(rs.getString("product_img_source"));
				aProducts.setType(rs.getString("product_type"));
				aProducts.setBrand(rs.getString("product_brand"));
				list.add(aProducts);
			}
			conn.close();
			return list;
			
		} catch (Exception e) {
			
		}	
		return null;
	}

}
