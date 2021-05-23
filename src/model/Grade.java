package model;

import java.sql.Timestamp;

public class Grade {

	private int id;
	private int grade;
	private int value;
	private float price;
	private Timestamp startDate;

	public Grade(int id, int grade, int value, float price, Timestamp startDate) {
		super();
		this.id = id;
		this.grade = grade;
		this.value = value;
		this.price = price;
		this.startDate = startDate;
	}

	public Grade() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + grade;
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + ((startDate == null) ? 0 : startDate.hashCode());
		result = prime * result + value;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Grade other = (Grade) obj;
		if (grade != other.grade)
			return false;
		if (Float.floatToIntBits(price) != Float.floatToIntBits(other.price))
			return false;
		if (value != other.value)
			return false;
		return true;
	}

}
