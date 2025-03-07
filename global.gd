extends Node

# all dialogue arrays
var allvars_array = ["charA", "charB", "charC", "charD", "animA", "animB", "animC", "animD", "oriA", "oriB", "oriC", "oriD", "posA", "posB", "posC", "posD", "yapper"]

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

var left = Vector2(10, 10)
var right = Vector2(-10, 10)

signal display_label_text

signal setup_convo
