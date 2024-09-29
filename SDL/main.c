#include <SDL2/SDL.h>
#include <stdio.h>

struct box {
    char array[3][3];
    int user;
};

// Function prototypes
void draw_circle(SDL_Renderer* renderer, int centerX, int centerY, int radius); 
int grid(SDL_Window* window, SDL_Renderer* renderer);
void draw_O(SDL_Renderer* renderer, int row, int col, int window_size);
void draw_X(SDL_Renderer* renderer, int row, int col, int window_size);
int drawSymbol(struct box b, SDL_Window* window, SDL_Renderer* renderer);
void empty_board(char arr[3][3]);
char get_player(int user);
int is_filled(struct box b );

void draw_thick_circle(SDL_Renderer* renderer, int centerX, int centerY, int radius, int thickness); 
void empty_board(char arr[3][3]) {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            arr[i][j] = '-'; // Initialize the board with some default value (e.g., '-')
        }
    }
}

int main() {
    struct box board;
    empty_board(board.array);  // Correctly call the function to fill the array

    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* window = SDL_CreateWindow("TIC TAC TOE", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 640, 0);
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    SDL_RenderPresent(renderer);
    SDL_Delay(2000);

    int r = grid(window, renderer);
    if (r == 1) {
        SDL_Log("The grid has been created");
    }

    SDL_RenderPresent(renderer);
    SDL_Delay(2000);

    // Example: Drawing a symbol (O) at row 1, column 1
    draw_X(renderer, 1, 1, 640);

    SDL_RenderPresent(renderer);
    SDL_Delay(8000);

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}

int grid(SDL_Window* window, SDL_Renderer* renderer) {
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255); // White color

    // Drawing vertical lines
    SDL_RenderDrawLine(renderer, 213, 0, 213, 640);  // First vertical line
    SDL_RenderDrawLine(renderer, 426, 0, 426, 640);  // Second vertical line

    // Drawing horizontal lines
    SDL_RenderDrawLine(renderer, 0, 213, 640, 213);  // First horizontal line
    SDL_RenderDrawLine(renderer, 0, 426, 640, 426);  // Second horizontal line
    
    return 1;
}

int drawSymbol(struct box b, SDL_Window* window, SDL_Renderer* renderer) {
    int cur_player = b.user;
    if (cur_player == 1) {
        // draw the X
        draw_X(renderer, 1, 1, 640);  // For example, drawing X at (1,1)
    } else {
        // draw the O
        draw_O(renderer, 1, 1, 640);  // For example, drawing O at (1,1)
    }
    return 1;
}


