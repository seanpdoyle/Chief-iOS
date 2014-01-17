class SpotsController < UIViewController
  CELL_IDENTIFIER = "cell_identifier"
  CELL_DEFAULTS = {accessory: :disclosure, selection: :blue}.freeze

  def viewDidLoad
    load_spots

    @table = UITableView.alloc.initWithFrame(view.frame, style:UITableViewStylePlain)
    @table.dataSource = self
    view.addSubview(@table)
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    spot = @spots[indexPath.row]

    UITableViewCell.default('cell_identifier', CELL_DEFAULTS).tap do |cell|
      cell.imageView.setImageWithURL \
        spot.small_photo_url,
        placeholderImage:"placeholder.png".uiimage

      cell.textLabel.text = spot.name
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @spots.count
  end

  private

  def load_spots
    @spots = []
    GetsSpots.alloc.init.near(nil) do |spots|
      @spots = spots
      @table.reloadData
    end
  end
end
