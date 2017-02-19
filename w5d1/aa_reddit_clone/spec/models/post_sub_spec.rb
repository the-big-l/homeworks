# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe PostSub do

  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:sub) }

  it { should belong_to(:post) }
  it { should belong_to(:sub) }
end
