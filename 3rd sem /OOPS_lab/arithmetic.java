import java.io.*;

public class arithmetic {
	public static void main(String args[])
			throws IOException {
		int a, b, c, d, e, ar, sr, mr, dr, modr;
		BufferedReader b1 = new BufferedReader(new InputStreamReader(System.in));
		a = Integer.parseInt(b1.readLine());
		b1.skip(9);
		b = 2;
		c = Integer.parseInt(b1.readLine());
		d = 5;
		e = 7;
		ar = a + b;
		sr = a - b;
		mr = c * d;
		dr = d / c;
		modr = a % d;
		System.out.println(
				"============================================================================================");
		System.out.println("DEVELOPED BY :AATHI S");
		System.out.println("REGISTER NO : 511523205002");

		System.out.println(
				"=============================================================================================");
		System.out.println("Addition od(a+b)=" + ar);
		System.out.println("Subraction of (a-b)=" + sr);
		System.out.println("multiplication of (c*d)= " + mr);
		System.out.println("Division of (d/c)=" + dr);
		System.out.println("modulus of (a%d)" + modr);
	}
}
