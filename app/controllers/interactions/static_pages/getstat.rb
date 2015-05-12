module Static_pages
  class Getstat < ActiveInteraction::Base

    def execute
      default_source = 'https://www.betmarathon.com/su/sportstatext.htm?nr5=6126&gmt=2474%2C8'
  	if params[:q].blank?
      page = Nokogiri::HTML(open(default_source), nil, 'UTF-8')
    else
      page = Nokogiri::HTML(open(params[:q]), nil, 'UTF-8')
    end
    @home_team = page.css("td.ss-member.ss-mem-1").map {|i| i.children.to_s}
    @avay_team = page.css("td.ss-member.ss-mem-2").map {|i| i.children.to_s}
    @score =     page.css("span.bold").map {|i| i.children.to_s}
    @only_score =     page.css("span.bold").map {|i| i.children.to_s.split":"}
    @only = @only_score.map {|i| i[0].to_i+i[1].to_i}
    @wins =      page.css("td.ss-score.ss-text-win").length
    @draws =      page.css("td.ss-score.ss-text-draw").length
    @loses =      page.css("td.ss-score.ss-text-lose").length
    
    end
  end
end