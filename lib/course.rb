require 'csv'

class Course
  attr :course_title
  attr :description
  attr :local_id
  attr :state_id
  attr :credits

  # Constructor
  def initialize(school_year, local_id, state_id, course_title, description, 
                 credits)
    @school_year = school_year
    @local_id = local_id
    @state_id = state_id
    @course_title = course_title
    @description = description
    @credits = credits
  end

  def to_a
    data = Array.new
    string = nil
    validate
    data = [ @school_year, @local_id, @course_title, @description, @local_id, 
             @state_id, @credits ] 
    return(data)
  end

  def validate
    # Non-empty school year
    if (@school_year.nil? || @school_year.nil?)
      raise "No School Year"
    end

    # Non-empty course title
    if (@course_title.nil? || @course_title.to_s == "")
      raise "No Course Title"
    end

    # Leave course description blank

    # Non-empty local id
    if (@local_id.nil? || @local_id.to_s == "")
      raise "No Course ID"
    end

    # Non-empty state id
    if (@state_id.nil? || @state_id.to_s == "")
      #raise "No State Course ID"
    else
       @state_id = @local_id.to_s.slice(0, 4).to_i unless @local_id.nil?
    end

    # Credits will be empty
  end
end
