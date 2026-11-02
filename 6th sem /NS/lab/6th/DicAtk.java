import java.io.*;

public class DicAtk {
  public static void main(String[] args) {
    String username = "user123";
    String dictionaryFile = "passwords.txt";
    boolean accessGranted = false;
    try (BufferedReader reader = new BufferedReader(new FileReader(dictionaryFile))) {
      String password;
      while ((password = reader.readLine()) != null) {
        System.out.println("Trying password: " + password); // Debug output
        if (authenticate(username, password)) {
          System.out.println(
              "Access granted for username: " + username + " with password: " + password);
          accessGranted = true;
          break;
        }
      }
    } catch (IOException e) {
      System.out.println("Error reading file: " + dictionaryFile);
      e.printStackTrace();
    }
    if (!accessGranted) {
      System.out.println("Dictionary attack failed. Access not granted.");
    }
  }

  private static boolean authenticate(String username, String password) {
    return password.equals("123456");
  }
}
