class Spot
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns id:     :integer,
          name:   :string,
          lat:    :float,
          lng:    :float,
          photos: :array

  def photos
    super.each_with_object({}) do |tuple, hash|
      hash[tuple[0].to_sym] = tuple[1]
    end
  end

  def small_photo_url
    photos[:small].nsurl
  end

  def medium_photo_url
    photos[:medium].nsurl
  end

  def large_photo_url
    photos[:large].nsurl
  end
end