require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    query = '%' + title + '%'
    plays = PlayDBConnection.instance.execute(<<-SQL, query)
      SELECT *
      FROM plays
      WHERE title LIKE ?
    SQL
    plays.map { |datum| Play.new(datum) }
  end

  def self.find_by_playwright(name)
    query = '%' + name + '%'
    plays = PlayDBConnection.instance.execute(<<-SQL, query)
      SELECT p.title, p.year, w.name
      FROM plays p
      JOIN playwrights w ON p.playwright_id = w.id
      WHERE w.name LIKE ?
    SQL
    plays
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    query = '%' + name + '%'
    playwrights = PlayDBConnection.instance.execute(<<-SQL, query)
      SELECT *
      FROM playwrights
      WHERE name LIKE ?
    SQL
    playwrights.map { |datum| Playwright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
    UPDATE
      playwrights
    SET
      name = ?, birth_year = ?
    WHERE
      id = ?
    SQL
  end

  def get_plays
    Play.find_by_playwright(@name)
  end
end
