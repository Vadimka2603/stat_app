module Stats
  class Find < ActiveInteraction::Base
    integer :id

    def execute
      stat = Stat.find_by_id(id)
      if stat
        stat
      else
        raise 'season does not exist'
      end
    end
  end
end