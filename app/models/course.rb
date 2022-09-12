class Course < ApplicationRecord
  # validations
  validates :title, presence: true, length: { minimum: 3, maximum: 32 }
  validates :description, presence: true, length: { maximum: 256 }

  # many to many - courses <=> categories
  has_many :course_categories
  has_many :categories, through: :course_categories
  # one to many - user (author) <=> courses
  belongs_to :author, class_name: "User", foreign_key: :author_id
  # many to many - users (learners) <=> courses
  has_many :enrolled_courses
  has_many :users, through: :enrolled_courses

  # attached recording
  has_one_attached :recording
end
