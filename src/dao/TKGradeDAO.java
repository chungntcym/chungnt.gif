package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.TKGrade;

public class TKGradeDAO extends DAO {
	public  TKGradeDAO(){
		super();
	}
	
	private static final String GET_GRADE = "SELECT a.grade, a.value, a.price, a.startDate, b.type FROM tblgrade a join tblcontracttype b on a.tblContractTypeid = b.id where year(startDate) = year(?) order by a.startDate;";
	
	public ArrayList<TKGrade> getGradeByyear(Date year) throws SQLException{
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(GET_GRADE);
			preparedStatement.setDate(1, year);
			ResultSet resultSet = preparedStatement.executeQuery();
			ArrayList<TKGrade> listGrade = new ArrayList<TKGrade>();
			while(resultSet.next()) {
				TKGrade grade = new TKGrade();
				grade.setGrade(resultSet.getInt("grade"));
				grade.setValue(resultSet.getInt("value"));
				grade.setPrice(resultSet.getFloat("price"));
				grade.setStartDate(resultSet.getTimestamp("startDate"));
				grade.setLoaihopdong(resultSet.getString("type"));
				listGrade.add(grade);
			}	
			return listGrade;
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
}
