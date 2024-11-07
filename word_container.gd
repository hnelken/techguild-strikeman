extends HBoxContainer

class_name WordContainer

@export var letterScene: PackedScene
@export var currentWord: String
@export var letterModels: Array[CorrectLetterModel] = []

func setCurrentWord(word: String) -> void:
	currentWord = word
	letterModels = []
	_setup()

func isWordSolved() -> bool:
	for letterModel in letterModels:
		if not letterModel.isEmptySpace() and not letterModel.hasBeenGuessed:
			return false
	return true

func revealWord() -> void:
	for letterModel in letterModels:
		letterModel.reveal()

func _setup() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for letter in currentWord:
		var letterModel = CorrectLetterModel.new()
		letterModel.letter = letter
		letterModels.append(letterModel)
	
	for letterModel in letterModels:
		var letterNode = letterScene.instantiate() as Letter
		letterNode.letterModel = letterModel
		add_child(letterNode)

func handleGuess(letter: String) -> void:
	for letterModel in letterModels:
		letterModel.handleGuess(letter)
