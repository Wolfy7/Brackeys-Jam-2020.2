extends Control


onready var title_screen = $TitleScreen
onready var credits_screen = $CreditsScreen


# Called when the node enters the scene tree for the first time.
func _ready():
	title_screen.visible = true
	credits_screen.visible = false


func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_CreditsButton_pressed():
	title_screen.visible = false
	credits_screen.visible = true


func _on_BackButton_pressed():
	title_screen.visible = true
	credits_screen.visible = false
