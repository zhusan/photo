class Image < ActiveRecord::Base
  mount_uploader :url, AvatarUploader
  belongs_to  :album


  def little
    self.url.to_s + "-little"
  end
end
