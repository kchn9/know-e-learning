class Course < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 32 }
  validates :description, presence: true, length: { maximum: 256 }

  belongs_to :user
end
