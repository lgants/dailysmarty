FactoryGirl.define do
  # use sequence to overcome model validation conflicts 
  sequence :email do |n|
      "test#{n}@example.com"
    end

  sequence :username do |n|
    "test#{n}"
  end

  factory :user do
    email { generate :email }
    password "password"
    password_confirmation "password"
    first_name "Jon"
    last_name "Snow"
    username { generate :username }
  end

  factory :second_user, class: 'User' do
    email { generate :email }
    password "password"
    password_confirmation "password"
    first_name "Jon"
    last_name "Snow"
    username { generate :username }
  end
end
