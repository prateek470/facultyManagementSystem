class AddCourseAssignmentIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :course_assignment_id, :integer
  end
end
