class Image < ActiveRecord::Base
  mount_uploader :url, AvatarUploader
  belongs_to  :album

  after_create  :set_title_page


  def set_title_page
    album = self.album
    puts '000000000000000000000'
    puts album.id
    puts '000000000000000000000'
    album.update({title_page_id: self.id}) unless album.title_page_id
  end


  def get_style_image(style = 'little')
    self.url.to_s + "-" + style
  end
end
