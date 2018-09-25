require("pg")

class Bounty

attr_reader(:name, :species, :last_known_location, :favourite_weapon)

def initialize(options)
  @name = options["name"]
  @species = options["species"]
  @last_known_location = options["last_known_location"]
  @favourite_weapon = options["favourite_weapon"]
end

def save
  db = PG.connect({
      dbname: "bounty",
      host: "localhost"
      })

      sql = "
        INSERT INTO bounty (
          name,
          species,
          last_known_location,
          favourite_weapon
        )
        VALUES ($1, $2, $3, $4)
        RETURNING id;
      "
      db.prepare("save", sql)

      result = db.exec_prepared("save", [
        @name,
        @species,
        @last_known_location,
        @favourite_weapon
      ])
      db.close()

      # @id = result[0]["id"].to_i() or the below
      result_hash = result[0]
      string_id = result_hash["id"]
      id = string_id.to_i()
      p id
      @id = id
  end

  def self.all()
    db = PG.connect({
      dbname: "bounty",
      host: "localhost"
      })
    sql = "SELECT * FROM bounty;"
    db.prepare("all", sql)

    bounty_hashes = db.exec_prepared("all")
    db.close()

    bounty_objects = bounty_hashes.map do |bounty_hash|
      Bounty.new(bounty_hash)
    end

    return bounty_objects

  end

  def self.delete_all
    db = PG.connect({
      dbname: "bounty",
      host: "localhost"
      })
    sql = "DELETE FROM bounty;"
    db.exec(sql)
    db.close()
  end

  def update()
    db = PG.connect({
      dbname: "bounty",
      host: "localhost"
      })

      sql = "
      UPDATE bounty
      SET (
        name,
        species,
        last_known_location,
        favourite_weapon
      ) = ( $1, $2, $3, $4 )
      WHERE id = $5;
    "
    values = [
      @name,
      @species,
      @last_known_location,
      @favourite_weapon
    ]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close
  end

end
