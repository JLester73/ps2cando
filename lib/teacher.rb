class Teacher
  attr :teacher_number
  attr :first_name
  attr :middle_name
  attr :last_name
  attr :preferred_name
  attr :gender
  attr :password
  attr :email_addr

  # Constructor
  def initialize(email_addr, teacher_number, first_name, middle_name, 
                 last_name, preferred_name, gender, password)
    @email_addr = email_addr
    @teacher_number = teacher_number
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @preferred_name = preferred_name
    @gender = gender
    @password = password
  end

  def to_a
    data = Array.new
    string = nil
    validate
    data = [ @email_addr, nil, @first_name, @middle_name, @last_name, nil, 
      @preferred_name, nil, @gender, @password, @teacher_number, 
      nil, nil, nil, nil]
    return(data)
  end

  def validate
    # Non-empty teacher number
    if (@teacher_number.nil? || @teacher_number.to_s == "")
      raise "No Teacher Number"
    else
      @teacher_number = @teacher_number.to_i
    end

    # Non-empty first_name
    if (@first_name.nil? || @first_name.to_s == "")
      raise "No First Name"
    end

    # Non-empty last_name
    if (@last_name.nil? || @last_name.to_s == "")
      raise "No Last Name"
    end

    # Non-empty gender
    gender_map = {
      'M' => 'male',
      'F' => 'female'
    }
    @gender = gender_map[@gender]

  end
end
