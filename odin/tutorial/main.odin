package game

import la "core:math/linalg"
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(1280, 720, "My Odin + Raylib Game")
	player := rl.LoadTexture("player.png")
	player_pos: [2]f32
	player_speed: f32 = 200

	for !rl.WindowShouldClose() {
		input: [2]f32

		if rl.IsKeyDown(.UP) {
			input.y -= 1
		}
		if rl.IsKeyDown(.DOWN) {
			input.y += 1
		}
		if rl.IsKeyDown(.LEFT) {
			input.x -= 1
		}
		if rl.IsKeyDown(.RIGHT) {
			input.x += 1
		}

		player_pos += la.normalize0(input) * player_speed * rl.GetFrameTime()

		rl.BeginDrawing()
		rl.ClearBackground({160, 200, 255, 255})
		rl.DrawTextureV(player, player_pos, rl.WHITE)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
