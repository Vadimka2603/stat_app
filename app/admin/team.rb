ActiveAdmin.register Team do
	
  config.per_page = 20

  actions :all

  index do
    column :id
    column "Лого" do |team|
      link_to image_tag(team.logo)
    end
    column "name" do |team|
      link_to team.name, admin_team_path(team)
    end
    column "Show user micrposts" do |team|
      link_to "Stats", admin_team_stats_path(team)
    end
  end
 
  show do
    attributes_table_for team do
  	  row :id
      row "Лого" do |team|
        link_to image_tag(team.logo)
      end
      row :name
      row "Description" do |team|
        link_to team.wiki, team.wiki
      end
      
    end
  end
end
