extends Button

var neighbors = []:
	set(new_neighbors):
		for neighbor in new_neighbors:
			if not neighbors.has(new_neighbors):
				add_line(neighbor)
		neighbors = new_neighbors
var lines = []
var neighbor_lines = []
var delay = 10 

#recorre el arbol y pinta los nodos
func add_line(neighbor):
	var line = Line2D.new()
	line.width = 2
	line.z_index = -1
	line.add_point(position + size / 2)
	line.add_point(neighbor.position + neighbor.size / 2)
	line.set
	lines.push_back(line)
	neighbor.neighbor_lines.push_back(line)
	get_parent().add_child(line)


func update_lines():
	for line in lines:
		line.set_point_position(0, position + size / 2)
	for line in neighbor_lines:
		line.set_point_position(1, position + size / 2)

func _on_Button_toggled(button_pressed):
	if pressed and button_pressed:
		for neighbor in neighbors:
			neighbor.disabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


