extends Button
signal _me_precionaron(precio,fieles)
func _ready():
	for i  in get_tree().get_nodes_in_group("Editor"):
		i.connect("editar_boton",_editar)
func _on_pressed():
	emit_signal("_me_precionaron",$precio.text,$Fieles.text)
	
func _editar():
	var p=float($precio.text)
	p*=Global.modificadores["inflacion"]+1
	var f =float($Fieles.text)
	f*=Global.modificadores["fieles publicidad"]+1
	$precio.text=str(int(p))
	$Fieles.text=str(int(f))
