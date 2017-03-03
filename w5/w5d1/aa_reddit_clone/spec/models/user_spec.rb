# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }
    it 'should validate password is > 6 chars' do
      user = User.new(name: 'leo', password: 'pass')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'should allow password that is > 6 chars' do
      user = User.new(name: 'leo', password: 'password')
      user.valid?
      expect(user.errors.full_messages).not_to include("Password is too short (minimum is 6 characters)")
    end
  end

  context 'associations' do
    it { should have_many(:subs) }
    it { should have_many(:user_votes) }
    it { should have_many(:comments) }
  end

  context 'security' do
    it 'should check if a password is correct' do
      user = User.new(name: 'leo', password: 'password')
      expect(user.is_password?('password')).to be true
    end

    it 'should not allow incorrect passwords' do
      user = User.new(name: 'leo', password: 'password')
      expect(user.is_password?('pasword')).not_to be true
    end

    it '#reset_session_token' do
      user = User.new(name: 'leo', password: 'password')
      session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(session_token)
    end

  end
end
