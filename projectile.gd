extends Area2D
@export var speed = 400
@export var direction = Vector2.RIGHT
@export var lifetime = 2.0  # seconds

func _ready():
	$Lifetime.wait_time = lifetime
	$Lifetime.start()

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	queue_free()  # remove projectile when it hits something

func _on_Lifetime_timeout():
	queue_free()  # remove projectile after its time runs out


func _on_timer_timeout() -> void:
	pass # Replace with function body.
@export var projectile_scene: PackedScene
func shoot():
	var projectile = projectile_scene.instantiate()
	projectile.position = position
	projectile.direction = Vector2.RIGHT if $Sprite2D.flip_h == false else Vector2.LEFT
	get_parent().add_child(projectile)
