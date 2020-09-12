require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject


  
  def self.columns
    @vals ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

    @vals[0].each do |col|
      @column_names ||= []
      @column_names << col.to_sym
    end

    @column_names
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        attributes[name]
      end

      define_method("#{name}=") do |val|
        attributes[name] = val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    "#{self}s".tableize
  end

  def self.all
    DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
  end

  def self.parse_all(results)
    all.each {|hash| hash.each {|k,v| "#{self}.new("}
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |k,v|
      k = k.to_sym
      raise "unknown attribute '#{k}'" if !self.class.columns.include?(k)

      self.send("#{k}=", v)
  
      
    end
  end

  def attributes
    @attributes ||= Hash.new
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
