extends CenterContainer

class_name Letter

signal onLetterTapped(letter: String)

@export var letterModel: BaseLetterModel

@onready var letterLabel: Label = %LetterLabel
@onready var underline: ColorRect = %Underline
@onready var background: Panel = %Background

func _ready() -> void:
	_updateLetterUI()
	letterModel.didUpdateLetterModel.connect(_updateLetterUI)

func _updateLetterUI() -> void:
	letterLabel.text = letterModel.letter
	letterLabel.visible = letterModel.isLetterVisible()
	underline.visible = letterModel.isUnderlineVisible()
	_updateBackgroundColor()

func _updateBackgroundColor() -> void:
	background.visible = letterModel.isBackgroundVisible()
	var styleBox: StyleBoxFlat = background.get_theme_stylebox("panel").duplicate()
	styleBox.set("bg_color", letterModel.backgroundColor())
	background.add_theme_stylebox_override("panel", styleBox)

func _letterLabelTapped(event: InputEvent) -> void:
	if not letterModel.isTappable(): return
	
	if event is InputEventMouseButton and event.pressed:
		onLetterTapped.emit(letterModel.letter)
		accept_event()
