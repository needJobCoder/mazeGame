extends Node2D

@onready var grid : Node2D = $"."

var cellsMatrix  = []
var horizontalDistance = 128
var verticalDistance = 128

	#_assembleCells()
	#assembleGridPosition()
	#var row: Array = verticalGetRow(1, cellsMatrix)
	#var newArr = rightClickRow(row)
	#cellsMatrix[1] = newArr
	#print(cellsMatrix)

func _ready():
	_assembleCells()
	assembleGridPosition()
	

	
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
func verticalGetRow(row_index: int, matrix : Array):
	var index = 0
	for row in matrix:
		var getRowToPerformOperations :Array
		
		if index == row_index:
			getRowToPerformOperations = row
			return getRowToPerformOperations
		else:
			pass
		index += 1
			

func getTranspose(matrixToBeTransposed: Array) -> Array:
	var matrix = []
	var cellsArr = []
	for col_index in range(matrixToBeTransposed.size()):
		var i = 1
		for row_index in range(matrixToBeTransposed.size()):
			var element = matrixToBeTransposed[row_index][col_index]
			#print(element)
			if i % 3 == 0:
				cellsArr.push_back(element)
				matrix.push_back(cellsArr)
				cellsArr = []
			else:
				cellsArr.push_back(element)
			i += 1
	return matrix

func rightClickRow(cellArr : Array):
	var top : Node2D = cellArr[0]
	cellArr.pop_front()
	cellArr.push_back(top)
	return 	cellArr


func _on_left_0_pressed():
	var row: Array = verticalGetRow(0, cellsMatrix)
	var newArr = rightClickRow(row)
	cellsMatrix[0] = newArr
	assembleGridPosition()
