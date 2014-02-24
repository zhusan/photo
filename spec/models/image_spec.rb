require 'spec_helper'
describe  Image do
  describe "#set_title_page" do
    it "album.title_page_id is not nil" do
      album = Album.create({name: "test"})
      image = Image.new({album_id: album.id})
      image.save
      album.reload
      expect(album.title_page_id).to eq(image.id)
    end 
    it "album.title_page_id is nil" do
      album = Album.create({name: "test", title_page_id: 1})
      image = Image.new({album_id: album.id})
      image.save
      album.reload
      expect(album.title_page_id).to_not eq(image.id)

    end 
  end
  it "#get-style_image" do
  end

  it "#add_flower" do
    album = Album.create({name: "test"})
    image = Image.new({album_id: album.id})
    image.save
    image.add_flower
    expect(image.flowers).to eq(1)
  end
end
