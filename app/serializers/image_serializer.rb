class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image_url, :tags, :credit
end
