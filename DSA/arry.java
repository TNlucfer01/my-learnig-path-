import java.util.Arrays;

public class arry {
  public static void main(String[] args) {
    int nums[] = {3, 2, 1};
    int n = nums.length;
    int max = Arrays.stream(nums).max().getAsInt();
    if (nums[0] == max) {
      Arrays.sort(nums);
    } else {

      int j = nums[n - 1];
      nums[n - 1] = nums[n - 2];
      nums[n - 2] = j;
    }
    System.out.println(n);
    for (int i : nums) {
      System.out.println(i);
    }
  }
}
