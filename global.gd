extends Node
# all dialogue arrays
var allvars_array = ["yapper", "background", "voice", "func"]
var alldefaultpos_array = [Vector2(256,352), Vector2(904, 352), Vector2(504, 352), Vector2(648, 352)]
var alldefaultscale_array = [Vector2(8, 8), Vector2(-8, 8), Vector2(8, 8), Vector2(-8, 8)]
var allchartypes_array = ["A", "B", "C", "D"]
var allcharanim_array = ["animA", "animB", "animC", "animD"]
var voicedchars_array = ["Goober", "Domo", "Bloober", "Narrator"]

var yapper_array = []
var background_array = []
var text_array = []
var voice_array = []
var func_array = []

# all dialogue vars
var convlengthfound = false
var convlength = 0

var yapperValue = []
var backgroundvalue = []
var textValue = []
var voiceValue = []
var funcvalue = []
var gatekeeping = false
var questionasked = false

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
var yapperqvalue = ""

var localfunc_array = []
var dialogue_running = false
var textspeed
var displayrange
var loadedbackground = null
var introplayed = false

var player

signal display_label_text
signal resetdialogue
signal enddialogue
signal setup_convo
signal loadbackground
signal buttonsappear
signal skipdialogue
signal interacted
signal hitbox_entered
signal testfunc
