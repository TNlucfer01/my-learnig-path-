public class validsud {

  public boolean isValidSudoku(char[][] board) {

    return false;
  }

  boolean columncheck(char[][] board, int[] co) {
    int count = 0;
    for (int i = 0; i < board[co[0]].length; i++) {
      if (board[co[0]][i] == board[co[0]][co[1]]) {
        count += 1;
      }
    }
    for (int i = 0; i < 9; i++) {
      if (board[co[1] + i][co[0]] == board[co[0]][co[1]]) {
        count += 1;
      }
    }
    if (count == 1) {
      return true;
    }

    return false;
  }

  boolean boxcheck(char[][] board, int[] co) {}
}
