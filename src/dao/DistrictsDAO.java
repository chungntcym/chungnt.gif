package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Districts;
public class DistrictsDAO extends DAO {
	private static final String GET_ALL_ADDRESS = "SELECT * FROM `tbldistrict`;";
	public ArrayList<Districts> getAllDistrict() throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ADDRESS);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<Districts> listDistricts = new ArrayList<>();
			while (resultSet.next()) {
				Districts districts = new Districts();
				districts.setId(resultSet.getInt("id"));
				districts.setName(resultSet.getString("name"));
				listDistricts.add(districts);
				
			}
			
			return listDistricts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
