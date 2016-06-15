class EntityController < ApplicationController
  def create
    @entity = Entity.create! entity_params
    @entity.create_tags tag_params
    render json: @entity, serializer: EntitySerializer
  end

  def show
    @entity = Entity.find_by_identifier(params[:identifier])
    render json: @entity, serializer: EntitySerializer
  end

  private

  def entity_params
    params.require(:entity).permit(:category, :identifier)
  end

  def tag_params
    params.require(:entity).permit(tags_list: [])[:tags_list]
  end

end
