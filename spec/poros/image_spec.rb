RSpec.describe Image do
  before :each do

    image_details = {
          "id": 4046946,
          "pageURL": "https://pixabay.com/photos/coors-field-baseball-stadium-4046946/",
          "type": "photo",
          "tags": "coors field, baseball stadium, colorado rockies",
          "previewURL": "https://cdn.pixabay.com/photo/2019/03/10/18/49/coors-field-4046946_150.jpg",
          "previewWidth": 150,
          "previewHeight": 99,
          "webformatURL": "https://pixabay.com/get/52e0d1454356aa14f1dc846096293f7a153ed8e3514c704f752f7cd69744c35d_640.jpg",
          "webformatWidth": 640,
          "webformatHeight": 426,
          "largeImageURL": "https://pixabay.com/get/52e0d1454356aa14f6da8c7dda793676113fdfe355536c48732f7bd3954dcc5ebd_1280.jpg",
          "imageWidth": 4000,
          "imageHeight": 2667,
          "imageSize": 4175073,
          "views": 2125,
          "downloads": 1260,
          "favorites": 7,
          "likes": 7,
          "comments": 2,
          "user_id": 1778011,
          "user": "1778011",
          "userImageURL": ""
      }

    @image = Image.new(image_details)
  end

  it 'has attributes: image_url, tags, location, credit' do

    expect(@image.id).to eq(4046946)
    expect(@image.tags).to eq("coors field, baseball stadium, colorado rockies")
    expect(@image.image_url).to eq("https://pixabay.com/get/52e0d1454356aa14f6da8c7dda793676113fdfe355536c48732f7bd3954dcc5ebd_1280.jpg")
    expect(@image.credit[:source]).to eq("pixabay.com")
    expect(@image.credit[:user_id]).to eq(1778011)
  end
end
