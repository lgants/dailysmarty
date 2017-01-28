require 'rails_helper'

describe 'post' do
  before do
    # @topic = FactoryGirl.create(:topic)
    @topic = FactoryGirl.create(:topic_with_posts)
  end

  describe 'nested route' do
    before do
      visit topic_posts_path(topic_id: @topic)
    end

    it 'has an index page properly nested under a topic' do
      expect(page.status_code).to eq(200)
    end

    it 'renders multiple posts' do
      expect(@topic.posts.count).to eq(2)
    end

    it 'has the post title' do
      expect(page).to have_content('My Great Post')
    end

    it 'has the post description' do
      expect(page).to have_content('Amazing content')
    end

    it 'has the post user name' do
      expect(page).to have_content(@topic.posts.last.user.username)
    end

    it 'has post links that point to post show pages' do
      expect(page).to have_link(@topic.posts.last.title, href: topic_post_path(topic_id: @topic, id: @topic.posts.last))
    end
  end
end
