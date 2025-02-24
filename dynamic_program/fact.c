#include<stdio.h>
#include<stdlib.h>
 

int fact(int n ){
int dp[n];
dp[0]=1;

for(int i=1;i<=n;i++){
dp[i]=dp[i-1]*i;
}
return dp[n];

}

int main(){
int n = fact(6);
printf("%d",n);
}
