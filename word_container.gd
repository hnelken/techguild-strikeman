extends HBoxContainer

@export var letterScene: PackedScene
@export var currentWord: String

func setupForWord(word: String) -> void:
	currentWord = word
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for letter in word:
		var letterNode = letterScene.instantiate()
		add_child(letterNode)
		letterNode.setLetter(letter)
	
func _ready() -> void:
	setupForWord(currentWord)
