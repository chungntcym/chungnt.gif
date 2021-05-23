package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.PaymentDAO;
import model.Payment;

class TestPaymentDAO {

	@Test
	void testPaymentDAOgetInvoiceByCusId() {
		PaymentDAO paymentDAO = new PaymentDAO();
		try {
			ArrayList<Payment> listPayment = paymentDAO.getInvoiceByCusId(3);
			assertTrue(listPayment.size() == 3);
			assertEquals(3, listPayment.get(0).getId());
			assertEquals(7, listPayment.get(1).getId());
			assertEquals(11, listPayment.get(2).getId());

			assertEquals(null, listPayment.get(0).getPayment_time());			
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Test
	void testPaymentDAOgetPaymentbyId() throws Exception {
		PaymentDAO paymentDao = new PaymentDAO();
		try {
			float so = 8.0f;
			float sonuoc = 503200.0f;
			int ids=3;
			String id="3";
			ArrayList<Payment> listPaymentTest1 = 	paymentDao.getPaymentbyId(id);
			System.out.print(listPaymentTest1.get(0).getWater_meter_value());
			assertEquals(listPaymentTest1.get(0).getId(),ids);
			assertEquals(listPaymentTest1.get(0).getWater_meter_value(),so);
			assertEquals(listPaymentTest1.get(0).getPrice(),sonuoc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
