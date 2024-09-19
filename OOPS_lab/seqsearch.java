package seqsearh;
public class seqsearch
{
public static int search(int arr[], int x)
{
int n = arr.length;
for (int i = 0; i < n; i++)
{
if (arr[i] == x)
return i;
}
return -1;
}
public static void main(String args[])
{
System.out.println("==================================================================");
System.out.println("DEVELOPED BY:AATHI S");
System.out.println("REGISTER NO:511523205002");
System.out.println("===================================================================");
int arr[] = { 2, 3, 4, 10, 40 };
int x = 10;
int result = search(arr, x);
if (result == -1)
System.out.print("Element is not present in array");
else
System.out.print("Element is present"+ " at index "+ result);
}
}