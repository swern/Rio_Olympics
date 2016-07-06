require('pg')
require_relative('../db/sql_runner')
require_relative('./nation')
require_relative('./medal')

class Athlete

attr_reader(:id, :name, :nation_id, :event_id)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @event_id = options['event_id'].to_i
    @nation_id = options['nation_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name, nation_id) VALUES ('#{@name}', '#{nation_id}') RETURNING *"
    return Athlete.map_item(sql)
  end

  def nation
    sql = "SELECT * FROM nations WHERE id = #{@nation_id}"
    return Nation.map_item(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    return Athlete.map_item(sql)
  end

  def medal
    sql = "SELECT * FROM medals WHERE athlete_id = #{@athlete_id}"
  end
  
  def events()
    sql = "SELECT events.* FROM events INNER JOIN medals ON medals.event_id = events.id WHERE medals.athlete_id = #{@id}"
    return Event.map_items(sql).first
  end

  def self.update(options)
    sql = "Update athletes SET name=#{options['name']} WHERE id=#{options['id']}"
    run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM athletes WHERE id=#{id}"
    run(sql)
  end

    def self.all()
      sql = "SELECT * FROM athletes"
      return Athlete.map_items(sql)
    end

    def self.delete_all()
      sql = "DELETE FROM athletes"
      run(sql)
    end


    def self.map_items(sql)
      athlete = run(sql)
      result = athlete.map { |athlete| Athlete.new( athlete ) }
      return result
    end

    def self.map_item(sql)
      result = Athlete.map_items(sql)
      return result.first
    end


end