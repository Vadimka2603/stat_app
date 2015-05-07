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

class Stat < ActiveRecord::Base

  belongs_to :team
  

  validates :season, presence: true
  validates :team,   presence: true
  validates :win,    presence: true
 # validates :lose,   presence: true
 # validates :draw,   presence: true
  #validates :up,     presence: true
 # validates :down,   presence: true
 # validates :odd,    presence: true
 # validates :even,   presence: true
  

end
