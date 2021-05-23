package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import dao.DistrictsDAO;
import model.*;

class TestDistrictDAO {

	@Test
	void testDistrictsDAOgetAllDistrict() throws Exception {
		DistrictsDAO districtsDAO = new DistrictsDAO();
		try {
			ArrayList<Districts> listDistrictsTest = districtsDAO.getAllDistrict();
			// Test if the returned arraylist is as same as in database
			for (Districts item : listDistrictsTest) {
				if (item.getId() == 1) {
					assertTrue(item.getName().equals("Hà Đông"));
				} else if (item.getId() == 2) {
					assertTrue(item.getName().equals("Thanh Xuân"));
				} else if (item.getId() == 3) {
					assertTrue(item.getName().equals("Hoàn Kiếm"));
				} else if (item.getId() == 4) {
					assertTrue(item.getName().equals("Hoàng Mai"));
				} else if (item.getId() == 5) {
					assertTrue(item.getName().equals("Ba Đình"));
				} else {
					return;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
