public class private_public
{
private int v1,v2;
public int add()
{
return(v1=v2);
}
public int sub()
{
return(v1-v2);
}
public int multi()
{
return(v1*v2);
}
public int div()
{
return(v1/v2);
}
public int mod()
{
return(v1%v2);
}
public static void main(String[] args)
{
private_public ab = new private_public();
ab.v1=45;
ab.v2=56;
System.out.println("==============================================================");
System.out.println("DEVELOPED BY: AATHI S");
System.out.println("REGISTER NO: 511521104051");
System.out.println("=============================================================");
System.out.println("addition="+ab.add());
System.out.println("subtraction="+ab.sub());
System.out.println("multiplication="+ab.multi());
System.out.println("division="+ab.div());
System.out.println("remainder="+ab.mod());
}
}