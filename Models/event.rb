require('pg')
require_relative('../db/sql_runner')
require_relative('./nation')
require_relative('./athlete')

class Event

  attr_reader(:id, :name)

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
    end

    def save()
      sql = "INSERT INTO events (name) VALUES ('#{@name}') RETURNING *"
      return Event.map_item(sql)
    end

    def self.find(id)
      sql = "SELECT * FROM events WHERE id = #{id}"
      return Event.map_item(sql)
    end

    def self.update(options)
      sql = "Update events SET name=#{options['name']} WHERE id=#{options['id']}"
      run(sql)
    end

    def self.delete(id)
      sql = "DELETE FROM events WHERE id=#{id}"
      run(sql)
    end

      def self.all()
        sql = "SELECT * FROM events"
        return Event.map_items(sql)
      end

      def self.delete_all()
        sql = "DELETE FROM events"
        run(sql)
      end


      def self.map_items(sql)
        events = run(sql)
        result = events.map { |event| Event.new( event ) }
        return result
      end

      def self.map_item(sql)
        result = Event.map_items(sql)
        return result.first
      end



end