# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  wiki       :string
#  string     :string
#  logo       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base

has_many :stats

ActiveAdmin.register Team do
  permit_params :name, :logo, :wiki
end

  private

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end

end
