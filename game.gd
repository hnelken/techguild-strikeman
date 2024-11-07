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

var currentWord: String = ""
var isGameOver = false

var numberOfMistakes = 0
@export var maxNumberOfMistakes = 6

@onready var wordContainer: WordContainer = %WordContainer
@onready var inputLetterList: LetterList = %InputLetterList
@onready var wrongLetterList: LetterList = %WrongLetterList
@onready var strikemanTexture: TextureRect = %StrikemanTexture

func _ready() -> void:
	_assignCurrentWord()
	_updateTexture()
	inputLetterList.onLetterTapped.connect(_handleLetterTapped)

func _assignCurrentWord() -> void:
	var rIndex = randi() % wordBank.size()
	currentWord = wordBank[rIndex].to_upper()
	wordContainer.setCurrentWord(currentWord)

func _handleLetterTapped(letter: String) -> void:
	if isGameOver: return
	
	inputLetterList.handleGuess(letter)
	
	if currentWord.contains(letter):
		wordContainer.handleGuess(letter)
	else:
		numberOfMistakes += 1
		wrongLetterList.handleGuess(letter)
	
	_updateTexture()
	_handleGameOverIfNeeded()

func _updateTexture() -> void:
	var imageName = "res://Strikeman/strikeman-" + str(numberOfMistakes) + ".png"
	strikemanTexture.texture = load(imageName)

func _handleGameOverIfNeeded() -> void:
	var isPuzzleSolved = wordContainer.isWordSolved()
	var isPuzzleFailed = numberOfMistakes == maxNumberOfMistakes
	
	if not isPuzzleSolved and not isPuzzleFailed: return
	
	isGameOver = true
	wordContainer.revealWord()
