extends Control

var currentLetter: String
@onready var letterLabel: Label = %LetterLabel

func _ready() -> void:
	#letterLabel.visible = false
	setLetter(currentLetter)

func revealLetter() -> void:
	letterLabel.visible = true

func setLetter(letter: String) -> void:
	currentLetter = letter.capitalize()
	letterLabel.text = letter.capitalize()
