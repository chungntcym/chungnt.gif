package model;

public class Customer {
	private int id;
	private String fullname;
	private String address;
	private String phonenumber;
	private String identityNumber;
	private String email;

	public Customer(int id, String fullname, String address, String phonenumber, String identityNumber, String email) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.address = address;
		this.phonenumber = phonenumber;
		this.identityNumber = identityNumber;
		this.email = email;
	}

	public Customer() {
		super();
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

	public String getIdentityNumber() {
		return identityNumber;
	}

	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
