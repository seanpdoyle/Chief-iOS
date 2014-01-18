class SpotsScreen < PM::Screen
  title "Spots"

  def on_load
    set_attributes self.view, background_color: "#ffffff".uicolor
  end

  def will_appear
    @scroll ||= add UIScrollView.alloc.initWithFrame(self.view.bounds)
    @scroll.frame = self.view.bounds

    layout_scroll

    GetsSpots.alloc.init.near(nil) do |spots|
      load_spots(spots)
    end
  end

  private

  def load_spots(spots)
    @spots = spots
    @spots.each_with_index do |spot, index|
      spotView = add_to @scroll, SpotCard.alloc.initWithFrame(frame_for(index), andSpot: spot)

      spotView.when_tapped do
        open SpotScreen.new(nav_bar: true, spot: spot)
      end
    end
    layout_scroll
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
