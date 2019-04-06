require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do

  describe User do   
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

    it { should have_many(:goals) }
    it { should have_many(:comments) }

    it 'ensures session token' do
      user = User.new(password: 'iohqdioqd', username: 'bob')
      user.save!
      expect(user.session_token).to_not be(nil)
    end

    it 'looks up by credentials' do
      user = User.new(password: 'iohqdioqd', username: 'bob')
      user.save!
      user2 = User.find_by_credentials('bob', 'iohqdioqd' )
      expect(user2 == user).to be(true)
      expect(user2).to_not be(false)
    end
  end

end
