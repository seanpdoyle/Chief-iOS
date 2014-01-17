class SpotsController < UIViewController
  CELL_IDENTIFIER = "cell_identifier"

  def viewDidLoad
    @spots = []
    @table = UITableView.alloc.initWithFrame(view.frame, style:UITableViewStylePlain)
    @table.dataSource = self
    view.addSubview(@table)

    load_spots
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    placeholder = UIImage.imageNamed("placeholder.png")

    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)

    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle,
                              reuseIdentifier:CELL_IDENTIFIER)

      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    end

    spot = @spots[indexPath.row]

    cell.tap do |tableCell|
      tableCell.text = spot.name
      tableCell.imageView.setImageWithURL(spot.small_photo, placeholderImage:placeholder)
    end
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @spots.count
  end

  private

  def load_spots
    GetsSpots.alloc.init.near(nil) do |spots|
      @spots = spots
      @table.reloadData
    end
  end
end
