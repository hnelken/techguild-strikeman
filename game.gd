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

var solvedWords: Array[String] = []

var numberOfMistakes = 0
@export var maxNumberOfMistakes = 6

@onready var wordContainer: WordContainer = %WordContainer
@onready var inputLetterList: LetterList = %InputLetterList
@onready var wrongLetterList: LetterList = %WrongLetterList
@onready var strikemanTexture: TextureRect = %StrikemanTexture
@onready var menuLayer: MenuManager = %MenuLayer

func _ready() -> void:
	_assignCurrentWord()
	_updateTexture()
	inputLetterList.onLetterTapped.connect(_handleLetterTapped)
	menuLayer.resetPuzzle.connect(_resetPuzzle)

func _resetPuzzle() -> void:
	numberOfMistakes = 0
	inputLetterList.setup()
	wrongLetterList.setup()
	_assignCurrentWord()
	_updateTexture()
	isGameOver = false

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
	await get_tree().create_timer(1.0).timeout
	menuLayer.showResultMenu(numberOfMistakes)
