class User < ApplicationRecord

  has_many :enrollments
  has_many :courses, through: :enrollments

  validates :email, uniqueness: true
end
