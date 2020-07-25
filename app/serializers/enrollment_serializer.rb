class EnrollmentSerializer < ActiveModel::Serializer

  belongs_to :course
  belongs_to :user

end
