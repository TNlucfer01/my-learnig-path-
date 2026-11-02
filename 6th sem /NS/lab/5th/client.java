import java.io.*;
import java.security.*;
import java.security.cert.Certificate;
import javax.net.ssl.*;

public class client {
  public static void main(String[] args) throws Exception {
    // Set truststore
    System.setProperty("javax.net.ssl.trustStore", "serverkeystore.jks");
    System.setProperty("javax.net.ssl.trustStorePassword", "changeit");
    SSLSocketFactory sf = (SSLSocketFactory) SSLSocketFactory.getDefault();
    SSLSocket socket = (SSLSocket) sf.createSocket("localhost", 9999);
    ObjectInputStream in = new ObjectInputStream(socket.getInputStream());
    String message = in.readUTF();
    int sigLen = in.readInt();
    byte[] sigBytes = new byte[sigLen];
    in.readFully(sigBytes);
    System.out.println("Received message: " + message);
    // Load public key
    KeyStore keyStore = KeyStore.getInstance("JKS");
    keyStore.load(new FileInputStream("serverkeystore.jks"), "changeit".toCharArray());
    Certificate cert = keyStore.getCertificate("serverkey");
    PublicKey publicKey = cert.getPublicKey();
    Signature verifier = Signature.getInstance("SHA256withRSA");
    verifier.initVerify(publicKey);
    verifier.update(message.getBytes());
    boolean verified = verifier.verify(sigBytes);
    System.out.println("Signature verified: " + verified);
    in.close();
    socket.close();
  }
}
