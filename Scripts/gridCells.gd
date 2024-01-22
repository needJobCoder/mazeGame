extends Node2D

@onready var grid : Node2D = $"."

var cellsMatrix  = []
var horizontalDistance = 128
var verticalDistance = 128

func _ready():
	_assembleCells()
	#print(cellsMatrix)
	assembleGridPosition()
	#performOperations()
	#print(verticalGetRow(1))
	getColumns()
	
	
func _assembleCells():
	var cells = grid.get_children()
	var cellsArr = []
	var i = 1
	for cell in cells:
		if i % 3 == 0:
			cellsArr.push_back(cell)
			cellsMatrix.push_back(cellsArr)
			cellsArr = []
		else:
			cellsArr.push_back(cell)
			
		i += 1
		

func assembleGridPosition():
	var verticalDistance = 0
	var horizontalDistance = 0
	var verticalGap = 50
	var horizontalGap = 50

	for row in cellsMatrix:
		var i = 0
		for element in row:
			element.global_position = Vector2(horizontalDistance + horizontalGap, verticalDistance + verticalGap)
			#print(element.global_position)
			horizontalGap += 128
			i += 1
			if i % 3 == 0:
				verticalGap += 128
				horizontalGap = 50

		verticalGap = 50  # Reset vertical gap for the next row
		verticalDistance += 128

			
func performOperations():
	for row in range(cellsMatrix.size()):
		for col in range(cellsMatrix.size()):
			print(col)

# return row
func verticalGetRow(row_index: int):
	var index = 0
	for row in cellsMatrix:
		var getRowToPerformOperations :Array
		
		if index == row_index:
			getRowToPerformOperations = row
			return getRowToPerformOperations
		else:
			pass
		index += 1
			

func getColumns():
	for col_index in range(cellsMatrix.size()):
		for row_index in range(cellsMatrix.size()):
			var element = cellsMatrix[row_index][col_index]
			print(element)
					

