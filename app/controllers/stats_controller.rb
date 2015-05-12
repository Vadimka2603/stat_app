class StatsController < ApplicationController

  def show
    @stat = Stat.find(params[:id])
      @year = @stat.season
      @wins = @stat.win
      @draws = @stat.draw
      @loses = @stat.lose

      @ups = @stat.up
      @unders = @stat.under
      @odds = @stat.odd
      @evens = @stat.even

  end
end