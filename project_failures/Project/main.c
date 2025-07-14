#include <stdio.h>
#include "utilis.h"  // Assuming your header file is named tictactoe.h

int main() {
    struct xox game = { 
        .a = { {' ', ' ', ' '}, {' ', ' ', ' '}, {' ', ' ', ' '} }, 
        .user = 1 
    };  // Initialize an empty board and set the first user

    int result;

    // Main game loop
    while (1) {
        display(game.a);  // Display the current board state

        // Get input from the user and update the board
        getinput(&game);

        // Check for win or draw
        result = is_win_or_draw(&game);
        
        if (result == 1) {
            display(game.a);
            printf("Player %d wins!\n", game.user);
            break;
        } else if (result == 2) {
            display(game.a);
            printf("It's a draw!\n");
            break;
        }

        // Change the user turn
        changing_user(&game.user);
    }

    return 0;
}
