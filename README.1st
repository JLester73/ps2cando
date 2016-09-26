**NOTICE**
These files and scripts are provided without any assurances that they
will work properly in your environment.  There is also no guarantee
that something won't get messed up in either PowerSchool or Cando
by using this project.  Use at your own risk, understand what the
commands will be doing, and use in a test environment if possible!

**Background**
This program was created by Chris Edwards of Washington County Public Schools
in Virginia.  The original version wrote out the CSV files required for
import into the Cando project.

The program was updated recently to work with the newer XLS import process
required for Cando by Jason Lester, also of Washingon County Schools.

**Description**
These scripts export out the students, teachers, courses, and sections
from PowerSchool that are required for the Cando project in the state
of Virginia (http://www.cteresource.org/CanDo/).

**Release**
The latest version is always available on Github from:
  https://github.com/JLester73/ps2cando
  
**Requirements**
We run the scripts on a Debian Linux server.  It should theoretically work
on any system that supports Ruby, but we have not tested on anything else.
You will need to have Ruby, Rake, and Oracle's InstantClient all installed
and working properly.  Installing and configuring those is mostly outside
the scope of this document except where it applies specifically to these
scripts.

Dependencies:
- Ruby 1.9 or higher
- Rake 0.8.7 or higher
- A Unix/Linux-like environment
- Oracle Instantclient
- PowerSchool v8 or higher (tested all the way to 10.0.2)

Ruby Dependencies:
- Log4r Gem
- OCI8 Ruby Library for Oracle (compiled against your instantclient)
- Spreadsheet Gem
- YAML Gem

**Setup**
- Unzip the package onto the sytem that will be running it.  We use a special
  user account called "data" on our server and place each script in that
  user's home directory.  This one would be in /home/data/ps2cando for
  example.
- Edit the "Rakefile" and make sure the year is set correctly.  For the
  2016-2017 school year, it should be set to 2017.
- Edit the input-teachers.csv.example file and add your teachers who will be
  using Cando.  The file should have their employee number from PowerSchool,
  then their last name (in quotes), and their first name (in quotes) with
  commas between.  An example is in the file already.  Save it as
  input-teachers.csv
- For the Oracle instantclient, you will need to configure a tnsnames.ora
  file to tell the client how to locate your PowerSchool Oracle DB server.
  It will look something like this:
------
    PSPRODDB =
      (DESCRIPTION =
         (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.1)(PORT = 1521))
         (CONNECT_DATA =
           (SERVER = DEDICATED)
           (SERVICE_NAME = PSPRODDB)
         )
       )
------
  PSPRODDB is what we're calling the service when we call it in Ruby.
  Host should be set to your server's IP address and Service_Name should be
  set to the PowerSchool database's server instance (normally PSPRODDB).
- Edit the /config/ps2cando.yaml.example file to update your login and
  password information for your PowerSchool Oracle database.  We recommend
  using the psnavigator account since it has read-only access to your
  database.  Update the three lines to match your installation and save
  the file as ps2cando.yaml.

**Usage**
The rake program is used to build the files and to clean the directory in
preparation for a new build.  Always clean the directory before running a
new build or you will have duplicate entries.
- Clean the directory by running "rake clobber".  This will delete all files
  that were written out by the build process.
- Run the build by running "rake".  It will show you what it is doing as it.
  runs.  A line will be output for each teacher as it exports the teachers,
  students, courses, and sections.  When it finishes, it sorts some files
  and deletes temporary files.  It then runs another script that converts
  the CSV files to the required XLS files.  When finished, you should have
  these output files ready for import into Cando:
  - 01-students.xls
  - 02-teachers.xls
  - 03-courses.xls
  - 04-section_enrollment.xls
- Copy the four files to a Windows computer that has Office installed.
- Open each file with Excel, you may get an error, but that is OK.  It
  is caused by a limitation of the Ruby Excel output formatter.  Save
  each file without changing anything to get rid of the error.
- Import the files following the instructions in the Cando documentation.
  You will still need to create your terms and resources (schools) manually.
  