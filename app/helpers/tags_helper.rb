module TagsHelper
  def tag_names(tags)
    tags.map(&:name).join(', ')
  end
end
