class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :course_categories
  has_many :courses, through: :course_categories
  validates :name, presence: true, length: { minimum: 3 }
end
