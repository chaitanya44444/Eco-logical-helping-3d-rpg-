extends CharacterBody3D


var speed 
const sprint_speed = 8.0
const walk_SPEED = 6.0
const JUMP_VELOCITY = 4.5
var gravity = 9.8
const sens = 0.007
const camera_shake = 2
const camera_amplitude = 0.08
var t_camera = 0.0
var canmove = true
var start_position: Vector3
@onready var head = $head
@onready var camera = $head/Camera3D
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	speed = walk_SPEED
	start_position = global_transform.origin

func teleport_to_start():
	global_transform.origin = start_position
	
func _input(event):
	if canmove == true:
		if event is InputEventMouseMotion:
			head.rotate_y(-event.relative.x * sens)
			camera.rotate_x(-event.relative.y * sens)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	SimpleGrass.set_player_position(global_position)

	
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	#sprint
	if Input.is_action_just_pressed("sprint"):
		speed = sprint_speed
	if Input.is_action_just_released("sprint"):
		speed = walk_SPEED
	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if canmove == true:
		
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = 0
			velocity.z = 0

		
		
#camera shake while walking
	#t_camera += delta * velocity.length() * float(is_on_floor())
	#camera.transform.origin = _headbob(t_camera)
	

	move_and_slide()



#func _headbob(time) -> Vector3:
	#var pos = Vector3.ZERO
	#pos.y = sin(time * camera_shake) * camera_amplitude
	#pos.x = cos(time * camera_shake/2) * camera_amplitude
	#return pos
