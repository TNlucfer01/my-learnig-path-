import java.util.*;
public class arithmetic_float{
public static void main(String args[]){
        float a,b,c,d,e,ar,sr,mr,dr,modr;
        a=10;
	Scanner scn =new Scanner(System.in);
        b=scn.nextInt();
        c=4;
        d=5;
        e=7;
        ar=a+b;
        sr=a-b;
        mr=c*d;
        dr=d/c;
        modr=a%d;
        System.out.println("============================================================================================");
        System.out.println("DEVELOPED BY :AATHI S");
        System.out.println("REGISTER NO : 511523205002");
        System.out.println("=============================================================================================");
        System.out.println("Addition od(a+b)="+ar);
        System.out.println("Subraction of (a-b)="+sr);
        System.out.println("multiplication of (c*d)= "+mr);
        System.out.println("Division of (d/c)="+dr);
        System.out.println("modulus of (a%d)"+modr);
}
}
