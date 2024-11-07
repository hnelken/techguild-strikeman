extends HFlowContainer

class_name LetterList

enum LetterListType { INPUT, WRONG }

signal onLetterTapped(letter: String)

@export var listType := LetterListType.INPUT
@export var letterScene: PackedScene

var letterModels: Array[BaseLetterModel] = []

## MARK: - Guess Handling

# Handles updating the letters in this list after a guess.
func handleGuess(letter: String) -> void:
	for letterModel in letterModels:
		letterModel.handleGuess(letter)

# Handles when a letter in this list is tapped.
func handleLetterTap(letter: String) -> void:
	onLetterTapped.emit(letter)

## MARK: - Setup

func _ready() -> void:
	setup()

func setup() -> void:
	letterModels = []
	for child in get_children():
		if child is Letter:
			remove_child(child)
			child.queue_free()
	
	for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
		var letterModel = _letterModelForLetter(letter)
		var letterNode = letterScene.instantiate() as Letter
		letterNode.letterModel = letterModel
		letterNode.onLetterTapped.connect(handleLetterTap)
		letterModels.append(letterModel)
		add_child(letterNode)

func _letterModelForLetter(letter: String) -> BaseLetterModel:
	match listType:
		LetterListType.INPUT:
			var model = InputLetterModel.new()
			model.letter = letter
			return model
		
		LetterListType.WRONG:
			var model = WrongLetterModel.new()
			model.letter = letter
			return model
	
	return BaseLetterModel.new()

