extends BaseLetterModel

class_name CorrectLetterModel

var isRevealed = false

func reveal() -> void:
	isRevealed = true
	didUpdateLetterModel.emit()

func isBackgroundVisible() -> bool:
	if isEmptySpace(): return false
	return hasBeenGuessed or isRevealed

func backgroundColor() -> Color:
	if hasBeenGuessed:
		return Color.MEDIUM_SEA_GREEN
	else:
		return Color.DIM_GRAY

func isLetterVisible() -> bool:
	return hasBeenGuessed or isRevealed

func isUnderlineVisible() -> bool:
	return not isEmptySpace()
	
func isTappable() -> bool:
	return false

func isEmptySpace() -> bool:
	return letter == " "