void draw_O(SDL_Renderer* renderer, int row, int col, int window_size) {
    int cell_size = window_size / 3;  // Calculate the size of each cell
    int centerX = (col * cell_size) + (cell_size / 2);
    int centerY = (row * cell_size) + (cell_size / 2);
    int radius = cell_size / 4;  // Adjust the circle's radius to fit in the cell

    draw_thick_circle(renderer, centerX, centerY, radius,5);
}
void draw_thick_circle(SDL_Renderer* renderer, int centerX, int centerY, int radius, int thickness) {
    for (int i = 0; i < thickness; ++i) {
        
        draw_circle(renderer, centerX, centerY, radius + i);
        draw_circle(renderer, centerX, centerY, radius - i);
    }

}
void draw_thick_X(SDL_Renderer* renderer,int row,int col,int thickness,int window_size){
    for (int i = 0; i < thickness; i++)
    {
        draw_X(renderer,row,col,window_size);
        
    }
    
}
void draw_circle(SDL_Renderer* renderer, int centerX, int centerY, int radius) {
    int x = radius;
    int y = 0;
    int p = 1 - radius;

    // Draw initial points on the circle
    SDL_RenderDrawPoint(renderer, centerX + x, centerY + y);
    SDL_RenderDrawPoint(renderer, centerX - x, centerY + y);
    SDL_RenderDrawPoint(renderer, centerX + y, centerY + x);
    SDL_RenderDrawPoint(renderer, centerX - y, centerY + x);

    while (x > y) {
        y++;
        if (p <= 0) {
            p = p + 2 * y + 1;
        } else {
            x--;
            p = p + 2 * y - 2 * x + 1;
        }


        // Draw the circle's octants
        
        SDL_RenderDrawPoint(renderer, centerX + x, centerY + y);
        SDL_RenderDrawPoint(renderer, centerX - x, centerY + y);
        SDL_RenderDrawPoint(renderer, centerX + x, centerY - y);
        SDL_RenderDrawPoint(renderer, centerX - x, centerY - y);
        SDL_RenderDrawPoint(renderer, centerX + y, centerY + x);
        SDL_RenderDrawPoint(renderer, centerX - y, centerY + x);
        SDL_RenderDrawPoint(renderer, centerX + y, centerY - x);
        SDL_RenderDrawPoint(renderer, centerX - y, centerY - x);
    }
}
void draw_X(SDL_Renderer* renderer, int row, int col, int window_size) {
    int cell_size = window_size / 3;  // Size of each cell
    int padding = 15;                  // Padding from the edges of the cell
    int startX = col * cell_size + padding;
    int startY = row * cell_size + padding;
    int endX = (col + 1) * cell_size - padding;
    int endY = (row + 1) * cell_size - padding;

    // Set the color for the "X"
    SDL_SetRenderDrawColor(renderer, 255, 10, 120, 255);  // Red color for "X"

    // Thickness of the lines
    int thickness = 5;  // Change this value to increase or decrease thickness

    // Draw diagonal lines to form an "X" with thickness
    for (int i = -thickness / 2; i <= thickness / 2; i++) {
        // Top-left to bottom-right diagonal
        SDL_RenderDrawLine(renderer, startX + i, startY, endX + i, endY);
        // Bottom-left to top-right diagonal
        SDL_RenderDrawLine(renderer, startX + i, endY, endX + i, startY);
    }
}

int horizontal_win(struct box b) {
    char i = get_player(b.user);
    if ((b.array[0][0] == i && b.array[0][1] == i && b.array[0][2] == i) ||
        (b.array[1][0] == i && b.array[1][1] == i && b.array[1][2] == i) ||
        (b.array[2][0] == i && b.array[2][1] == i && b.array[2][2] == i)) {
        return 1;
    }
    return 0;  // No win detected
}

int diag_win(struct box b) {
    char i = get_player(b.user);
    if ((b.array[0][0] == i && b.array[1][1] == i && b.array[2][2] == i) ||
        (b.array[0][2] == i && b.array[1][1] == i && b.array[2][0] == i)) {
        return 1;
    }
    return 0;  // No win detected
}


int ver_win(struct box b) {
    char i = get_player(b.user);
    if ((b.array[0][0] == i && b.array[1][0] == i && b.array[2][0] == i) ||
        (b.array[0][1] == i && b.array[1][1] == i && b.array[2][1] == i) ||
        (b.array[0][2] == i && b.array[1][2] == i && b.array[2][2] == i)) {
        return 1;
    }
    return 0;  // No win detected
}




int checkwin(struct box b){
    if (!is_filled(b))
    {
        return -1;
    }
    
    else if (ver_win(b)||horizontal_win(b)||diag_win(b))
    {
        return 1;
    }
    else{
    SDL_Log(" the game is draw ");
    return 0;
    }
    
//ckecking win
}
int is_filled(struct box b) {
    int count = 0;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (b.array[i][j] == 'O' || b.array[i][j] == 'X') {
                count++;
            }
        }
    }
    return (count == 9) ? 1 : 0;  // Return 1 if the board is filled, otherwise 0
}
int cur_state(struct box b) {
    int result = checkwin(b);
    if (result == 1) {
        SDL_Log("Player %d wins!", b.user);
    } else if (result == 0) {
        SDL_Log("It's a draw!");
    } else {
        SDL_Log("Game ongoing.");
    }
    return result;
}
void change_user(struct box* b){
//changging the user 
if (b->user==1)
{
    b->user=2;
}
else{
    b->user=1;
}

}

char get_player(int user){
    //get curent player 
    if (user==1)
    {
        return 'O';
    }
    else{
        return 'X';
    }
    
}

