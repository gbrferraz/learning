package image_on_screen

import fmt "core:fmt"
import sdl "vendor:sdl2"

g_window: ^sdl.Window
g_screen_surface: ^sdl.Surface
g_hello_world: ^sdl.Surface

SCREEN_WIDTH :: 640
SCREEN_HEIGHT :: 480

init :: proc() -> bool {
	success := true
	if sdl.Init({.VIDEO}) < 0 {
		fmt.printf("SDL could not initialize! SDL_Error: %s\n", sdl.GetError())
		success = false
	} else {
		g_window = sdl.CreateWindow(
			"SDL Tutorial",
			sdl.WINDOWPOS_UNDEFINED,
			sdl.WINDOWPOS_UNDEFINED,
			SCREEN_WIDTH,
			SCREEN_HEIGHT,
			{},
		)

		if g_window == nil {
			fmt.printf("Window could not be created! SDL_Error: %s\n", sdl.GetError())
			success = false
		} else {
			g_screen_surface = sdl.GetWindowSurface(g_window)
		}

	}
	return success
}

load_media :: proc() -> bool {
	success := true

	g_hello_world = sdl.LoadBMP("../res/hello_world.bmp")

	if g_hello_world == nil {
		fmt.printf(
			"Unable to load image %s! SDL_Error: %s\n",
			"../res/hello_world.bmp",
			sdl.GetError(),
		)
		success = false
	}

	return success
}

close :: proc() {
	sdl.FreeSurface(g_hello_world)
	sdl.DestroyWindow(g_window)
	sdl.Quit()
}

main :: proc() {
	if !init() {
		fmt.printf("Failed to initialize!\n")
	} else {
		if !load_media() {
			fmt.printf("Failed to load media!\n")
		} else {
			sdl.BlitSurface(g_hello_world, nil, g_screen_surface, nil)
			sdl.UpdateWindowSurface(g_window)
			e: sdl.Event
			quit := false
			for !quit {
				for sdl.PollEvent(&e) {
					if e.type == .QUIT {
						quit = true
					}
				}
			}
		}
	}

	close()
}
