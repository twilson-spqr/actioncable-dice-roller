require 'rails_helper'

RSpec.describe User, type: :model do
  context "#user" do
    it { should have_valid(:username).when('Azathoth', 'num112358') }
    it { should_not have_valid(:username).when(nil, '', 'bob', 'iamthegreatandterribleozwhoareyou', '$ymbols') }

    it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
    it { should_not have_valid(:email).when(nil, '', 'urser', 'usersr@com', 'usersba.com') }

    it { should validate_uniqueness_of(:username) }

    it 'has a matching password confirmation for the password' do
      user = User.new
      user.email = 'email@example.com'
      user.username = "StarChild"
      user.password = 'password'
      user.password_confirmation = 'another password'

      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to_not be_blank
    end

    it 'has requires a unique username' do
      original = FactoryGirl.create(:user)
      user = User.new
      user.username = original.username
      user.password = 'password'
      user.password_confirmation = 'password'

      expect(user).to_not be_valid
      expect(user.errors[:username]).to_not be_blank
    end
  end

  context "#associations" do
    it { should have_many :tables }
    it { should have_many :messages }
    it { should have_many :saved_rolls }
  end
end
