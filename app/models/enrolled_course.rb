class EnrolledCourse < ApplicationRecord
  validates :course_id, uniqueness: { scope: [:user_id] }
  validate :user_not_enroll_own_course

  belongs_to :user
  belongs_to :course

  def user_not_enroll_own_course
    if Course.find(course_id).author_id == user_id
      errors.add(:user_id, "can't enroll self course")
    end
  end
end
