package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Customer;

public class CustomerDAO extends DAO{
	private final Connection connection = getConnection();
	private static final String GET_ALL_ADDRESS = "SELECT * FROM `tblcustomer`;";
	public ArrayList<Customer> getAddress() throws SQLException {
		try {
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ADDRESS);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<Customer> listCustomer = new ArrayList<>();
			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setId(resultSet.getInt("id"));
				customer.setAddress(resultSet.getString("address"));
				customer.setFullname(resultSet.getString("fullname"));
				listCustomer.add(customer);
			}
			
			return listCustomer;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	private static final String GET_ALL_BY_ID = "SELECT * FROM `tblcustomer` Where id=?;";
	public ArrayList<Customer> getAll(String ID) throws SQLException {
		try {
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BY_ID);
			preparedStatement.setString(1, ID);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<Customer> listCustomer = new ArrayList<>();
			while (resultSet.next()) {
				Customer customer = new Customer();
				customer.setId(resultSet.getInt("id"));
				customer.setAddress(resultSet.getString("address"));
				customer.setEmail(resultSet.getString("email"));
				customer.setFullname(resultSet.getString("fullname"));
				listCustomer.add(customer);
			}
			
			return listCustomer;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Connection getDAOConnection() {
		return this.connection;
	}
}
