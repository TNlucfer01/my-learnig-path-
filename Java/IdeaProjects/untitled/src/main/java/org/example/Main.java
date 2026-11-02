package org.example;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import io.github.bonigarcia.wdm.WebDriverManager;

public class Main {
    public static void main(String[] args) {
        // Automatically setup ChromeDriver
        WebDriverManager.chromedriver().setup();

        // Create driver instance
        WebDriver driver = new ChromeDriver();

        // Navigate to website
        driver.get("https://www.google.com");

        // Print title
        System.out.println("Page title is: " + driver.getTitle());

        // Close browser
        driver.quit();
    }
}
