package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.TKContract;

public class TKContractDAO extends DAO {
	public  TKContractDAO(){
		super();
	}
	
	private static final String GET_ALL_CONTRACT = "select b.id, b.fullname, b.address, b.phonenumber, b.identityNumber, b.email, a.type from tblcontracttype a, tblcustomer b where b.tblcontractTypeid = a.id;";
	
	public ArrayList<TKContract> getAllContract() throws SQLException{
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_CONTRACT);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<TKContract> listContract = new ArrayList<TKContract>();
			while(resultSet.next()) {
				TKContract contract = new TKContract();
				contract.setId(resultSet.getInt("id"));
				contract.setFullname(resultSet.getString("fullname"));
				contract.setAddress(resultSet.getString("address"));
				contract.setPhonenumber(resultSet.getString("phonenumber"));
				contract.setIdentityNumber(resultSet.getString("identityNumber"));
				contract.setEmail(resultSet.getString("email"));
				contract.setLoaihopdong(resultSet.getString("type"));
				listContract.add(contract);
			}
			return listContract;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
