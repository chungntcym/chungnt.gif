package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.TKPayment;

public class TKPaymentDAO extends DAO {

	private static final String GET_PAYMENT_STATISTICAL	 = "SELECT * FROM  `tblpayment`, `tblcontracttype`, `tblcustomer` "
			+ "WHERE tblcontracttype.id = tblcustomer.tblContractTypeid AND tblcustomer.id = tblCustomerid "
			+ "AND tblpayment.payment_time IS NULL;";

	public ArrayList<TKPayment> getPaymentStats() throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_PAYMENT_STATISTICAL);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<TKPayment> listTkPayment = new ArrayList<>();
			while(resultSet.next()) {
				TKPayment item = new TKPayment();
				item.setId(resultSet.getInt("tblCustomerid"));
				item.setFullname(resultSet.getString("fullname"));
				item.setAddress(resultSet.getString("address"));
				item.setType(resultSet.getString("type"));
				item.setWaterMeterValue(resultSet.getInt("water_meter_value"));
				item.setPrice(resultSet.getFloat("price"));
				item.setPaymentTime(resultSet.getTimestamp("payment_time"));
				listTkPayment.add(item);
			}
			return listTkPayment;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
