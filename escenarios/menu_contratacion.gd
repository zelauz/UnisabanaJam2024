extends Control

signal editar_boton()

var desempleados={1:[100,"res://personaje1.png",100,50,0],
				2:[100,"res://personaje2.png",0,50,100],
				3:[60,"res://personaje3.png",10,90,20],
				4:[120,"res://personaje4.png",60,30,90],
				5:[80,"res://personaje5.png",10,10,100],
				6:[500,"res://personaje6.png",100,100,1],
				7:[120,"res://personaje7.png",10,60,80],
				8:[100,"res://personaje8.png",60,10,60]}


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in desempleados:
		_nuevo_trabajador(i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _nuevo_trabajador(id:int):
	
	var info_boton = desempleados.get(id)
	var boton_contratacion=preload("res://escenarios/boton_contratacion.tscn")
	var boton=boton_contratacion.instantiate() as TextureButton
	boton._me_contrataron.connect(self._button_pressed)
	boton.texture_normal=load(info_boton[1])
	boton.scale=Vector2(5,5)
	var label=boton.get_child(1)
	label.text=str(info_boton[0])
	label=boton.get_child(0).get_child(0)
	label.value=info_boton[2]
	label=boton.get_child(0).get_child(1)
	label.value=info_boton[3]
	label=boton.get_child(0).get_child(2)
	label.value=info_boton[4]
	label=boton.get_child(2)
	label.text=str(id)
	$TextureRect/ScrollContainer/MenuBar.add_child(boton)

func _button_pressed(id,precio):
	Global.capital-=int(precio)
	Global.trabajadores_contratados[id]=desempleados[int(id)]
	var modificaciones = desempleados.get(int(id))
	Global.costos+=modificaciones[0]
	print(Global.costos)
	Global.modificadores["dinero desarrollo"]+=modificaciones[2]
	print(Global.modificadores)
	Global.actualizacion()
	Global.modificadores["fieles publicidad"] += float(modificaciones[3])/200
	emit_signal("editar_boton")
	
	match Global.trabajadores_contratados.size():
		1:
			$"../Personal/empleados/T1".texture_normal=load(modificaciones[1])
		2:
			$"../Personal/empleados/T2".texture_normal=load(modificaciones[1])
		3:
			$"../Personal/empleados/T3".texture_normal=load(modificaciones[1])
		4:
			$"../Personal/empleados/T4".texture_normal=load(modificaciones[1])
		5:
			$"../Personal/empleados/T5".texture_normal=load(modificaciones[1])
	
	desempleados.erase(int(id))
	var reinicio = $TextureRect/ScrollContainer/MenuBar.get_children()
	for i in reinicio:
		i.queue_free()
	for i in desempleados:
		_nuevo_trabajador(i)
		
	$".".set_visible(false)
	$"..".orden_trabajadores[$"..".trabajador_seleccionado]=int(id)
	print(Global.trabajadores_contratados)
	
	match $"..".trabajador_seleccionado:
		1:
			$"../Personal/empleados/T2".disabled=false
		2:
			$"../Personal/empleados/T3".disabled=false
		3:
			$"../Personal/empleados/T4".disabled=false
		4:
			$"../Personal/empleados/T5".disabled=false
	

func _on_salir_pressed():
	$".".set_visible(false)
	
	
