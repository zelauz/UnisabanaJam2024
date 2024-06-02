extends Node

var trabajadores_contratados:Dictionary = {}
var fieles: int = 1
var desarrollo: int =0
var capital: float = 200
var costos: int = 0
var capital_desarrollo=15
var modificadores={"dinero fieles":float(0),"costos":float(0),"dinero desarrollo":float(0), "fieles publicidad":float(0), "inflacion":float(0)}
var ganancia_turno:float=0

func actualizacion():
	ganancia_turno=((fieles*15)*(modificadores["dinero fieles"]+1)-costos*(modificadores["costos"]+1))+capital_desarrollo*(1+modificadores["dinero desarrollo"])
	print("ganancia por turno "+str(ganancia_turno))
# Called when the node enters the scene tree for the first time.
func _ready():
	actualizacion()

