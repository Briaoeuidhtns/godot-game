extends AcceptDialog

onready var InventoryManager = get_node('/root/InventoryManager')
var Item = preload('res://ui/Item.tscn')
var stored_items := {}


onready var item_list = $main/Scroll/Items
# Called when the node enters the scene tree for the first time.
func _ready():
	InventoryManager.connect('offered', self, '_on_Item_offered')


func _on_Item_offered(items, _accept):
	popup_items(items)


func _on_accepted():
	InventoryManager.give(stored_items)


func popup_items(items):
	stored_items = items

	for item in item_list.get_children():
		item_list.remove_child(item)
		item.queue_free()

	for item in items:
		var ui_item = Item.instance().new(item, items[item])
		item_list.add_child(ui_item)

	self.popup_centered_ratio()
