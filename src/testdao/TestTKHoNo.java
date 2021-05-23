package selenium_test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

class TestTKHoNo extends TestDriver{

	ChromeDriver driver = getDriver();
	
	@Test
	public void TestgetPaymentStats() {
		driver.get("http://localhost:8080/AquaFee");
		
		// Fill username and password sequentially with admin and admin
		WebElement username = driver.findElement(By.name("username"));
		username.sendKeys("admin");
		WebElement password = driver.findElement(By.name("password"));
		password.sendKeys("1");
		driver.findElement(By.id("btn_login")).click();
		driver.findElement(By.id("TK_Payment")).click();
		driver.findElement(By.name("back")).click();
		
		
		driver.close();
		
	}
}