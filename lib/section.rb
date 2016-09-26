require 'csv'

class Section
  attr :course_title        # Local Course Title
  attr :local_id            # Local Course Code
  attr :school_number       # School Number
  attr :school_name         # School Name
  attr :mark_period         # Marking Period
  attr :term_desc           # Term Description
  attr :start_period        # Period of the Day
  attr :section             # Section / Expression
  attr :teacher_id          # Teacher ID
  attr :teacher_first_name  # Teacher First Name
  attr :teacher_last_name   # Teacher Last Name
  attr :student_id          # Student ID
  attr :student_first_name  # Student First Name
  attr :student_last_nsame  # Student Last Name

  # Constructor
  def initialize(local_id, section, course_title, school_number, school_name, 
                 mark_period, term_desc, start_period, tch_id, tch_fn, tch_ln, 
                 stu_id, stu_fn, stu_ln)
    @local_id = local_id
    @course_title = course_title
    @school_number = school_number
    @school_name = school_name
    @mark_period = mark_period
    @term_desc = term_desc
    @start_period = start_period
    @section = section
    @teacher_id = tch_id
    @teacher_first_name = tch_fn
    @teacher_last_name = tch_ln
    @student_id = stu_id
    @student_first_name = stu_fn
    @student_last_name = stu_ln
  end

  def to_a
    data = Array.new
    string = nil
    validate
    data = [ @local_id, @section, @course_title, @school_number, 
      @school_name, @mark_period, @term_desc, @start_period, @teacher_id, 
      @teacher_first_name, @teacher_last_name, @student_id, 
      @student_first_name, @student_last_name ] 
    return(data)
  end

  def validate
    # Non-empty local id
    if (@local_id.nil? || @local_id.to_s == "")
      raise "No Local course ID"
    end

    # Non-empty course title
    if (@course_title.nil? || @course_title.to_s == "")
      raise "No Course Title"
    end

    # Non-empty bulding number
    if (@school_number.nil? || @school_number.to_s == "")
      raise "No School Number"
    end

    # Non-empty building name
    if (@school_name.nil? || @school_name.to_s == "")
      raise "No School Name"
    end

    # Non-empty term description
    if (@term_desc.nil? || @term_desc.to_s == "")
      raise "No Term description"
    end

    # Non-empty start period
    if (@start_period.nil? || @start_period.to_s == "")
      raise "No Starting Period"
    end

    # Non-empty section
    if (@section.nil? || @section.to_s == "")
      raise "No Section"
    end
    
    # Non-empty teacher id
    if (@teacher_id.nil? || @teacher_id.to_s == "")
      raise "No Teacher ID"
    end

    # Non-empty teacher last name
    if (@teacher_last_name.nil? || @teacher_last_name.to_s == "")
      raise "No Teacher Last Name"
    end

    # Non-empty teacher first name
    if (@teacher_first_name.nil? || @teacher_first_name.to_s == "")
      raise "No Teacher First Name"
    end

    # Non-empty student id
    if (@student_id.nil? || @student_id.to_s == "")
      raise "No Student ID"
    else
        # Translate to an integer
        @student_id = @student_id.to_i
    end

    # Non-empty student last name
    if (@student_last_name.nil? || @student_last_name.to_s == "")
      raise "No Student Last Name"
    end

    # Non-empty student first name
    if (@student_first_name.nil? || @student_first_name.to_s == "")
      raise "No Student First Name"
    end

    # Non-empty term description
    if (@mark_period.nil? || @mark_period.to_s == "")
      @mark_period = "SY-SY"
    end
  end
end
