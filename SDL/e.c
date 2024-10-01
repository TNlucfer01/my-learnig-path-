#include<SDL2/SDL.h>

int main(){
SDL_Window* w=SDL_CreateWindow("first window ",200,200,800,800,0);
SDL_Renderer* R=SDL_CreateRenderer(w,0,0);
SDL_Texture* T=SDL_CreateTexture(R,SDL_PIXELFORMAT_RGBA8888,0,800,800);
SDL_Delay(8000);
}