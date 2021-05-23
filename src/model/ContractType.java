package model;

public class ContractType {

	private int id;
	private String type;

	public ContractType(int id, String type) {
		super();
		this.id = id;
		this.type = type;
	}

	public ContractType() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
