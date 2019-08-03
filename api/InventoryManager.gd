'''Verbs relative to the player.'''
extends Node
class_name myInventoryManager

signal offered
signal given
signal taken
signal requested

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func offer(items):
	print('offered')

func give(items):
	print('given')

func take(items):
	print('taken')

func request(items):
	print('requested')
