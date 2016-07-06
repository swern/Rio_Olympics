require('pg')
require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('./nation')
require_relative('./athlete')


class Medal
attr_reader(:id, :athlete_id, :event_id, :type)

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @athlete_id = options['athlete_id'].to_i
    @event_id = options['event_id'].to_i
  end

  def save()
    return if check_if_nation_has_won_medal
    sql = "INSERT INTO medals (athlete_id, event_id, type) VALUES ('#{@athlete_id}', '#{@event_id}', '#{@type}') RETURNING *"
    return Medal.map_item(sql)
  end

  def athlete
    sql = "SELECT * FROM athletes WHERE id = #{@athlete_id}"
    return Athlete.map_item(sql)
  end

  def event
    sql = "SELECT * FROM events WHERE id = #{@event_id}"
    return Event.map_item(sql)
  end

  def check_if_nation_has_won_medal()
     all_medals=Medal.all
     athlete1=Athlete.find(@athlete_id)
     for medal in all_medals
       athlete2=Athlete.find(medal.athlete_id)
       return true if (medal.type == @type && athlete1.nation_id != athlete2.nation_id)
     end
     return false
   end

  def self.find(id)
    sql = "SELECT * FROM medals WHERE id = #{id}"
    return Medal.map_item(sql)
  end

  def self.update(options)
    sql = "Update medals SET name=#{options['name']} WHERE id=#{options['id']}"
    run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM medals WHERE id=#{id}"
    run(sql)
  end

    def self.all()
      sql = "SELECT * FROM medals"
      return Medal.map_items(sql)
    end

    def self.delete_all()
      sql = "DELETE FROM medals"
      run(sql)
    end


    def self.map_items(sql)
      medals = run(sql)
      result = medals.map { |medal| Medal.new( medal ) }
      return result
    end

    def self.map_item(sql)
      result = Medal.map_items(sql)
      return result.first
    end

end