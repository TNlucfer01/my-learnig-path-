#include<SDL2/SDL.h>
#include<stdio.h>
#include<stdbool.h>

int main(char **argv,int argc){
    SDL_Window* window;
    SDL_Renderer* renderer;
    SDL_Texture* texture;
    int  width = 800;
    int height = 600;
    Uint32 rmask, gmask, bmask, amask;
    Uint32 format;
    int access;
    Uint8 r, g, b, a;
    int x, y;
    int i;
    int quit = 0;
    SDL_Event event;
    SDL_Init(SDL_INIT_VIDEO);
    window = SDL_CreateWindow("SDL2",SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED, width, height, SDL_WINDOW_SHOWN);
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_TARGET, width, height);
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
    SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
    for (i = 0; i < width; i++) {
        for (y = 0; y < height; y++) {
            SDL_RenderDrawPoint(renderer, i, y);
            }
            }
            SDL_RenderPresent(renderer);
            SDL_Delay(1000);
            SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
            SDL_RenderClear(renderer);
            SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
            for (i = 0; i < width; i++) {
                for (y = 0; y < height; y++) {
                    SDL_RenderDrawPoint(renderer, i, y);
                    }
                    }
                    SDL_RenderPresent(renderer);
                    SDL_Delay(1000);
                    SDL_DestroyTexture(texture);
                    SDL_DestroyRenderer(renderer);
                    SDL_DestroyWindow(window);
                    SDL_Quit();
                    return 0;
                    

    }