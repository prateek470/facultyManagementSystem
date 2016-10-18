class AddPreference4IdAndPreference5IdAndPreference6IdAndPreference7IdAndPreferece8IdAndPreference9IdToFacultyPreferences < ActiveRecord::Migration
  def change
    add_column :faculty_preferences, :preference4_id, :integer
    add_column :faculty_preferences, :preference5_id, :integer
    add_column :faculty_preferences, :preference6_id, :integer
    add_column :faculty_preferences, :preference7_id, :integer
    add_column :faculty_preferences, :preference8_id, :integer
    add_column :faculty_preferences, :preference9_id, :integer
  end
end
