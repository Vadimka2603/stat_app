ActiveAdmin.register Stat do
  belongs_to :team,  optional: true

  config.per_page = 10
  actions :all

  filter :team
  filter :year

  index do
    column "Team" do |stat|
      istat.team.name
    end
    column :season
    column :win
    column :draw
    column :lose
    column :up
    column :under
    column :odd
    column :even
  end

  
  sidebar "Данные", :only => :show do
    attributes_table_for stat do
      row :id
      row :team 
      row :season
      row :created_at
      
    end
  end

end
