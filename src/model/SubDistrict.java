package model;

public class SubDistrict {
	private int id;
	private String name;
	private int idDistrict;
	public SubDistrict(int id, String name,int idDistrict) {
		super();
		this.id = id;
		this.name = name;
		this.idDistrict=idDistrict;
	}
	public int getIdDistrict() {
		return idDistrict;
	}
	public void setIdDistrict(int idDistrict) {
		this.idDistrict = idDistrict;
	}
	public SubDistrict() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
