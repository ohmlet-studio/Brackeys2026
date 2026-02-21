extends Control

@onready var objMesh1: MeshInstance3D = $SubViewportContainer/SubViewport/Node3D/Object1
@onready var objMesh2: MeshInstance3D = $SubViewportContainer/SubViewport/Node3D/Object2
@onready var objMesh3: MeshInstance3D = $SubViewportContainer/SubViewport/Node3D/Object3

func _ready() -> void:
	var scene: Node3D = load("res://assets/models/memory_objects/carnet.fbx").instantiate() as Node3D
	var src_mi: MeshInstance3D = scene.get_child(0) as MeshInstance3D
	var source_mesh: Mesh = src_mi.mesh
	objMesh1.mesh = source_mesh.duplicate() as Mesh
	
	scene = load("res://assets/models/memory_objects/lighter.fbx").instantiate() as Node3D
	src_mi = scene.get_child(0) as MeshInstance3D
	source_mesh = src_mi.mesh
	objMesh2.mesh = source_mesh.duplicate() as Mesh
