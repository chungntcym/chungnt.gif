package testdao;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import org.junit.jupiter.api.Test;

import dao.CustomerDAO;
import model.ContractType;
import model.Customer;
import model.Grade;

class TestCustomerDAO {

	@Test
	void testCustomerDAOgetAddress() throws Exception {
		CustomerDAO customerDao = new CustomerDAO();
		try {
			ArrayList<Customer> listCustomerTest = customerDao.getAddress();
			//Test if the returned arraylist is as same as in database
			for(Customer item : listCustomerTest) {
				if(item.getId() == 1) {
					assertTrue(item.getFullname().equals("Trần Ngọc Nam Anh"));
					assertTrue(item.getAddress().equals("Số nhà 1 ngõ 12 Đường Chùa Bộc"));
				}
				if(item.getId() == 2) {
					assertTrue(item.getFullname().equals("Vũ Tuấn Anh"));
					assertTrue(item.getAddress().equals("Bắc Giang"));
				}
				if(item.getId() == 3) {
					assertTrue(item.getFullname().equals("Nguyễn Vũ Chiến"));
					assertTrue(item.getAddress().equals("Quảng Ninh"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testCustomerDAOgetAll1() throws Exception {
		CustomerDAO customerDao = new CustomerDAO();
		try {
			String id="1";
			ArrayList<Customer> listCustomerTest = customerDao.getAll(id);
			//Test if the returned arraylist is as same as in database
			assertTrue(listCustomerTest.get(0).getFullname().equals("Trần Ngọc Nam Anh"));
			assertTrue(listCustomerTest.get(0).getAddress().equals("Số nhà 1 ngõ 12 Đường Chùa Bộc"));
			assertTrue(listCustomerTest.get(0).getEmail().equals("AnhTN@email.com"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testCustomerDAOgetAll2() throws Exception {
		CustomerDAO customerDao = new CustomerDAO();
		try {
			String id="2";
			ArrayList<Customer> listCustomerTest2 = customerDao.getAll(id);
			//Test if the returned arraylist is as same as in database
			assertTrue(listCustomerTest2.get(0).getFullname().equals("Vũ Tuấn Anh"));
			assertTrue(listCustomerTest2.get(0).getAddress().equals("Bắc Giang"));
			assertTrue(listCustomerTest2.get(0).getEmail().equals("tuananhvubg1999@gmail.com"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Test
	void testCustomerDAOgetAll3() throws Exception {
		CustomerDAO customerDao = new CustomerDAO();
		try {
			String id="3";
			ArrayList<Customer> listCustomerTest3 = customerDao.getAll(id);
			//Test if the returned arraylist is as same as in database
			assertTrue(listCustomerTest3.get(0).getFullname().equals("Nguyễn Vũ Chiến"));
			assertTrue(listCustomerTest3.get(0).getAddress().equals("Quảng Ninh"));
			assertTrue(listCustomerTest3.get(0).getEmail().equals("leanhtuanltv1999@gmail.com"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
