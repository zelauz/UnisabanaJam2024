extends Control

var reset = []

func reset_nodes():
	var idx = 0
	for child in get_children():
		if child is Button:
			child.rect_position = reset[idx]
			child.update_lines()
			idx += 1
			child.pressed = false
			if child != $A: # A is the root of the tree and we want it enabled
				child.disabled = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$a.neighbors = [$b, $c]
	$b.neighbors = [$d, $e]
	$c.neighbors = [$e ,$f, $g]
	for child in get_children():
		if child is Button:
			reset.push_back(child.position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
