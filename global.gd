extends Node
# all dialogue arrays
var allvars_array = ["charA", "charB", "charC", "charD", "animA", "animB", "animC", "animD", "oriA", "oriB", "oriC", "oriD", "posA", "posB", "posC", "posD", "yapper", "background", "voice", "func"]
var alldefaultpos_array = [Vector2(256,352), Vector2(904, 352), Vector2(504, 352), Vector2(648, 352)]
var alldefaultscale_array = [Vector2(8, 8), Vector2(-8, 8), Vector2(8, 8), Vector2(-8, 8)]
var allchartypes_array = ["A", "B", "C", "D"]
var allcharanim_array = ["animA", "animB", "animC", "animD"]
var voicedchars_array = ["Goober", "Domo", "Bloober"]

var charA_array = []
var charB_array = []
var charC_array = []
var charD_array = []
var animA_array = []
var animB_array = []
var animC_array = []
var animD_array = []
var oriA_array = []
var oriB_array = []
var oriC_array = []
var oriD_array = []
var posA_array = []
var posB_array = []
var posC_array = []
var posD_array = []
var yapper_array = []
var background_array = []
var text_array = []
var voice_array = []
var func_array = []

# all dialogue vars
var convlengthfound = false
var convlength = 0
var charAvalue = []
var charBvalue = []
var charCvalue = []
var charDvalue = []
var animAvalue = []
var animBvalue = []
var animCvalue = []
var animDvalue = []
var oriAvalue = []
var oriBvalue = []
var oriCvalue = []
var oriDvalue = []
var posAvalue = []
var posBvalue = []
var posCvalue = []
var posDvalue = []
var yapperValue = []
var backgroundvalue = []
var textValue = []
var voiceValue = []
var funcvalue = []
var gatekeeping = false

var charAqvalue = ""
var charBqvalue = ""
var charCqvalue = ""
var charDqvalue = ""
var animAqvalue = ""
var animBqvalue = ""
var animCqvalue = ""
var animDqvalue = ""
var oriAqvalue = ""
var oriBqvalue = ""
var oriCqvalue = ""
var oriDqvalue = ""
var posAqvalue = ""
var posBqvalue = ""
var posCqvalue = ""
var posDqvalue = ""
var yapperqvalue = ""
var backgroundqvalue = ""
var buttonAvalue = ""
var buttonBvalue = ""
var buttonCvalue = ""
var buttonDvalue = ""
var optionAvalue = ""
var optionBvalue = ""
var optionCvalue = ""
var optionDvalue = ""
var textqValue = ""
var voiceqvalue = ""
var funcqvalue = ""

var localfunc_array = []
var dialogue_running = false
var textspeed
var displayrange
var loadedbackground = null
var introplayed = false

signal display_label_text
signal resetdialogue
signal enddialogue
signal setup_convo
signal loadbackground
signal buttonsappear
signal skipdialogue

signal testfunc
