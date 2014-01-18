class SpotCard < UIView
  include PM::Styling

  attr_reader :spot

  def initWithFrame(frame, andSpot:spot)
    initWithFrame(frame)

    @spot = spot

    @image = UIImageView.alloc.initWithFrame(self.bounds)
    @image.setImageWithURL(@spot.medium_photo_url, placeholderImage:"placeholder.png".uiimage)
    self.addSubview @image

    labelFrame = [[0,0], [@image.bounds.size.width, 50]]

    @title = UILabel.alloc.initWithFrame(labelFrame)
    set_attributes @title, \
      text: spot.name,
      background_color: "#F6F6F6".uicolor,
      layer: { opacity: 0.4 }
    @image.addSubview @title

    set_attributes self, \
      background_color: "#F6F6F6".uicolor,
      layer: {
        shadow_radius: 4.0,
        shadow_opacity: 0.2,
        shadow_color: :black.uicolor.CGColor
      }
    self
  end
end
