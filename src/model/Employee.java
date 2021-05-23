package model;

public class Employee {

	private int id;
	private String fullname;
	private String address;
	private String phonenumber;
	private String username;
	private String password;
	private String position;

	public Employee() {
		super();
	}

	public Employee(int id, String fullname, String address, String phonenumber, String username, String password,
			String position) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.address = address;
		this.phonenumber = phonenumber;
		this.username = username;
		this.password = password;
		this.position = position;
	}
	
	public Employee(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

}
