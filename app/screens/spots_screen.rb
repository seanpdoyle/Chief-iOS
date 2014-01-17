class SpotsScreen < PM::Screen
  title "Spots"

  def on_load
    set_attributes self.view, background_color: "#ffffff".uicolor

    @scroll = add UIScrollView.alloc.initWithFrame(self.view.bounds)

    GetsSpots.alloc.init.near(nil) do |spots|
      load_spots(spots)
      layout_scroll
    end
  end

  def will_appear
    @scroll.frame = self.view.bounds
    layout_scroll
  end

  def will_appear
    set_attributes self.view, background_color: "#ffffff".uicolor
  end

  private

  def load_spots(spots)
    @spots = spots
    @spots.each_with_index do |spot, index|
      frame = frame_for(index)
      add_to @scroll, SpotView.alloc.initWithFrame(frame, andSpot: spot)
    end
  end

  def layout_scroll
    @scroll.contentSize = [ @scroll.frame.size.width, content_height(@scroll) + margin ]
  end

  def offset_for(index)
    index * (margin + size)
  end

  def frame_for(index)
    [[ margin,  offset_for(index) ], [ size, size ]]
  end

  def size
    @size ||= UIScreen.mainScreen.bounds.size.width - (2 * margin)
  end

  def margin
    10
  end
end
