require('pg')
require_relative('../db/sql_runner')
require_relative('athlete')

class Nation

attr_reader(:id, :name, :points)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @points = 0
  end

  def save()
    sql = "INSERT INTO nations (name) VALUES ('#{@name}') RETURNING *"
    return Nation.map_item(sql)
  end

  def athlete(id)
    sql = "SELECT * FROM athletes WHERE nation_id = #{id}"
    return Athlete.map_item(sql)
  end

  def total_medals_gold()
    sql = "SELECT medals.* FROM medals INNER JOIN athletes ON medals.athlete_id = athletes.id WHERE athletes.nation_id = #{@id} AND type = 'Gold'"
    return Medal.map_items(sql).count
  end

  def total_medals_silver()
    sql = "SELECT medals.* FROM medals INNER JOIN athletes ON medals.athlete_id = athletes.id WHERE athletes.nation_id = #{@id} AND type = 'Silver'"
    return Medal.map_items(sql).count
  end

  def total_medals_bronze()
    sql = "SELECT medals.* FROM medals INNER JOIN athletes ON medals.athlete_id = athletes.id WHERE athletes.nation_id = #{@id} AND type = 'Bronze'"
    return Medal.map_items(sql).count
  end

  def total_points_gold
    return total_medals_gold * 5
  end

  def total_points_silver
    return total_medals_silver * 3
  end

  def total_points_bronze
    return total_medals_bronze * 1
  end

  def total_points
    total = total_points_gold + total_points_silver + total_points_bronze
    return total
  end



  def self.find(id)
    sql = "SELECT * FROM nations WHERE id = #{id}"
    return Nation.map_item(sql)
  end

  def self.update(options)
    sql = "Update nations SET name=#{options['name']} WHERE id=#{options['id']}"
    run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM nations WHERE id=#{id}"
    run(sql)
  end

    def self.all()
      sql = "SELECT * FROM nations"
      return Nation.map_items(sql)
    end

    def self.delete_all()
      sql = "DELETE FROM nations"
      run(sql)
    end


    def self.map_items(sql)
      nations = run(sql)
      result = nations.map { |nation| Nation.new( nation ) }
      return result
    end

    def self.map_item(sql)
      result = Nation.map_items(sql)
      return result.first
    end

end