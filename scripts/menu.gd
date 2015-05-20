extends Control

# Nodes
var global

func new_game():
	get_tree().change_scene_to(global.level_scene)

func quit():
	get_tree().quit()

func goto_screen(screen):
	set_pos(-get_node(screen).get_pos())

func goto_mainmenu():
	goto_screen("MainMenu")

func goto_settings():
	goto_screen("Settings")

func goto_controls():
	goto_screen("Controls")

# Display settings

func settings_toggle_fullscreen(pressed):
	global.fullscreen = pressed
	OS.set_window_fullscreen(global.fullscreen)
	global.save_to_config("display", "fullscreen", pressed)

# Audio settings

func settings_toggle_music(pressed):
	global.music = pressed
	global.save_to_config("audio", "music", pressed)

func settings_toggle_sfx(pressed):
	global.sfx = pressed
	global.save_to_config("audio", "sfx", pressed)

# Gameplay settings

func settings_set_players(value):
	global.nb_players = int(value)
	get_node("Settings/NbPlayers/Label").set_text("Players: " + str(value))
	global.save_to_config("gameplay", "nb_players", int(value))

func settings_set_lives(value):
	global.nb_lives = int(value)
	get_node("Settings/NbLives/Label").set_text("Lives: " + str(value))
	global.save_to_config("gameplay", "nb_lives", int(value))

func _ready():
	global = get_node("/root/global")
	
	# Initialise settings widgets
	get_node("Settings/Fullscreen").set_pressed(global.fullscreen)
	get_node("Settings/Music").set_pressed(global.music)
	get_node("Settings/SoundEffects").set_pressed(global.sfx)
	
	get_node("Settings/NbPlayers/Slider").set_value(global.nb_players)
	get_node("Settings/NbPlayers/Label").set_text("Players: " + str(global.nb_players))
	
	get_node("Settings/NbLives/Slider").set_value(global.nb_lives)
	get_node("Settings/NbLives/Label").set_text("Lives: " + str(global.nb_lives))
