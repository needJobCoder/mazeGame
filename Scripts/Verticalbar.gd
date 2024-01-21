extends Node2D

var distance : int = 130
@onready var partOne : Node2D = $"1"
@onready var partTwo: Node2D = $"2"
@onready var partThree : Node2D = $"3"
@onready var verticalBarArray : Array = [partOne, partTwo, partThree]

func _ready():
	var distanceBetweenParts = 300
	for part in verticalBarArray:
		part.global_position.x = distanceBetweenParts + distance
		part.global_position.y = 350
		distanceBetweenParts += distance
		
func toggleUp():
	var top = verticalBarArray[0]
	verticalBarArray.pop_at(0)
	verticalBarArray.append(top)
	var distanceBetweenParts = 300
	var index : int = 0
	for part in verticalBarArray:
		part.global_position.x = distanceBetweenParts + distance
		part.global_position.y = 350
		distanceBetweenParts += distance

func _on_left_pressed():
	toggleUp()
	print(verticalBarArray)
