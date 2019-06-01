extends Node2D

export (PackedScene) var Mob
var score

func _ready():
#	pass # Replace with function body.
	randomize()
#	new_game()
	


func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Player.start($StartPosition.position)
	$StartTimer.start()
	

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$bgm_game.stop()
	$sfx_gameover.play()
	pass # Replace with function body.


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
	$bgm_game.play()
	pass # Replace with function body.


func _on_ScoreTimer_timeout():
	score+=1
	$HUD.update_score(score)
	pass # Replace with function body.


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction  = $MobPath/MobSpawnLocation.rotation+PI/2
	mob.position = $MobPath/MobSpawnLocation.position
	direction+=rand_range(-PI/4,PI/4)
	mob.rotation = direction
	mob.linear_velocity	= Vector2(rand_range(mob.min_speed, mob.max_speed),0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)
#	pass # Replace with function body.

