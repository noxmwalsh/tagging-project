require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  describe "#index ('stats')" do

    let!(:entity_with_tags) { FactoryGirl.create(:entity_with_tags) }

    it "returns an index of tags with stats" do

      get :index

      expected_tags = entity_with_tags.tag_list
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)["tags"]
      expect(json).to be_present
      json.each do |tag|
        name_exists = expected_tags.include? tag["name"]
        expect(name_exists).to be true
        expect(tag["count"].present?).to be true
        expect(tag["count"].to_i).to eq Tag.find(tag["id"]).taggings_count
      end
    end
  end
end
