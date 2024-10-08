#include<stdio.h>
#include<stdlib.h>

struct  box { 

    char a[3][3];   // Structure to represent the Tic-Tac-Toe board
    char user;  
};

/**
 * Function: display
 * -----------------
 * Displays the Tic-Tac-Toe board with clear formatting.
 *
 * @param a: The 2D array representing the current state of the board.
 */void display(char a[3][3]){
    printf("%c | %c | %c\n", a[0][0], a[0][1], a[0][2]);
    printf("-----------\n");
    printf("%c | %c | %c\n", a[1][0], a[1][1], a[1][2]);
    printf("-----------\n");
    printf("%c | %c | %c\n", a[2][0], a[2][1], a[2][2]);
}

/**
 * Function: is_filled
 * -------------------
 * Checks if a particular position on the board is already occupied.
 *
 * @param a: The character at the board position (either 'X', 'O', or ' ').
 * @return: Returns -1 if the position is filled, 0 if it is empty.
 */
int is_filled(char a){
    if (a != ' ') {
        return -1;  // Position is filled
    } else {
        return 0;  // Position is empty
    }
}

/**
 * Function: decodethein
 * ---------------------
 * Converts a user input number (1-9) into row and column coordinates on the board.
 *
 * @param a1: The user input (between 1 and 9) representing the board position.
 * @param row: Pointer to store the corresponding row number.
 * @param col: Pointer to store the corresponding column number.
 */
void decodethein(int a1, int* row, int* col){
    switch (a1) {
        case 1:
            *row = 0;
            *col = 0;
            break;
        case 2:
            *row = 0;
            *col = 1;
            break;
        case 3:
            *row = 0;
            *col = 2;
            break;
        case 4:
            *row = 1;
            *col = 0;
            break;
        case 5:
            *row = 1;
            *col = 1;
            break;
        case 6:
            *row = 1;
            *col = 2;
            break;
        case 7:
            *row = 2;
            *col = 0;
            break;
        case 8:
            *row = 2;
            *col = 1;
            break;
        case 9:
            *row = 2;
            *col = 2;
            break;
        default:
            printf("Enter a valid position.\n");
            break;
    }
}

/**
 * Function: getinput
 * ------------------
 * Takes input from the user, validates the move, and updates the board accordingly.
 *
 * @param Z: The structure containing the board and current player information.
 * @return: Returns 0 if successful, -1 if the input is invalid.
 */
int get_input(struct box*  Z){

    int status, a1, row, col;
    
    // Get user input
    start:
        printf("Enter the move between 1 and 9: ");
        scanf("%d", &a1);

        // Check if the input is within valid range
        if (a1 > 9 || a1 < 1) {
            printf("Enter a valid move.\n");
            goto start;  // Re-prompt for input
        }

        // Decode the input into row and column
        decodethein(a1, &row, &col);

        // Check if the position is already filled
        status = is_filled(Z->a[row][col]);
        
        if (status == 0) {  // Position is empty
            if (Z->user == 1) {
                Z->a[row][col] = 'X';  // Player 1's move
            } else {
                Z->a[row][col] = 'O';  // Player 2's move
            }
        } else {
            printf("This position is already filled.\n");
            goto start;  // Re-prompt for input
        }
    return 0;
}

/**
 * Function: changing_user
 * -----------------------
 * Switches the turn to the other player.
 *
 * @param user: The current player (1 for 'X', 2 for 'O').
 */
void changing_user(int* user){
    *user = (*user == 1) ? 2 : 1;  // Switch user between 1 and 2
}

/**
 * Function: isfull
 * ----------------
 * Checks if the board is fully occupied.
 *
 * @param a: The 2D array representing the board.
 * @return: Returns 1 if the board is full, 0 otherwise.
 */
int isfull(char a[3][3]){
    int c = 0;
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++){
            if (a[i][j] != ' ') {
                c++;
            }
        }
    }
    return (c == 9);  // Returns 1 if board is full
}

/**
 * Function: diagnaol_win
 * ----------------------
 * Checks for diagonal win.
 *
 * @param A: The structure containing the board and current player information.
 * @return: Returns 1 if there's a diagonal win, 0 otherwise.
 */
int diagnaol_win(struct box  A){

    char (*a)[3] = A.a;  // Accessing the board from the structure
    return ((a[0][0] == A.user && a[1][1] == A.user && a[2][2] == A.user) ||
            (a[0][2] == A.user && a[1][1] == A.user && a[2][0] == A.user));
}

/**
 * Function: row_win
 * -----------------
 * Checks for row-wise win.
 *
 * @param A: The structure containing the board and current player information.
 * @return: Returns 1 if there's a row win, 0 otherwise.
 */
int row_win(struct box A){

    char (*a)[3] = A.a;
    for (int i = 0; i < 3; i++){
        if (a[i][0] == A.user && a[i][1] == A.user && a[i][2] == A.user){
            return 1;
        }
    }
    return 0;
}

/**
 * Function: col_win
 * -----------------
 * Checks for column-wise win.
 *
 * @param A: The structure containing the board and current player information.
 * @return: Returns 1 if there's a column win, 0 otherwise.
 */
int col_win(struct box A){

    char (*a)[3] = A.a;
    for (int i = 0; i < 3; i++){
        if (a[0][i] == A.user && a[1][i] == A.user && a[2][i] == A.user){
            return 1;
        }
    }
    return 0;
}

/**
 * Function: is_win_or_draw
 * ------------------------
 * Checks if the current player has won or if the game is a draw.
1 * @param B: The structure containing the board and current player information.
 * @return: Returns 1 for win, 2 for draw, 0 if the game continues.
 */
int is_win_or_draw(struct box* B){

    B->user = (B->user == 1) ? 'X' : 'O';  // Set current user's character
    
    if (row_win(*B) || col_win(*B) || diagnaol_win(*B)){
        return 1;  // Player wins
    }
    
    if (isfull(B->a)){
        return 2;  // Draw
    }
    
    return 0;  // Continue playing
}
