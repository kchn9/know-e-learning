class User < ApplicationRecord
  # one to many - user (author) <=> courses
  has_many :created_courses, class_name: "Course", foreign_key: :author_id, dependent: :destroy
  # many to many - users (learners) <=> courses
  has_many :enrolled_courses
  has_many :courses, through: :enrolled_courses

  # devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # https://github.com/heartcombo/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username

  attr_writer :login

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end
