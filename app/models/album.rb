class Album < ActiveRecord::Base
  include ActsAsTaggableOn
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  has_many  :images


  def title_page
    image = Image.find_by_id(self.title_page_id)
    return  image.little if image
    ""
  end
end
