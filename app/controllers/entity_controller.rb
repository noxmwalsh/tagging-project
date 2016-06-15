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

  def destroy
    @entity = Entity.find_by_identifier(params[:identifier])
    @entity.destroy
    head :no_content
  end

  def tag_entity_stats
    @entity = Entity.where(identifier: params[:identifier]).first
    if @entity.tag_list.empty?
      render json: { errors: { untagged_entity_error: "Entity is untagged" } }, status: 422
    end
    render json: @entity, serializer: EntityStatsSerializer
  end

  private

  def entity_params
    params.require(:entity).permit(:category, :identifier)
  end

  def tag_params
    params.require(:entity).permit(tags_list: [])[:tags_list]
  end

end
