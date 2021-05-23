package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.*;
import model.*;

class TestSubDistrictDAO {

	@Test
	void testSubDistrictDAOgetAllSubDistrict1() throws Exception {
		SubDistrictDAO 	subDistrictDAO = new 	SubDistrictDAO();
		try {
			String id="1";
			ArrayList<SubDistrict> listSubDistrictsTest1 = 	subDistrictDAO.getAllSubDistrictById(id);
			//Test if the returned arraylist is as same as in database
			System.out.print(listSubDistrictsTest1.get(0).getName());
			assertTrue(listSubDistrictsTest1.get(0).getName().equals("Mộ Lao"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testSubDistrictDAOgetAllSubDistrict2() throws Exception {
		SubDistrictDAO 	subDistrictDAO = new 	SubDistrictDAO();
		try {
			String id="2";
			ArrayList<SubDistrict> listSubDistrictsTest2 = 	subDistrictDAO.getAllSubDistrictById(id);
			assertTrue(listSubDistrictsTest2.get(0).getName().equals("Hạ Đình"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testSubDistrictDAOgetAllSubDistrict3() throws Exception {
		SubDistrictDAO 	subDistrictDAO = new 	SubDistrictDAO();
		try {
			String id="3";
			ArrayList<SubDistrict> listSubDistrictsTest3 = 	subDistrictDAO.getAllSubDistrictById(id);
			assertTrue(listSubDistrictsTest3.get(0).getName().equals("Định Công"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testSubDistrictDAOgetAllSubDistrict4() throws Exception {
		SubDistrictDAO 	subDistrictDAO = new 	SubDistrictDAO();
		try {
			String id="4";
			ArrayList<SubDistrict> listSubDistrictsTest4 = 	subDistrictDAO.getAllSubDistrictById(id);
			assertTrue(listSubDistrictsTest4.get(0).getName().equals("Cửa Đông"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
