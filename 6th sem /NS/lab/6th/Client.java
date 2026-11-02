import java.io.*;
import java.net.*;

public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("127.0.0.1", 5000);

            PrintWriter output = new PrintWriter(
                    socket.getOutputStream(), true);

            output.println("Hello from client");
            output.println("This is a secret message");
            output.println("password=12345");

            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
