class AddFacultyCoursesRefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :faculty_course, index: true
  end
end
