package insertionsort;
public class insertionsort
{
public static void InsertionSort(int[] list)
{
for(int outer = 1; outer < list.length; outer++)
{
int position = outer;
int key = list[position];
while(position > 0 && list[position -1] < key)
{
list[position] = list[position -1];
position--;
}
list[position] = key;
}
}
public static void main(String[] args)
{
int a[] = {4,5,7,10,20,90,100,45,32,44};
System.out.println("=================================================================");
System.out.println("DEVELOPED BY:aathi s"); 
System.out.println("REGISTER NO :511523205002");
System.out.println("=================================================================");
System.out.println("Before insertion sorting");
for(int b : a)
System.out.println(b);
InsertionSort(a);
System.out.println("After insertion sorting");
for(int b : a)
System.out.println(b);
}
}