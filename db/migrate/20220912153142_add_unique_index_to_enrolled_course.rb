class AddUniqueIndexToEnrolledCourse < ActiveRecord::Migration[7.0]
  def change
    add_index :enrolled_courses, [:user_id, :course_id], unique: true
  end
end
