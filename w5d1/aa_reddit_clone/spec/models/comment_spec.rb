# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :text             not null
#  parent_comment_id :integer
#  post_id           :integer          not null
#  user_id           :integer          not null
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Comment do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:post) }
  it { should validate_presence_of(:body) }

  it { should belong_to(:author) }
  it { should belong_to(:post) }
  it { should have_many(:child_comments) }
  it { should belong_to(:parent_comment) }

end
