extends BaseLetterModel

class_name CorrectLetterModel

func isBackgroundVisible() -> bool:
	return hasBeenGuessed

func backgroundColor() -> Color:
	return Color.MEDIUM_SEA_GREEN

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return true
	
func isTappable() -> bool:
	return false
