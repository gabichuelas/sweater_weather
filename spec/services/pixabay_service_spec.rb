RSpec.describe PixabayService do

  before :each do
    @pixabay = PixabayService.new
  end

  it '#search_images' do
    json = @pixabay.search_images("denver,co")
    expect(json).to include(:hits)
    json[:hits].each do |hit|
      expect(hit).to include(:id)
      expect(hit).to include(:tags)
      expect(hit).to include(:largeImageURL)
      expect(hit).to include(:user_id)
    end 
  end
end
