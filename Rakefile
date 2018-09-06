require 'rake/clean'

YEAR=2019

# Files to be built

desc "Exports from PowerSchool"
task :default do
desc "Build the export"
  sh "ruby ps2cando --in input-teachers.csv --year #{YEAR}"
  # Sort courses
  mv "courses.csv", "courses-temp.csv"
  sh "cat courses-temp.csv|sort|uniq > courses.csv"
  rm "courses-temp.csv"
  # Sort resources
  mv "resources.csv", "resources-temp.csv"
  sh "cat resources-temp.csv|sort|uniq > resources.csv"
  rm "resources-temp.csv"
  # Convert CSV files to XLS
  sh "ruby cando_csv2xls.rb"
end

CLOBBER.include('courses-temp.csv', 'courses.csv', 'sections.csv', 
                'teachers.csv', 'students.csv', 'resources.csv', 'cando-export.zip',
                '01-students.xls','02-teachers.xls','03-courses.xls',
                '05-section_enrollment.xls')
