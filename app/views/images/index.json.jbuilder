json.array!(@images) do |image|
  json.extract! image, :id, :album_id, :note, :url, :file_name, :file_size
  json.url image_url(image, format: :json)
end
