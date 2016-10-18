class AddCourseSizeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :course_size, :integer
  end
end
