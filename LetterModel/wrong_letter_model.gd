extends BaseLetterModel

class_name WrongLetterModel

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return false
	
func isTappable() -> bool:
	return false
