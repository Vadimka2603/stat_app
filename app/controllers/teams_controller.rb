class TeamsController < ApplicationController
  

  def show
    @team = Team.find(params[:id])
    @stats = @team.stats.order(season: :desc)
  end

  def index
    @teams = Team.paginate(page: params[:page], per_page: 10)
    if params[:search]
      @teams = Team.search(params[:search]).paginate(page: params[:page], per_page: 10)
    end
  end

  def create
    @team = Team.create(team_params)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.' 
    else
      render action: 'new'
    end       
  end
  
  def team_params
      params.require(:team).permit(:name, :logo, :wiki)
  end


end
