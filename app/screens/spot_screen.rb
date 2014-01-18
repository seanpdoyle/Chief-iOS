class SpotScreen < PM::Screen
  attr_accessor :spot

  def on_load
    set_attributes self.view, \
      background_color: "#ffffff".uicolor
  end

  def will_appear
    self.title = spot.name
  end
end
