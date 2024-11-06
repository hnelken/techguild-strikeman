extends BaseLetterModel

class_name CorrectLetterModel

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return true
	
func isTappable() -> bool:
	return false
