extends MarginContainer


var item
var count

func new(_item, _count):
	item = _item
	count = _count

	return self

func _ready():
	$Name.set_text(item.get_name())
