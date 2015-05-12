class StaticPagesController < ApplicationController
  
  require 'open-uri'
  require 'nokogiri'

  def getstat
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
    @sum = @only.sum
    @wins =      page.css("td.ss-score.ss-text-win").length
    @draws =      page.css("td.ss-score.ss-text-draw").length
    @loses =      page.css("td.ss-score.ss-text-lose").length
    @ups = @only.find_all{ |i| i > 2.5  }.length
    @unders = @only.find_all{ |i| i < 2.5  }.length
    @odds = @only.find_all{ |i| i % 2 != 0 }.length
    @evens = @only.find_all{ |i| i % 2 == 0 }.length
    @streak = @only.reverse.to_a.split { |i| i % 2 == 0 }
    @odd_streak = @streak.map {|i| i.length}.find_all{ |i| i > 0 }
    @streak2 = @only.reverse.to_a.split { |i| i % 2 != 0 }
    @even_streak = @streak2.map {|i| i.length}.find_all{ |i| i > 0 }
    @sum_streak = (@odd_streak+@even_streak).find_all{ |i| i > 1 }.map {|i| i-1}.sum
  end
end
