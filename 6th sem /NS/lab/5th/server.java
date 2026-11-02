import java.io.*;
import java.security.*;
import javax.net.ssl.*;

public class server {
  public static void main(String[] args) throws Exception {
    // Load keystore
    KeyStore keyStore = KeyStore.getInstance("JKS");
    keyStore.load(new FileInputStream("serverkeystore.jks"), "changeit".toCharArray());
    PrivateKey privateKey = (PrivateKey) keyStore.getKey("serverkey", "changeit".toCharArray());
    // Set system properties
    System.setProperty("javax.net.ssl.keyStore", "serverkeystore.jks");
    System.setProperty("javax.net.ssl.keyStorePassword", "changeit");
    // SSL Server setup
    SSLServerSocketFactory ssf = (SSLServerSocketFactory) SSLServerSocketFactory.getDefault();
    SSLServerSocket serverSocket = (SSLServerSocket) ssf.createServerSocket(9999);
    System.out.println("Server ready. Waiting for client...");
    SSLSocket client = (SSLSocket) serverSocket.accept();
    System.out.println("Client connected.");
    String message = "This is a secure message.";
    Signature signature = Signature.getInstance("SHA256withRSA");
    signature.initSign(privateKey);
    signature.update(message.getBytes());
    byte[] sigBytes = signature.sign();
    ObjectOutputStream out = new ObjectOutputStream(client.getOutputStream());
    out.writeUTF(message);
    out.writeInt(sigBytes.length);
    out.write(sigBytes);
    out.flush();
    System.out.println("Message and signature sent.");
    out.close();
    client.close();
    serverSocket.close();
  }
}
