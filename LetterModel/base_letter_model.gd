extends Resource

class_name BaseLetterModel

signal didUpdateLetterModel()

@export var letter = "A"
@export var hasBeenGuessed = false

func isBackgroundVisible() -> bool:
	return true

func backgroundColor() -> Color:
	return Color.DIM_GRAY

func isLetterVisible() -> bool:
	return true

func isUnderlineVisible() -> bool:
	return true
	
func isTappable() -> bool:
	return true

func handleTap() -> void:
	pass

func handleGuess(guessedLetter: String) -> void:
	if guessedLetter == letter:
		hasBeenGuessed = true
		didUpdateLetterModel.emit()
