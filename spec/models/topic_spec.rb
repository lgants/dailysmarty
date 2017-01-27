require 'rails_helper'

RSpec.describe Topic, type: :model do
  before do
    @topic = Topic.create(title: "Sports")
  end

  describe 'validations' do
    it 'cannot be created without a title' do
      @topic.title = nil
      expect(@topic).to_not be_valid
    end

    it 'cannot be created without a slug' do
      @topic.slug = nil
      expect(@topic).to_not be_valid
    end
  end
end
