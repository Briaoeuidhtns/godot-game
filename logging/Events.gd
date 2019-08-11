extends Node


onready var InventoryManager = get_node('/root/InventoryManager')


func _ready():
	InventoryManager.connect('given', self, 'log_inventory', ['given'])
	InventoryManager.connect('taken', self, 'log_inventory', ['taken'])
	InventoryManager.connect('offered', self, 'log_inventory', ['offered'])
	InventoryManager.connect('requested', self, 'log_inventory', ['requested'])

func log_inventory(items, _acceptor, event):
	Logger.info('%s %s.' % [event, items])
