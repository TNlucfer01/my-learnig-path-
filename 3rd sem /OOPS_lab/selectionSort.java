package selectionsort;
public class selectionSort
{
public static void SelectionSort(int[] list)
{
int min,temp;
for(int outer = 0; outer < list.length-1; outer ++)
{
min = outer;
for(int inner = outer+1; inner < list.length; inner ++)
{
if(list[inner] < list[min])
{
min = inner;
}
}
temp = list[outer];
list[outer] = list[min];
list[min] = temp;
}
}
public static void main(String[] args)
{
int a[] = {4,5,7,10,20,90,100,45,32,45};
System.out.println("==================================================================");
System.out.println("DEVELOPED BY:AATHI S");
System.out.println("REGISTER NO: 511523205002");
System.out.println("==================================================================");
System.out.println("Before Sorting");
for(int val:a)
System.out.println(val+"");
SelectionSort(a);
System.out.println("After sorting");
for(int val:a)
System.out.println(val+"");
}
}