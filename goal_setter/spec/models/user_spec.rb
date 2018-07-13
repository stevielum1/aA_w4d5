# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) { User.new(email: 'email@email.com', password: '123456') }
  
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
  
  # describe 'associations' do
  #   it { should have_many(:goals) }
  # end
  
  describe 'session token' do
    it 'sets the user\'s session token after initialize' do
      expect(user.session_token).not_to be_nil
    end
  end
  
  describe '::find_by_credentials' do
    before(:each) do
      User.create(email: 'email@email.com', password: '123456')
    end
    it 'finds a user with valid credentials' do
      expect(User.find_by_credentials('email@email.com','123456')).to_not be_nil
    end
    
    it 'returns nil with invaild credentials' do
      expect(User.find_by_credentials('email@email.com','bad_password')).to be_nil
    end
  end
  
end
