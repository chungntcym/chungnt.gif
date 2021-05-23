package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.TKGradeDAO;
import model.TKContract;
import model.TKGrade;

class TestTKGradeDAO {

	@Test
	void testGetGradeByyear() {
		TKGradeDAO tkGradeDAO = new TKGradeDAO();
		try {
			Date date = new Date(2021);
			ArrayList<TKGrade> listGrade = tkGradeDAO.getGradeByyear(date);
			for (TKGrade item : listGrade) {
				if (item.getId() == 42) {
					assertEquals(1, item.getGrade());
					assertEquals(1, item.getValue());
					assertEquals(40000, item.getPrice());
					assertEquals("hộ dân cư", item.getLoaihopdong());
				}
				if (item.getId() == 43) {
					assertEquals(1, item.getGrade());
					assertEquals(1, item.getValue());
					assertEquals(40000, item.getPrice());
					assertEquals("hộ nghèo", item.getLoaihopdong());
				}
				if (item.getId() == 44) {
					assertEquals(2, item.getGrade());
					assertEquals(6, item.getValue());
					assertEquals(50000, item.getPrice());
					assertEquals("hộ dân cư", item.getLoaihopdong());
				}
				if (item.getId() == 45) {
					assertEquals(3, item.getGrade());
					assertEquals(10, item.getValue());
					assertEquals(100000, item.getPrice());
					assertEquals("hộ dân cư", item.getLoaihopdong());
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
