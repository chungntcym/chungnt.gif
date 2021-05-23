package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.SubDistrict;
public class SubDistrictDAO extends DAO{
	private static final String GET_ALL_SUBDISTRICT = "SELECT * FROM `tblsubdistrict` where id=?;";
	
	public ArrayList<SubDistrict> getAllSubDistrictById(String ID) throws SQLException {
		try {
			Connection connection = getConnection();
			// try-with-resource statement will auto close the connection.
			PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_SUBDISTRICT);
			preparedStatement.setString(1, ID);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<SubDistrict> listSubDistricts = new ArrayList<>();
			while (resultSet.next()) {
				SubDistrict subdistricts = new SubDistrict();
				subdistricts.setId(resultSet.getInt("id"));
				subdistricts.setName(resultSet.getString("name"));
				listSubDistricts.add(subdistricts);
				
			}
			
			return listSubDistricts;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
