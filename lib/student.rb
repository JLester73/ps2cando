class Student
  attr :student_id
  attr :first_name
  attr :last_name
  attr :birthdate
  attr :gender
  attr :ethnic_code
  attr :grade
  attr :state_id

  # Constructor
  def initialize(student_id, first_name, middle_name, last_name, birthdate, 
                 gender, ethnic_code, grade, state_id)
    @student_id = student_id
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @birthdate = birthdate
    @gender = gender
    @ethnic_code = ethnic_code
    @grade = grade
    @state_id = state_id
  end

  def to_a
    data = Array.new
    string = nil
    validate
    data = [ @student_id, nil, @first_name, @middle_name, @last_name, nil, 
      nil, @birthdate, @gender, @student_id, @student_id, @ethnic_code, nil, 
      nil, nil, nil, nil, nil, @grade, @state_id ]
    return(data)
  end

  def validate
    # Non-empty studentid
    if (@student_id.nil? || @student_id.to_s == "")
      raise "No Student ID"
    else
      @student_id = @student_id.to_i
    end

    # Non-empty first_name
    if (@first_name.nil? || @first_name.to_s == "")
      raise "No First Name"
    end

    # Non-empty last_name
    if (@last_name.nil? || @last_name.to_s == "")
      raise "No Last Name"
    end

    # Ensure birthdate is in YYYY-MM-DD
    if (@birthdate.nil? || @birthdate.to_s == "")
      raise "No Birthdate"
    else
      date = @birthdate.split(/[-\/]/)
      raise "Invalid Birthdate" if date.length != 3
      raise "Invalid Birthdate" unless date[0].length == 4 && date[0].match(/\d{4}/)
      raise "Invalid Birthdate"  unless date[1].length == 2 && date[1].match(/\d{2}/)
      raise "Invalide Birthdate" unless date[2].length == 2 && date[2].match(/\d{2}/)
    end

    # Non-empty gender
    if (@gender.nil? || @gender.to_s == "")
      raise "No Gender"
    end
    gender_map = {
      'M' => 'male',
      'F' => 'female'
    }
    @gender = gender_map[@gender]

    # Convert ethnic code
    if (@ethnic_code.nil? || @ethnic_code.to_s == "")
      @ethnic_code = '00'
    end
    ethnic_map = {
      '00' => 'Unspecified', 
      '01' => 'American Indian',
      '02' => 'Asian', 
      '03' => 'Black', 
      '04' => 'Hispanic', 
      '05' => 'White', 
      '06' => 'Unspecified'
    }
    @ethnic_code = ethnic_map[@ethnic_code]

    # Non-empty grade, convert grades less than 1
    if (@grade.nil? || @grade.to_s == "")
      raise "No Grade"
    end

    # Non-empty state id
    if (@state_id.nil? || @state_id.to_s == "")
      # Do nothing
    end
  end
end
