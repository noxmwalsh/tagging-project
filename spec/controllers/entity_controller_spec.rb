require 'rails_helper'

RSpec.describe EntityController, type: :controller do

  describe "POST #create" do
    it "create an entity and returns a JSON response of the new entity" do
      category = "Article"
      identifier = "1234"
      tags = ["Pink", "Blue", "Corgi"]

      post :create, entity: {
        category: category,
        identifier: identifier,
        tags_list: tags
      }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)["entity"]
      expect(json["category"]).to eq category
      expect(json["identifier"]).to eq identifier
      json["tags"].each do |tag|
        tag_exist = tags.include? tag["name"]
        expect(tag_exist).to be true
      end
    end
  end

  describe "GET #show" do
    let(:entity) { FactoryGirl.create :entity, {tag_list: ["Corgi", "Lemur", "Purple"] } }

    it "returns a JSON response with the entity" do

      get :show, identifier: entity.identifier

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)["entity"]
      expect(json["category"]).to eq entity.category
      expect(json["identifier"]).to eq entity.identifier
      json["tags"].each do |tag|
        tag_exist = entity.tag_list.include? tag["name"]
        expect(tag_exist).to be true
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:entity) { FactoryGirl.create :entity_with_tags }
    let!(:non_deleted_entity) { FactoryGirl.create :entity_with_tags }

    it "deletes an entity and all of its associated tags" do

      expected_tag_count = Tag.all.map(&:taggings_count).sum - entity.tag_list.count

      delete :destroy, { identifier: entity.identifier }

      expect(response).to have_http_status(:no_content)
      expect(Entity.find_by_identifier(entity.identifier)).to be nil
      new_count = Tag.all.map(&:taggings_count).sum
      expect(new_count).to be expected_tag_count
    end

  end
end
