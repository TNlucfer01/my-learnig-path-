#include <SDL2/SDL.h>
#include <stdio.h>
#include<stdbool.h>

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
int checkwin(struct box b);

void change_user(struct box* b);
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
    empty_board(board.array); // Initialize the board
    board.user = 'O'; // Starting player

    // Initialize SDL
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* window = SDL_CreateWindow("TIC TAC TOE", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 640, 0);
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    // Load welcome message image
    SDL_Surface* welcome = SDL_LoadBMP("welcome_message.bmp");
    if (welcome == NULL) {
        SDL_Log("Failed to load BMP: %s", SDL_GetError());
        SDL_DestroyRenderer(renderer);
        SDL_DestroyWindow(window);
        SDL_Quit();
        return -1;
    }

    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, welcome);
    SDL_FreeSurface(welcome); // Free the surface after creating the texture

    SDL_Rect rimage = {0, 0, 640, 640};

    // Render the welcome message
    SDL_RenderClear(renderer);
    SDL_RenderCopy(renderer, texture, NULL, &rimage);
    SDL_RenderPresent(renderer);


    // Draw the grid


    bool running = true;
    while (running) {
        SDL_Event ev;
        while (SDL_PollEvent(&ev)) {
            if (ev.type == SDL_QUIT) {
                running = false;
            }
            else{
                
                
                    /* code */
                
                
            if (ev.type == SDL_KEYDOWN) {
                if (ev.key.keysym.sym==SDLK_RETURN)
                {
                        SDL_Delay(2000); // Show welcome message for 2 seconds
                        SDL_DestroyTexture(texture);
  grid(window, renderer);                   
                }
                
                int row = -1, col = -1;
                switch (ev.key.keysym.sym) {
                    case SDLK_1: row = 0; col = 0; break;
                    case SDLK_2: row = 0; col = 1; break;
                    case SDLK_3: row = 0; col = 2; break;
                    case SDLK_4: row = 1; col = 0; break;
                    case SDLK_5: row = 1; col = 1; break;
                    case SDLK_6: row = 1; col = 2; break;
                    case SDLK_7: row = 2; col = 0; break;
                    case SDLK_8: row = 2; col = 1; break;
                    case SDLK_9: row = 2; col = 2; break;
                    default:
                        printf("Enter a valid position.\n");
                        continue;
                }

                if (board.array[row][col] == ' ') { // Check if cell is empty
                    if (get_player(board.user) == 1) {
                        draw_O(renderer, row, col, 640);
                        board.array[row][col] = 'O';
                    } else {
                        draw_X(renderer, row, col, 640);
                        board.array[row][col] = 'X';
                    }

                    if (checkwin(board)) {
                        SDL_Log("We have a winner!");
                        SDL_Delay(2000); // Delay before closing after win
                        running = false;
                    } else {
                        change_user(&board);
                    }
                } else {
                    SDL_Log("Cell is already occupied. Choose another.");
                }
            }
        }

        SDL_Delay(10); // Control loop speed
    }}

    // Clean up resources
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
    SDL_SetRenderDrawColor(renderer, 255,255, 255, 255);  // Red color for "X"

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
//changging the user 
void change_user(struct box* b){
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
