extends Control
var orden_trabajadores={}
var trabajador_seleccionado=0
var publicidades: Dictionary = {1:[100,"Publicacion en redes sociales",3],
							2:[150,"Campaña Publicitaria",5],
							3:[250,"Espacio publicitario ",8],
							4:[500,"Anuncio Polemico",10],
							5:[750,"!Estamos en el Top 100!",14],
							6:[100,"Expandamonos a mas areas",20],
							7:[500,"Los famosos sirven de promocion!",30],
							8:[10000,"anuncio en el SuperBowl",50],
							9:[100000,"Rule",150]}


func _ready():
	for i in publicidades:
		_nueva_publicidad(i)
		
func _process(_delta):
	pass
func _publicidad_seleccionada(_id):
	pass
func _nueva_publicidad(id:int):
	var info_boton = publicidades.get(id)
	
	var boton_nuevo = preload("res://escenarios/botones.tscn")
	var boton=boton_nuevo.instantiate() as Button
	boton._me_precionaron.connect(self._button_pressed)
	boton.text=info_boton[1]
	
	var label=boton.get_child(0)
	label.text=str(info_boton[0])
	label=boton.get_child(1)
	label.text=str(info_boton[2])
	$Publicidad/VBoxContainer.add_child(boton)
	
func _button_pressed(costo,fieles):
	print("recursos "+costo+" " + fieles)
	Global.fieles+=int(fieles)
	print("fieles " + str(Global.fieles))
	Global.capital-=int(costo)
	Global.actualizacion()


func _on_publicidad_2_pressed():
	$Publicidad.set_visible(true)
	$Personal.set_visible(false)

func _on_personal_2_pressed():
	$Publicidad.set_visible(false)
	$Personal.set_visible(true)


func _on_t_1_pressed():
	trabajador_seleccionado=1
	if(Global.trabajadores_contratados.size()==0):
		$menu_contratacion.set_visible(true)

func _on_t_2_pressed():
	trabajador_seleccionado=2
	if(Global.trabajadores_contratados.size()<2):
		$menu_contratacion.set_visible(true)


func _on_t_3_pressed():
	trabajador_seleccionado=3
	if(Global.trabajadores_contratados.size()<3):
		$menu_contratacion.set_visible(true)


func _on_t_4_pressed():
	trabajador_seleccionado=4
	if(Global.trabajadores_contratados.size()<4):
		$menu_contratacion.set_visible(true)


func _on_t_5_pressed():
	trabajador_seleccionado=5
	if(Global.trabajadores_contratados.size()<5):
		$menu_contratacion.set_visible(true)
