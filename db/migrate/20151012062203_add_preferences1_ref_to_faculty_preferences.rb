class AddPreferences1RefToFacultyPreferences < ActiveRecord::Migration
  def change
    add_reference :faculty_preferences, :preference1, index: true
  end
end
