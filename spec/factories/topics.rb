FactoryGirl.define do
  factory :topic do
    title 'Sports'

    # Allows the factory know that it may have a case where it has multiple posts associated with it
    factory :topic_with_posts do
      transient do
        posts_count 2
      end
      after(:create) do |topic, evaluator|
        create_list(:post, evaluator.posts_count, topic: topic)
      end
    end
  end

  factory :second_topic, class: 'Topic' do
    title 'Coding'
  end
end
