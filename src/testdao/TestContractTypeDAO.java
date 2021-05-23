package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.ContractTypeDAO;
import model.ContractType;

class TestContractTypeDAO {

	@Test
	void testContractTypeDAO() {
		ContractTypeDAO contractTypeDAO = new ContractTypeDAO();
		
		try {
			ArrayList<ContractType> listContractTypes = contractTypeDAO.getAllContractType();
			//Test if the returned arraylist is as same as in database
			for(ContractType item : listContractTypes) {
				if(item.getId() == 1) {
					assertTrue(item.getType().equals("hộ nghèo"));
				}
				if(item.getId() == 2) {
					assertTrue(item.getType().equals("hộ dân cư"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
