extends 'res://abstract/Interactable.gd'
class_name myContainer

onready var InventoryManager = get_node('/root/InventoryManager')
const Item = preload('res://abstract/Item.gd')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	InventoryManager.offer([Item.new()])
