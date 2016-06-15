class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags, each_serializer: TagSerializer, root: "tags"
  end

end
