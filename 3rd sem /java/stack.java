import java.io.*;

class stak{
    int top;
    int size;
    int[] arr;
    public stak(int n){
        size=n;
        arr=new int[size];
        top=-1;
        }
    public void  push(int data){
        if(top<size-1){
            arr[++top]=data;
            }
            else
            System.out.println("Stack is full");
            }
    public int pop(){
        if(top>=0){
            int a =arr[top];
            top--;
            return a;
        }
        else{
            System.out.println("Stack is empty");
            return -1;
        }


}
public  void display(){
    for(int i=top;i>=0;i--){
        System.out.println(arr[i]);
        }
        
}
}
public class stack{
    public static void main(String[] args) {
 
        stak s = new stak(5);
        s.push(10);
        s.push(20);
        s.push(30);
        s.push(40);
        s.push(50);
        s.push(60);
        s.display();
        
    }
}
