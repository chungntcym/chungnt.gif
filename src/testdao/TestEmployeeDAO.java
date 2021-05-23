package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.ContractTypeDAO;
import dao.EmployeeDAO;
import model.ContractType;
import model.Employee;

class TestEmployeeDAO {

	@Test
	void testCheckSignupEmployee() throws SQLException {
		EmployeeDAO employeeDAO = new EmployeeDAO();
		Connection connection = employeeDAO.getDAOConnection();
		connection.setAutoCommit(false);
		
		try {
			Employee e = new Employee();
			e.setUsername("admin1");
			e.setFullname("Nguyễn Văn A");
			e.setPassword("1");
			e.setAddress("Hà Nội");
			e.setPhonenumber("0981237645");
			assertTrue(employeeDAO.checkSignup(e) == true);
			
			Employee e1 = employeeDAO.checkSignin(e);		
			
			assertTrue(e.getFullname().equals(e1.getFullname()));
			assertTrue(e.getAddress().equals(e1.getAddress()));
			assertTrue(e.getPhonenumber().equals(e1.getPhonenumber()));
			
		} finally {
			connection.rollback();
			connection.close();
		}
	}
	
	@Test
	void testCheckSigninEmployee() throws SQLException {
		EmployeeDAO employeeDAO = new EmployeeDAO();
		Connection connection = employeeDAO.getDAOConnection();
		connection.setAutoCommit(false);
		
		try {
			Employee e = new Employee();
			e.setUsername("admin");
			e.setPassword("1");
			e = employeeDAO.checkSignin(e);
			
			assertEquals("quan_ly", e.getPosition());
			assertEquals("0123456789", e.getPhonenumber());
			assertEquals("manager", e.getFullname());
			assertEquals("Hà Nội",e.getAddress());
			
		} finally {
			connection.rollback();
			connection.close();
		}
	}

}
