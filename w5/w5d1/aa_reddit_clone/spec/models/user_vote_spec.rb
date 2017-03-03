# == Schema Information
#
# Table name: user_votes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  value        :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#  votable_id   :integer          not null
#  votable_type :string           not null
#

require 'spec_helper'

describe UserVote do

  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }
  it { should belong_to(:votable) }
end
