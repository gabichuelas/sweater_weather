class Image
  attr_reader :id, :tags, :image_url, :credit
  def initialize(image_data)
    @id = image_data[:id]
    @tags = image_data[:tags]
    @image_url = image_data[:largeImageURL]
    @credit = {
      source: "pixabay.com",
      user_id: image_data[:user_id]
    }
  end
end
