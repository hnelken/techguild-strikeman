GDPC                                                                                          T   res://.godot/exported/133200997/export-319c771120520f4d1d7e0d4d95c7ff35-letter.scn  �&      �      E�|��&r��݁�
��    P   res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scnP	      �      �m� [���^�KP    X   res://.godot/exported/133200997/export-b110f3cf0d59eb3f502683d0fe4e1488-game_theme.res  0      J      �x��x?t�Y����7��    \   res://.godot/exported/133200997/export-bb5989f23c3d21593a35160840f0641f-word_container.scn  9      \      A�@í��f�5�    X   res://.godot/exported/133200997/export-eba4a3b220b02aa15da0391e32ec8a72-letter_list.scn @2      6      B�j��,VJ�jx�X	L    ,   res://.godot/global_script_class_cache.cfg  �?      �      ��/0��Ȓ�@�����    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  @G      �       	f	�K*k��s�.�Vm�    (   res://LetterModel/base_letter_model.gd          �      A	t������T"%\l    ,   res://LetterModel/correct_letter_model.gd   �      �       ĥ�f�B�:�C0K�e    (   res://LetterModel/input_letter_model.gd �            6=H���
r��U�6m    (   res://LetterModel/wrong_letter_model.gd �      �       �!J��R�ٟ�T��jk       res://game.gd   p      �      �L������m4�\�&)       res://game.tscn.remap   p=      a       �?��� �ު��y�       res://game_theme.tres.remap �=      g       �3�Z���C��8�S��       res://icon.svg  �C      �      C��=U���^Qu��U3       res://icon.svg.import   `#      �       �g{I^G��N�����       res://letter.gd  $      �      %��D��x%"$�%�       res://letter.tscn.remap P>      c       ��3�XQV ���0��       res://letter_list.gd�,      V      Ef79�W�~��5       res://letter_list.tscn.remap�>      h       3���G���wp��X       res://project.binary H      �      AíǛ�v�(e\��N       res://word_container.gd �5      �      W��o����BP��Ғ        res://word_container.tscn.remap 0?      k       �Do�4ׂF�l�|g7                extends Resource

class_name BaseLetterModel

signal didUpdateLetterModel()

@export var letter = "A"
@export var hasBeenGuessed = false

func isLetterVisible() -> bool:
	return true

func isUnderlineVisible() -> bool:
	return true
	
func isTappable() -> bool:
	return true

func handleTap() -> void:
	pass

func handleGuess(guessedLetter: String) -> void:
	if guessedLetter == letter:
		hasBeenGuessed = true
		didUpdateLetterModel.emit()
        extends BaseLetterModel

class_name CorrectLetterModel

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return true
	
func isTappable() -> bool:
	return false
     extends BaseLetterModel

class_name InputLetterModel

func isLetterVisible() -> bool:
	return not hasBeenGuessed

func isUnderlineVisible() -> bool:
	return false
	
func isTappable() -> bool:
	return not hasBeenGuessed

func handleTap() -> void:
	handleGuess(letter)
     extends BaseLetterModel

class_name WrongLetterModel

func isLetterVisible() -> bool:
	return hasBeenGuessed

func isUnderlineVisible() -> bool:
	return false
	
func isTappable() -> bool:
	return false
      extends Node2D

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

func _ready() -> void:
	_assignCurrentWord()
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
	
	if wordContainer.isWordSolved():
		isGameOver = true
		print("you win")
	elif numberOfMistakes == maxNumberOfMistakes:
		isGameOver = true
		print("game over")
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size    script 	   _bundled       Script    res://game.gd ��������   PackedScene    res://letter_list.tscn � V�X'�\   PackedScene    res://word_container.tscn c���\3      local://StyleBoxFlat_3yu34 �         local://PackedScene_bf1es          StyleBoxFlat            �?s��>s��>  �?         PackedScene          	         names "   "      Game    script    Node2D    CanvasLayer    Background    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    theme_override_styles/panel    PanelContainer    HBoxContainer    layout_mode    InputLetterListContainer    size_flags_horizontal    VBoxContainer    TopSpacing    size_flags_vertical    size_flags_stretch_ratio    Control    MarginContainer %   theme_override_constants/margin_left &   theme_override_constants/margin_right    InputLetterList    unique_name_in_owner    BottomSpacing    MiddleContainer 
   alignment    WordContainer    currentWord    WrongLetterListContainer    WrongLetterList 	   listType    	   variants                            �?                           �?   ,                                       Solidarity      �>      node_count             nodes     �   ��������       ����                            ����                     ����                           	      
                       ����                          ����                                ����                                      ����                                      ���            	                          ����                                      ����            
       	             ����                         	       ���            	                   	             ����                                      ����                                ����                                      ����                                      ���             	         !   
                    ����                               conn_count              conns               node_paths              editable_instances              version             RSRC            RSRC                    Theme            ��������                                                  resource_local_to_scene    resource_name    default_base_scale    default_font    default_font_size    Label/font_sizes/font_size    script           local://Theme_ureuj $         Theme          ,         RSRC      GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://rf4br3v1jtga"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 extends CenterContainer

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
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://letter.gd ��������   Theme    res://game_theme.tres �l ��      local://PackedScene_x2auv 3         PackedScene          	         names "         Letter    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    mouse_filter    script    CenterContainer    EmptySpace    layout_mode    theme    text    Label 
   Underline    unique_name_in_owner    anchors_preset    anchor_top    offset_bottom 
   ColorRect    LetterLabel    offset_top    horizontal_alignment    vertical_alignment    _letterLabelTapped 
   gui_input    	   variants            �?                                                                  �@            ?     0�     0B      A       node_count             nodes     ^   ��������       ����                                                           ����   	            
                             ����	         	                                    	                                ����         	         
                                                                                conn_count             conns                                      node_paths              editable_instances              version             RSRC  extends HFlowContainer

class_name LetterList

enum LetterListType { INPUT, WRONG }

signal onLetterTapped(letter: String)

@export var listType := LetterListType.INPUT
@export var letterScene: PackedScene

var letterModels: Array[BaseLetterModel] = []

## MARK: - Guess Handling

# Handles updating the letters in this list after a guess.
func handleGuess(letter: String) -> void:
	for letterModel in letterModels:
		letterModel.handleGuess(letter)

# Handles when a letter in this list is tapped.
func handleLetterTap(letter: String) -> void:
	onLetterTapped.emit(letter)

## MARK: - Setup

func _ready() -> void:
	setup()

func setup() -> void:
	letterModels = []
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ":
		var letterModel = _letterModelForLetter(letter)
		var letterNode = letterScene.instantiate() as Letter
		letterNode.letterModel = letterModel
		letterNode.onLetterTapped.connect(handleLetterTap)
		letterModels.append(letterModel)
		add_child(letterNode)

func _letterModelForLetter(letter: String) -> BaseLetterModel:
	match listType:
		LetterListType.INPUT:
			var model = InputLetterModel.new()
			model.letter = letter
			return model
		
		LetterListType.WRONG:
			var model = WrongLetterModel.new()
			model.letter = letter
			return model
	
	return BaseLetterModel.new()

          RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://letter_list.gd ��������   PackedScene    res://letter.tscn ��XoW-      local://PackedScene_3ylsv :         PackedScene          	         names "         LetterList    size_flags_horizontal    size_flags_vertical 
   alignment    script    letterScene    HFlowContainer    	   variants                                            node_count             nodes        ��������       ����                                             conn_count              conns               node_paths              editable_instances              version             RSRC          extends HBoxContainer

class_name WordContainer

@export var letterScene: PackedScene
@export var currentWord: String
@export var letterModels: Array[CorrectLetterModel] = []

func setCurrentWord(word: String) -> void:
	currentWord = word
	letterModels = []
	_setup()

func isWordSolved() -> bool:
	for letterModel in letterModels:
		if not letterModel.hasBeenGuessed:
			return false
	return true

func _setup() -> void:
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	for letter in currentWord:
		var letterModel = CorrectLetterModel.new()
		letterModel.letter = letter
		letterModels.append(letterModel)
	
	for letterModel in letterModels:
		var letterNode = letterScene.instantiate() as Letter
		letterNode.letterModel = letterModel
		add_child(letterNode)

func handleGuess(letter: String) -> void:
	for letterModel in letterModels:
		letterModel.handleGuess(letter)
            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://word_container.gd ��������   PackedScene    res://letter.tscn ��XoW-      local://PackedScene_bx2sm =         PackedScene          	         names "         WordContainer    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_right    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical $   theme_override_constants/separation 
   alignment    script    letterScene    HBoxContainer    	   variants    	         ?      �      B                                                 node_count             nodes     #   ��������       ����                                                       	      
                                        conn_count              conns               node_paths              editable_instances              version             RSRC    [remap]

path="res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scn"
               [remap]

path="res://.godot/exported/133200997/export-b110f3cf0d59eb3f502683d0fe4e1488-game_theme.res"
         [remap]

path="res://.godot/exported/133200997/export-319c771120520f4d1d7e0d4d95c7ff35-letter.scn"
             [remap]

path="res://.godot/exported/133200997/export-eba4a3b220b02aa15da0391e32ec8a72-letter_list.scn"
        [remap]

path="res://.godot/exported/133200997/export-bb5989f23c3d21593a35160840f0641f-word_container.scn"
     list=Array[Dictionary]([{
"base": &"Resource",
"class": &"BaseLetterModel",
"icon": "",
"language": &"GDScript",
"path": "res://LetterModel/base_letter_model.gd"
}, {
"base": &"BaseLetterModel",
"class": &"CorrectLetterModel",
"icon": "",
"language": &"GDScript",
"path": "res://LetterModel/correct_letter_model.gd"
}, {
"base": &"BaseLetterModel",
"class": &"InputLetterModel",
"icon": "",
"language": &"GDScript",
"path": "res://LetterModel/input_letter_model.gd"
}, {
"base": &"CenterContainer",
"class": &"Letter",
"icon": "",
"language": &"GDScript",
"path": "res://letter.gd"
}, {
"base": &"HFlowContainer",
"class": &"LetterList",
"icon": "",
"language": &"GDScript",
"path": "res://letter_list.gd"
}, {
"base": &"HBoxContainer",
"class": &"WordContainer",
"icon": "",
"language": &"GDScript",
"path": "res://word_container.gd"
}, {
"base": &"BaseLetterModel",
"class": &"WrongLetterModel",
"icon": "",
"language": &"GDScript",
"path": "res://LetterModel/wrong_letter_model.gd"
}])
   <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �k��.5&   res://game.tscn�l ��   res://game_theme.tres ��i�   res://icon.svg��XoW-   res://letter.tscn� V�X'�\   res://letter_list.tscnc���\3   res://word_container.tscn  ECFG      application/config/name         Strike-Hangman     application/run/main_scene         res://game.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility        