extends Node

# all dialogue arrays
var allvars_array = ["charA", "charB", "charC", "charD", "animA", "animB", "animC", "animD", "oriA", "oriB", "oriC", "oriD", "posA", "posB", "posC", "posD", "yapper"]
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
var textValue = []
var gatekeeping = false

var dialogue_running = false

signal display_label_text

signal setup_convo
