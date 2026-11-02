package org.example.Seliniuim;

import io.github.bonigarcia.wdm.WebDriverManager;
import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Amazon {
  public static void main(String[] args) {
    // Setup ChromeDriver automatically
    WebDriverManager.chromedriver().setup();
    WebDriver driver = new ChromeDriver();
    WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

    try {
      // Step 1: Navigate to Amazon
      driver.get("https://www.amazon.com/");
      driver.manage().window().maximize();

      // Step 2: Click "Sign in"
      WebElement signInButton =
          wait.until(ExpectedConditions.elementToBeClickable(By.id("nav-link-accountList")));
      signInButton.click();

      // Step 3: Click "Create your Amazon account"
      WebElement createAccountButton =
          wait.until(ExpectedConditions.elementToBeClickable(By.id("createAccountSubmit")));
      createAccountButton.click();

      // Step 4: Fill in registration details
      WebElement nameInput =
          wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("ap_customer_name")));
      nameInput.sendKeys("John Doe");

      WebElement emailInput = driver.findElement(By.id("ap_email"));
      emailInput.sendKeys("testuser@example.com");

      WebElement passwordInput = driver.findElement(By.id("ap_password"));
      passwordInput.sendKeys("password123");

      WebElement confirmPasswordInput = driver.findElement(By.id("ap_password_check"));
      confirmPasswordInput.sendKeys("password123");

      // Step 5: Click "Create your Amazon account"
      WebElement finalCreateAccountButton = driver.findElement(By.id("continue"));
      finalCreateAccountButton.click();

      // Step 6: Verification (Amazon usually requires OTP/CAPTCHA)
      try {
        WebElement successMessage =
            wait.until(
                ExpectedConditions.visibilityOfElementLocated(By.className("a-alert-heading")));
        System.out.println("User registration successful: " + successMessage.getText());
      } catch (Exception e) {
        System.out.println("Registration likely requires CAPTCHA/OTP or failed.");
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      driver.quit();
    }
  }
}
