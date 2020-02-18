extends Node2D

func _ready():
	pass




func _on_player_health_changed():
	var h = get_node("/root/Game/player").health
	$HEALTH.text = "Health: " + str(h)


func _on_player_score_changed():
	var s = get_node("/root/Game/player").score
	$SCORE.text = "Score: " + str(s)
