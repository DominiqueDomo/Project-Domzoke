extends Node

# all dialogue arrays
var allvars_array = ["charA", "charB", "charC", "charD", "animA", "animB", "animC", "animD", "oriA", "oriB", "oriC", "oriD", "posA", "posB", "posC", "posD", "yapper", "background"]
var alldefaultpos_array = [Vector2(250,300), Vector2(900, 300), Vector2(500, 300), Vector2(650, 300)]
var alldefaultscale_array = [Vector2(10, 10), Vector2(-10, 10), Vector2(10, 10), Vector2(-10, 10)]
var allchartypes_array = ["A", "B", "C", "D"]
var allcharanim_array = ["animA", "animB", "animC", "animD"]

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

var dialogue_running = false
var textspeed
var displayrange
var loadedbackground = null

signal display_label_text
signal resetdialogue
signal enddialogue
signal setup_convo
signal loadbackground
signal buttonsappear
signal skipdialogue
