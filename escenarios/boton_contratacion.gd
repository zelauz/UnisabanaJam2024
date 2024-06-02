extends TextureButton

signal _me_contrataron(id,precio)
	

# Called when the node enters the scene tree for the first time.



func _on_pressed():
	emit_signal("_me_contrataron",$id.text,$Nombre.text)
