class Entity < ActiveRecord::Base

  acts_as_taggable

  def create_tags tag_list
    self.tag_list.add(tag_list)
    self.save!
  end

end
