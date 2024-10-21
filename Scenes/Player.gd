extends KinematicBody2D

#Windows sizes:
#(1396, 732) - fullscreen
#(1024, 600) - compressed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lives=1
var last_position= self.get_position()
var motion = Vector2(0,0)
const UP = Vector2(0,-1)

export var speed = 250
export var jump_speed = 250
export var gravity= 7
signal animate
signal set_lives


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		motion.x = 0
	elif Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = speed
	else:
		motion.x = 0
		
	if motion.x!=0 and is_on_floor():
		last_position= self.position
		
func jump():
	#je mozne urobit ako feture s cool down = any_time
	#if Input.is_action_just_pressed("jump"):
	#	motion.y = -jump_speed
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y = -jump_speed	
		
		
func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	else:
		motion.y += gravity


func animate():
  emit_signal("animate", motion)



#funkcia, ktora umoznuje sledovat nieco tym, ze sa vola sa kazdy frame
func _physics_process(delta):
	move()
	jump()
	animate()
	apply_gravity()
	move_and_slide(motion, UP)
		
		

func _on_falling_detected(body):
	if lives>0:
		lives=lives-1
		emit_signal("set_lives",lives)
		self.position=last_position



func _on_life_collected():
	lives=lives+1
	



