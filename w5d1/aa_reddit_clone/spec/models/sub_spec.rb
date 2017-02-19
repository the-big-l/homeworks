# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  name         :string           not null
#  description  :text             not null
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Sub do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:moderator) }
  it { should validate_presence_of(:description) }

  it { should belong_to(:moderator) }
  it { should have_many(:posts) }
  it { should have_many(:post_subs) }
end
