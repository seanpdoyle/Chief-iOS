class GetsSpots
  def near(location, &block)
    BW::HTTP.get("http://chief.herokuapp.com/spots.json") do |response|
      if response.ok? && block
        json = json_for(response)
        block.call(spots_from(json))
      end
    end
  end

  private

  def json_for(response)
    BW::JSON.parse(response.body.to_str)
  end

  def spots_from(json)
    spots = json["spots"].map do |spot_json|
      Spot.create(spot_json)
    end
  end
end
