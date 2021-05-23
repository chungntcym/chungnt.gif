package model;

import java.sql.Timestamp;

public class Payment {

	private int id;
	private Timestamp payment_time;
	private Timestamp issue_time;
	private float water_meter_value;
	private float price;

	public Payment(int id, Timestamp payment_time, Timestamp issue_time, float water_meter_value,float price) {
		super();
		this.id = id;
		this.payment_time = payment_time;
		this.issue_time = issue_time;
		this.water_meter_value = water_meter_value;
		this.price=price;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Payment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getPayment_time() {
		return payment_time;
	}

	public void setPayment_time(Timestamp payment_time) {
		this.payment_time = payment_time;
	}

	public Timestamp getIssue_time() {
		return issue_time;
	}

	public void setIssue_time(Timestamp issue_time) {
		this.issue_time = issue_time;
	}

	public float getWater_meter_value() {
		return water_meter_value;
	}

	public void setWater_meter_value(float water_meter_value) {
		this.water_meter_value = water_meter_value;
	}

}
