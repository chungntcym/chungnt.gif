package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.ContractType;

public class ContractTypeDAO extends DAO {
	private static final String GET_ALL_CONTRACTTYPE = "SELECT * FROM `tblcontracttype`;";

	public ArrayList<ContractType> getAllContractType() throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_CONTRACTTYPE);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<ContractType> listContractType = new ArrayList<>();
			while (resultSet.next()) {
				ContractType contractType = new ContractType();
				contractType.setId(resultSet.getInt("id"));
				contractType.setType(resultSet.getString("type"));
				listContractType.add(contractType);
				
			}
			
			return listContractType;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
