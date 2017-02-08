require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow", username: "watcheronthewall")
    end

    it 'should be able to be created if valid' do
      expect(@user).to be_valid
    end

    it 'should have a default role of: student' do
      expect(@user.role).to eq('student')
    end
  end
end
