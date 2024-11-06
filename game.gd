extends Node2D

const wordBank: Array[String] = [
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

@onready var wordContainer: WordContainer = %WordContainer
@onready var inputLetterList: LetterList = %InputLetterList
@onready var wrongLetterList: LetterList = %WrongLetterList

func _ready() -> void:
	_assignCurrentWord()
	
	inputLetterList.onLetterTapped.connect(_handleLetterTapped)

func _assignCurrentWord() -> void:
	var rIndex = randi() % wordBank.size()
	_currentWord = wordBank[rIndex].to_upper()
	print(_currentWord)
	wordContainer.setCurrentWord(_currentWord)

func _handleLetterTapped(letter: String) -> void:
	inputLetterList.handleGuess(letter)
	if _currentWord.contains(letter):
		wordContainer.handleGuess(letter)
	else:
		wrongLetterList.handleGuess(letter)
