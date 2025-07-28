extends CharacterBody3D

# How fast the player moves in metres per second
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var targert_velocity = Vector3.ZERO


func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction =  Vector3.ZERO
	
	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		# Notice now we are working with the vector's and z axes
		# In 3D, the XZ plane is the ground plane.
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Setting the basis property will affect the rotation of the node
		$Pivot.basis = Basis.looking_at(direction)
		
	# Ground Velocity
	targert_velocity.x = direction.x * speed
	targert_velocity.z = direction.z * speed
	
	# Vertical velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		targert_velocity.y = targert_velocity.y - (fall_acceleration * delta)
	
	# Moving the Character
	velocity = targert_velocity
	move_and_slide()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
