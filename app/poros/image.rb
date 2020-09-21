class Image
  attr_reader :id, :image_url, :credit
  def initialize(image_data)
    @id = image_data[:id]
    @image_url = image_data[:largeImageURL]
    @credit = {
      source: "pixabay.com",
      user_id: image_data[:user_id]
    }
  end
end
