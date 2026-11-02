import java.util.Collections;
import java.util.List;

public class processorTime {

  public static void main(String[] args) {}

  public int minProcessingTime(List<Integer> processorTime, List<Integer> tasks) {
    Collections.sort(processorTime);
    Collections.sort(tasks, Collections.reverseOrder());
    int ans = 0;
    for (int i = 0; i < processorTime.length; i++) {
      ans = Math.max(ans, (processorTime.get(i) + tasks.get(i * 4)));
    }
    return ans;
  }
}
