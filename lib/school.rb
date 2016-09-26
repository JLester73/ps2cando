require 'csv'

class School 
  attr :school_number
  attr :type
  attr :title
  attr :description

  # Constructor
  def initialize(school_number, type, title, description)
    @school_number = school_number
    @type = type
    @title = title
    @description = description
  end

  def to_a
    data = Array.new
    string = nil
    validate
    data = [ @school_number, @type, @title, @description ]
    return(data)
  end

  def validate
    # Non-empty school number
    if (@school_number.nil? || @school_number.nil?)
      raise "No School Number"
    end

    # Non-empty type
    if (@type.nil? || @type.nil?)
      @type = 'Location'
    end

    # Non-empty title
    if (@title.nil? || @title.to_s == "")
      raise "No Title"
    end

    # Non-empty description
    if (@description.nil? || @description.to_s == "")
      raise "No Description"
    end

  end
end
