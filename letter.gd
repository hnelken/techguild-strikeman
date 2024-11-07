extends CenterContainer

class_name Letter

signal onLetterTapped(letter: String)

@export var letterModel: BaseLetterModel

@onready var letterLabel: Label = %LetterLabel
@onready var underline: ColorRect = %Underline

func _ready() -> void:
	_updateLetterUI()
	letterModel.didUpdateLetterModel.connect(_updateLetterUI)

func _updateLetterUI():
	letterLabel.text = letterModel.letter
	letterLabel.visible = letterModel.isLetterVisible()
	underline.visible = letterModel.isUnderlineVisible()

func _letterLabelTapped(event: InputEvent) -> void:
	if not letterModel.isTappable(): return
	
	if event is InputEventMouseButton and event.pressed:
		onLetterTapped.emit(letterModel.letter)
		accept_event()
