class EntityStatsSerializer < EntitySerializer

  attributes :tag_count, :category_count

  def tag_count
    object.tag_list.count
  end

  def category_count
    Entity.all.where(category: self.category).count
  end

end
