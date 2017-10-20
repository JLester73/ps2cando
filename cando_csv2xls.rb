#!/usr/bin/ruby

require 'spreadsheet'
require 'csv'

# Process students
print 'Processing students file to Excel'
students_csv = 'students.csv'
book = Spreadsheet.open '01-students-blank.xls'
sheet = book.worksheet 0
line = 2
CSV.foreach(students_csv) do |row|
  line += 1
  row.each_index do |i|
    if (i==7) 
      date_array = row[i].split('-')
      sheet[line,i] = Date.new date_array[0].to_i, date_array[1].to_i, date_array[2].to_i 
    else
      sheet[line,i] = row[i]
    end
    if line % 50 == 0
      print '.'
    end
  end
end
puts ''
puts 'Writing 01-students.xls'
book.write '01-students.xls'

# Process teachers
print 'Processing teachers file to Excel'
teachers_csv = 'teachers.csv'
book = Spreadsheet.open '02-teachers-blank.xls'
sheet = book.worksheet 0
line = 2
CSV.foreach(teachers_csv) do |row|
  line += 1
  row.each_index do |i|
    sheet[line,i] = row[i]
  end
  print '.'
end
puts ''
puts 'Writing 02-teachers.xls'
book.write '02-teachers.xls'

# Process courses
print 'Processing courses file to Excel'
courses_csv = 'courses.csv'
book = Spreadsheet.open '03-courses-blank.xls'
sheet = book.worksheet 0
line = 0
CSV.foreach(courses_csv) do |row|
  line += 1
  row.each_index do |i|
    sheet[line,i] = row[i]
  end
  if line % 50 == 0
    print '.'
  end
end
puts ''
puts 'Writing 03-courses.xls'
book.write '03-courses.xls'

# Process sections
print 'Processing sections file to Excel'
sections_csv = 'sections.csv'
book = Spreadsheet.open '05-section_enrollment-blank.xls'
sheet = book.worksheet 0
line = 0 
CSV.foreach(sections_csv) do |row|
  line += 1
  row.each_index do |i|
    sheet[line,i] = row[i]
  end
  if line % 50 == 0
    print '.'
  end
end
puts ''
puts 'Writing 05-section_enrollment.xls'
book.write '05-section_enrollment.xls'


