FactoryGirl.define do
  factory :topic do
    title 'Sports'
  end

  factory :second_topic, class: 'Topic' do
    title 'Coding'
  end
end
