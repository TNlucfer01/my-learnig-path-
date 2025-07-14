import java.util.*;
   class animal{
      protected  int n;
       protected char a;
        void set(int n ,char a){
            this.n=n;this.a=a;
        }
        void get(){
            System.out.println(" the name is "+n+"\t"+a);
        }
    }
public class instanceo {
    
    public static void main(String[] args) {
        animal a=new animal();
        
        a.set(1,'a');
        boolean b =a instanceof animal;
        System.out.println(b);
    } 
}
