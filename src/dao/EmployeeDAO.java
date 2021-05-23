package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Employee;

public class EmployeeDAO extends DAO {

	private final Connection connection = getConnection();
	
	private static final String INSERT_EMPLOYEE = "INSERT INTO `tblemployee` "
			+ "(`id`, `username`, `password`, `fullname`, `address`, `phonenumber`, `position`) "
			+ "VALUES (NULL, ?, ?, ?, ?, ?, ?);";

	private static final String GET_EMPLOYEE_BY_USERNAME_AND_PASSWORD = "SELECT * FROM `tblemployee` WHERE `username` = ? AND `password` = ?";

	private static final String GET_EMPLOYEE_BY_USERNAME = "SELECT * FROM `tblemployee` WHERE `username` = ?";

	public boolean checkSignup(Employee employee) throws SQLException {
		try {	
			// try-with-resource statement will auto close the connection.
			// Check if username is duplicate or not
			PreparedStatement preparedStatement = connection.prepareStatement(GET_EMPLOYEE_BY_USERNAME);
			preparedStatement.setString(1, employee.getUsername());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() == false) {
				// Found no member with the same username => Insert new member
				preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
				preparedStatement.setString(1, employee.getUsername());
				preparedStatement.setString(2, employee.getPassword());
				preparedStatement.setString(3, employee.getFullname());
				preparedStatement.setString(4, employee.getAddress());
				preparedStatement.setString(5, employee.getPhonenumber());
				preparedStatement.setString(6, "nhan_vien");
				preparedStatement.executeUpdate();
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Employee checkSignin(Employee employee) throws SQLException {
		try {
			// Check if username is duplicate or not
			PreparedStatement preparedStatement = connection.prepareStatement(GET_EMPLOYEE_BY_USERNAME_AND_PASSWORD);
			preparedStatement.setString(1, employee.getUsername());
			preparedStatement.setString(2, employee.getPassword());
			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next() != false) {
				do {
					employee.setId(resultSet.getInt("id"));
					employee.setAddress(resultSet.getString("address"));
					employee.setFullname(resultSet.getString("fullname"));
					employee.setPhonenumber(resultSet.getString("phonenumber"));
					employee.setPosition(resultSet.getString("position"));
					
				} while (resultSet.next());
				return employee;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Connection getDAOConnection() {
		return this.connection;
	}
	
}
