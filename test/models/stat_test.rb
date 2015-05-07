# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  win        :integer
#  lose       :integer
#  draw       :integer
#  up         :integer
#  down       :integer
#  odd        :integer
#  even       :integer
#  team_id    :integer
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
