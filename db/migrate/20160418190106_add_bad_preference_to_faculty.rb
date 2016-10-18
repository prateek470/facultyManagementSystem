class AddBadPreferenceToFaculty < ActiveRecord::Migration
  def change
    add_column :faculties, :bad_preference, :integer
  end
end
