extends CanvasLayer

class_name MenuManager

signal resetPuzzle()

@onready var infoMenu: PanelContainer = %InfoMenu
@onready var resultMenu: PanelContainer = %ResultMenu
@onready var popupBackground: PanelContainer = %PopupBackground
@onready var closePopupButton: Button = %ClosePopupButton

@onready var resultLabel: Label = %ResultLabel
@onready var summaryLabel: Label = %SummaryLabel

func _ready() -> void:
	infoMenu.visible = false
	resultMenu.visible = false
	closePopupButton.visible = false
	popupBackground.visible = false

func showResultMenu(numberOfMistakes: int) -> void:
	infoMenu.visible = false
	resultMenu.visible = true
	resultLabel.text = _getResultTextForMistakeCount(numberOfMistakes)
	summaryLabel.text = _getSummaryTextForMistakeCount(numberOfMistakes)
	popupBackground.visible = true
	closePopupButton.visible = true

func _infoButtonPressed() -> void:
	infoMenu.visible = true
	resultMenu.visible = false
	popupBackground.visible = true
	closePopupButton.visible = true

func _guildWebsiteButtonPressed() -> void:
	OS.shell_open("https://nytimesguild.org/")

func _donateButtonPressed() -> void:
	OS.shell_open("https://www.gofundme.com/f/nyt-tech-strike-fund")

func _guildBuildsButtonPressed() -> void:
	OS.shell_open("https://nytimesguild.org/tech/guild-builds/")

func _newPuzzleButtonPressed() -> void:
	popupBackground.visible = false
	closePopupButton.visible = false
	resetPuzzle.emit()

func _closePopupPressed() -> void:
	popupBackground.visible = false
	closePopupButton.visible = false

func _menuBackgroundInput(event: InputEvent) -> void:
	if not popupBackground.visible: return
	if event is InputEventMouseButton and event.pressed:
		popupBackground.visible = false
		closePopupButton.visible = false

func _getResultTextForMistakeCount(numberOfMistakes: int) -> String:
	match numberOfMistakes:
		0: return "Genius!"
		1: return "Magnificent!"
		2: return "Impressive!"
		3: return "Splendid!"
		4: return "Great!"
		5: return "Phew!"
	return "Oof!"

func _getSummaryTextForMistakeCount(numberOfMistakes: int) -> String:
	match numberOfMistakes:
		0: return "You solved the puzzle with no misses."
		1: return "You solved the puzzle with 1 miss."
		2, 3, 4, 5: return "You solved the puzzle with " + str(numberOfMistakes) + " misses."
	return "Maybe next time. One day longer, one day stronger!"


