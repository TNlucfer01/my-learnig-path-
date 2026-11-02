import java.nio.charset.StandardCharsets;
import java.security.*;
import java.util.Base64;

public class DSE {
  public static void main(String[] args) throws Exception {
    String message = "Hello, this is a message for digital signature!";
    System.out.println("Original Message: " + message);
    // Generate RSA key pair
    KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
    keyPairGenerator.initialize(2048); // Key size
    KeyPair keyPair = keyPairGenerator.generateKeyPair();
    // Create a digital signature using the private key
    Signature signature = Signature.getInstance("SHA256withRSA");
    signature.initSign(keyPair.getPrivate());
    signature.update(message.getBytes(StandardCharsets.UTF_8));
    byte[] digitalSignature = signature.sign();
    System.out.println(
        "Digital Signature: " + Base64.getEncoder().encodeToString(digitalSignature));
    // Verify the digital signature using the public key
    Signature verifier = Signature.getInstance("SHA256withRSA");
    verifier.initVerify(keyPair.getPublic());
    verifier.update(message.getBytes(StandardCharsets.UTF_8));
    boolean isVerified = verifier.verify(digitalSignature);
    // Output verification result
    if (isVerified) {
      System.out.println("Digital Signature Verified: The message is authentic.");
    } else {
      System.out.println(
          "Digital Signature Verification Failed: The message may be tampered with.");
    }
  }
}
