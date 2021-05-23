package testdao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.TKPaymentDAO;
import model.TKPayment;

class TestTKPaymentDAO {

	@Test
	void testGetPaymentStats() {
		TKPaymentDAO testDAO = new TKPaymentDAO();
		try {
			ArrayList<TKPayment> listTKPayment = testDAO.getPaymentStats();
			for (TKPayment item : listTKPayment) {
				if (item.getId() == 3) {
					assertEquals(item.getFullname().trim(), "Nguyễn Vũ Chiến");
					assertEquals(item.getAddress().trim(), "Quảng Ninh");
					assertEquals(item.getType().trim(), "hộ dân cư");
					assertEquals(item.getWaterMeterValue(), 8);
					assertEquals(item.getPrice(), 503200.0);
				}
				if (item.getId() == 4) {
					assertEquals(item.getFullname().trim(), "Nguyễn Thành Chung");
					assertEquals(item.getAddress().trim(), "Hưng Yên");
					assertEquals(item.getType().trim(), "hộ dân cư");
					assertEquals(item.getWaterMeterValue(), 20);
					assertEquals(item.getPrice(), 1258000.0);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
