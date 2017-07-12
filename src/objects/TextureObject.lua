-------------------------------------------------
-- A textured object.
-- An object that can display an image.
-- This does not have an update(dt) function. Use @see KinematicObject instead.
local class = require 'middleclass'
local RenderObject = require 'src.objects.RenderObject'

local TextureObject = class('TextureObject', RenderObject)


----------------------------------------------------------------
-- Cretes a new Texture Object.
-- This object cant move.
function TextureObject:initialize(opts)
	-- Invoke parent's constructor
	RenderObject.initialize(self, opts)
	self.scale = {
		x = opts.scale or 1,
		y = opts.scale or 1
	}

	-- Calculate offsets for drawing image at center
	self.image = opts.image
	local width, height = self.image:getDimensions()
	self.image_spec = {
		w = width,
		h = height,
		offX = width * 0.5,
		offY = width * 0.5
	}
end


--------------------------------------------------
-- Draws itself.
-- Draws the image at x,y
function TextureObject:draw()
	love.graphics.draw(self.image, self.x, self.y)

	-- Only draw collision circles in debug mode.
	if self.is_debug then
		RenderObject.draw(self)
	end
end


----------------------------------------------------------
-- Set the image and offsets to the center.
function TextureObject:setImage(image)
	self.image = image
	local width, height = self.image:getDimensions()
	self.image_spec = {
		w = width,
		h = height,
		offX = width * 0.5,
		offY = width * 0.5
	}
end

return TextureObject
