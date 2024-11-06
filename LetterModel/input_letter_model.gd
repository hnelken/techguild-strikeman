extends BaseLetterModel

class_name InputLetterModel

func isLetterVisible() -> bool:
	return not hasBeenGuessed

func isUnderlineVisible() -> bool:
	return false
	
func isTappable() -> bool:
	return not hasBeenGuessed

func handleTap() -> void:
	handleGuess(letter)
