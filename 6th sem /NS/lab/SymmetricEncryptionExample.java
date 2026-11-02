import java.nio.charset.StandardCharsets;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class SymmetricEncryptionExample {
  public static void main(String[] args) throws Exception {
    String plaintext = "Hello, symmetric encryption!";
    System.out.println("Original Text: " + plaintext);
    // Generate a secret AES key
    KeyGenerator keyGen = KeyGenerator.getInstance("AES");
    keyGen.init(256); // AES key size (can also be 192 or 256 if supported)
    SecretKey secretKey = keyGen.generateKey();
    // Initialize cipher for encryption
    Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
    cipher.init(Cipher.ENCRYPT_MODE, secretKey);
    byte[] encryptedBytes = cipher.doFinal(plaintext.getBytes(StandardCharsets.UTF_8));
    String encryptedText = Base64.getEncoder().encodeToString(encryptedBytes);
    System.out.println("Encrypted Text: " + encryptedText);
    // Initialize cipher for decryption
    cipher.init(Cipher.DECRYPT_MODE, secretKey);
    byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
    String decryptedText = new String(decryptedBytes, StandardCharsets.UTF_8);
    System.out.println("Decrypted Text: " + decryptedText);
  }
}
