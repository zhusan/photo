class Image < ActiveRecord::Base
  mount_uploader :url, AvatarUploader
  belongs_to  :album

  after_create  :set_title_page


  def set_title_page
    album = self.album
    album.update({title_page_id: self.id}) unless album.title_page_id
  end


  def get_style_image(style = 'little')
    self.url.to_s + "-" + style
  end

  def add_flower
    self.flowers += 1
    self.save
  end
end
