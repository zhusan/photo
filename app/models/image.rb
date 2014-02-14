class Image < ActiveRecord::Base
  mount_uploader :url, AvatarUploader
  belongs_to  :album

  after_create  :set_title_page


  def set_title_page
    album = self.album
    album.update({title_page_id: self.id}) unless album.title_page_id
  end


  def little
    self.url.to_s + "-little"
  end
end
