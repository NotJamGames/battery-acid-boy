extends Sprite2D


var elapsed_delta : float = .0
const UPDATE_INTERVAL : float = .08


func _ready() -> void:
	texture = ImageTexture.create_from_image\
			(Image.create(120, 120, false, Image.FORMAT_BPTC_RGBA))


func _physics_process(delta : float) -> void:
	elapsed_delta += delta
	if elapsed_delta < UPDATE_INTERVAL: return

	elapsed_delta = fmod(elapsed_delta, UPDATE_INTERVAL)

	var image : Image = texture.get_image()
	var trans_image : Image = Image.create\
			(120, 120, false, Image.FORMAT_RGBA8)
	trans_image.fill(Color(.0, .0, .0, .02))

	if image.is_compressed():
		image.decompress()

	image.blend_rect(trans_image, Rect2i(0, 0, 120, 120), Vector2i.ZERO)

	texture = ImageTexture.create_from_image(image)


func add_footprint(from_position : Vector2i, strength : float) -> void:
	var image : Image = texture.get_image()

	if image.is_compressed():
		image.decompress()

	image.set_pixelv(from_position, Color(.0, 1.0, .0, strength))
	texture = ImageTexture.create_from_image(image)
