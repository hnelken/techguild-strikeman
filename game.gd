extends Node2D

const wordBank = [
	"Action", 
	"Bargaining", 
	"Picket", 
	"Fair", 
	"Just Cause",
	"Mediate", 
	"Wages", 
	"Hybrid", 
	"Remote", 
	"Union", 
	"Negotiate", 
	"Solidarity", 
	"Labor", 
	"Contract", 
	"Equity", 
	"United", 
	"Power"
]

var _currentWord: String = ""

func _ready() -> void:
	_assignCurrentWord()

func _assignCurrentWord() -> void:
	var rIndex = 0
	_currentWord = wordBank[rIndex]
	
