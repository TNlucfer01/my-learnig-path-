

#include <SDL2/SDL.h>
#include <stdbool.h>

int main(int argc, char* argv[]) {
    SDL_Init(SDL_INIT_VIDEO);

    SDL_Window* window = SDL_CreateWindow("Keyboard Polling Example", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    SDL_Renderer* renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

    bool running = true;

    // Main loop
    while (running) {
        // Poll for events
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                running = false;
            }
        }

        // Get the current state of the keyboard
        const Uint8* state = SDL_GetKeyboardState(NULL);

        // Check if certain keys are pressed
        if (state[SDL_SCANCODE_W]) {
            SDL_Log("W key is pressed");
        }

        if (state[SDL_SCANCODE_S]) {
            SDL_Log("S key is pressed");
        }

        if (state[SDL_SCANCODE_ESCAPE]) {
            running = false;  // Exit the loop if ESCAPE is pressed
        }

        // Add a delay to prevent overloading the CPU
        SDL_Delay(100);
            }
        
            // Clean up SDL resources
            SDL_DestroyRenderer(renderer);
            SDL_DestroyWindow(window);
            SDL_Quit();
        
            return 0;
        }