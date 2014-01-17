class SpotsController < UIViewController
  CELL_IDENTIFIER = "cell_identifier"
  CELL_DEFAULTS = {accessory: :disclosure, selection: :blue}.freeze

  def viewDidLoad
    load_spots
    load_location

    @table = UITableView.alloc.initWithFrame(view.frame, style:UITableViewStylePlain)
    @table.dataSource = self
    view.addSubview(@table)
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    spot = @spots[indexPath.row]

    UITableViewCell.subtitle('cell_identifier', CELL_DEFAULTS).tap do |cell|
      cell.imageView.setImageWithURL \
        spot.small_photo_url,
        placeholderImage:"placeholder.png".uiimage

      if @location
        distance = spot.distanceFrom(@location)
        distanceString = distance.in_miles.string_with_style(:decimal)
        cell.detailTextLabel.text = "#{distanceString} miles away"
      end

      cell.textLabel.text = spot.name
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @spots.count
  end

  private

  def load_location
    BW::Location.get_significant do |result|
      @location = result[:to]
      @table.reloadData
    end
  end

  def load_spots
    @spots = []
    @getsSpots ||= GetsSpots.alloc.init
    @getsSpots.near(nil) do |spots|
      @spots = spots
      @table.reloadData
    end
  end

  def dealloc
    @spots.map(&:release)
    @getsSpots.release
    @location.release
    @table.release
    super
  end
end
