package testdao;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.jupiter.api.Test;

import dao.TKContractDAO;
import model.TKContract;

class TestTKContractDAO {

	@Test
	void testTKContractDAO() {
		TKContractDAO tkContractDAO = new TKContractDAO();
		
		try {
			ArrayList<TKContract> listTK = tkContractDAO.getAllContract();
			assertTrue(listTK.size() == 4);
			for (TKContract item: listTK) {
				if (item.getId() == 1) {
					assertTrue(item.getFullname().equals("Trần Ngọc Nam Anh"));
					assertTrue(item.getAddress().equals("Số nhà 1 ngõ 12 Đường Chùa Bộc"));
					assertTrue(item.getPhonenumber().equals("0123456789"));
					assertTrue(item.getIdentityNumber().equals("101355975"));
					assertTrue(item.getEmail().equals("AnhTN@email.com"));
					assertTrue(item.getLoaihopdong().equals("hộ dân cư"));
				}
				if (item.getId() == 2) {
					assertTrue(item.getFullname().equals("Vũ Tuấn Anh"));
					assertTrue(item.getAddress().equals("Bắc Giang"));
					assertTrue(item.getPhonenumber().equals("0987654321"));
					assertTrue(item.getIdentityNumber().equals("101369745"));
					assertTrue(item.getEmail().equals("AnhVT@email.com"));
					assertTrue(item.getLoaihopdong().equals("hộ nghèo"));
				}
				if (item.getId() == 3) {
					assertTrue(item.getFullname().equals("Nguyễn Vũ Chiến"));
					assertTrue(item.getAddress().equals("Quảng Ninh"));
					assertTrue(item.getPhonenumber().equals("0123459876"));
					assertTrue(item.getIdentityNumber().equals("101323698"));
					assertTrue(item.getEmail().equals("ChienNV@email.com"));
					assertTrue(item.getLoaihopdong().equals("hộ dân cư"));
				}
				if (item.getId() == 4) {
					assertTrue(item.getFullname().equals("Nguyễn Thành Chung "));
					assertTrue(item.getAddress().equals("Hưng Yên"));
					assertTrue(item.getPhonenumber().equals("0987612345"));
					assertTrue(item.getIdentityNumber().equals("101254795"));
					assertTrue(item.getEmail().equals("ChungNT@email.com"));
					assertTrue(item.getLoaihopdong().equals("hộ dân cư"));
				}
	
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		

	}

}
