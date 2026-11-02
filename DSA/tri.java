public class tri {

  public static void main(String[] args) {}

  static triangle(List<List<Integer>> triangle) {

    for (int i = triangle.size() - 2; i > -1; i--) {
      for (int j = 0; j < triangle.get(i).size(); j++) {
        triangle
            .get(
                i) // we have to use the getter and setter function to get the value at  aparticular
                   // place in a lisy
            .set(
                j,
                Math.min(
                    (triangle.get(i + 1).get(j) + triangle.get(i).get(j)),
                    (triangle.get(i + 1).get(j + 1) + triangle.get(i).get(j))));
      }
    }
  }
}
