require('pg')
require_relative('../db/sql_runner')
require_relative('./nation')



class Ranking

  attr_reader :nations

  def initialize()
    @nations = Nation.all
  end

  def ordered 
    @nations.sort! { |a,b| b.total_points <=> a.total_points }
  end


end