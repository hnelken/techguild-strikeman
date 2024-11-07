extends BaseLetterModel

class_name WrongLetterModel

func isBackgroundVisible() -> bool:
	return hasBeenGuessed

func backgroundColor() -> Color:
	return Color.CRIMSON

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return false
	
func isTappable() -> bool:
	return false
