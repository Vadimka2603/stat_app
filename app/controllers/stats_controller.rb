class StatsController < ApplicationController
  def show
    @stat = Stat.find(params[:id])
  end

  def create
  	source = 'https://www.betmarathon.com/su/sportstatext.htm?nr5=6126&gmt=2474%2C8'
    page = Nokogiri::HTML(open(source), nil, 'UTF-8')
    @home_team = page.css("td.ss-member.ss-mem-1").map {|i| i.children.to_s}
    @avay_team = page.css("td.ss-member.ss-mem-2").map {|i| i.children.to_s}
    @score =     page.css("span.bold").map {|i| i.children.to_s}
    @only_score =     page.css("span.bold").map {|i| i.children.to_s.split":"}
    @only = @only_score.map {|i| i[0].to_i+i[1].to_i}
    @wins =      page.css("td.ss-score.ss-text-win").length
    @stat=Stat.find_or_create_by(stat_params)
    redirect_to :back
  end

  
  private

  def stat_params
    params.require(:stat).permit(:season).merge(team: Team.find(params[:team_id]), win: @wins)
  end

end
