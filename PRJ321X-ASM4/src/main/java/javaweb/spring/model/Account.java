package javaweb.spring.model;

public class Account {
	private String user_mail;
	private String user_pass;
	private int account_role;
	private String user_name;
	private String user_address;
	private String user_phone;
	public Account() {
		super();
	}
	public Account( String user_mail, String user_pass, int account_role, String user_name, String user_address,
			String user_phone) {
		super();
		this.user_mail = user_mail;
		this.user_pass = user_pass;
		this.account_role = account_role;
		this.user_name = user_name;
		this.user_address = user_address;
		this.user_phone = user_phone;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public int getAccount_role() {
		return account_role;
	}
	public void setAccount_role(int account_role) {
		this.account_role = account_role;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	
	
	

}
