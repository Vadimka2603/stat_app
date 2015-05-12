# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  season     :integer
#  win        :integer
#  draw       :integer
#  lose       :integer
#  up         :integer
#  under      :integer
#  odd        :integer
#  even       :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stat < ActiveRecord::Base
  belongs_to :team
  validates :team_id, presence: true

  ActiveAdmin.register Stat do
    permit_params :season, :team_id, :win, :draw, :lose, :up, :under, :odd, :even 
  end
end
