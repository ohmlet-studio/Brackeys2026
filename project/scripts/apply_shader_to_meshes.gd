extends Node

@export var material: Material

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr

func _ready() -> void:
	var children = get_all_children(get_tree().root)
	for child in children:
		if child is MeshInstance3D:
			var mesh_instance: MeshInstance3D = child
			for i in mesh_instance.mesh.get_surface_count():
				var og_material = mesh_instance.get_active_material(i)
				if og_material:
					var color = og_material.albedo_color
					var texture = og_material.albedo_texture
					var new_material = material.duplicate()
					new_material.set_shader_parameter("color", color)
					new_material.set_shader_parameter("texture", texture)
					mesh_instance.set_surface_override_material(i, new_material)
