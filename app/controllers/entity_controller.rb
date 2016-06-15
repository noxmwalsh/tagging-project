class EntityController < ApplicationController
  def create
    @entity = Entity.create! entity_params
  end

  private

  def entity_params
    params.require(:entity).permit(:category, :identifier)
  end

  def tag_params
    params.require(:entity).permit(tags_list: [])[:tags_list]
  end

end
