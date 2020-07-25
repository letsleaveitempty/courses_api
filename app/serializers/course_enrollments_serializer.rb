class CourseEnrollmentsSerializer < ActiveModel::Serializer

  attributes :name, :enrolled_users

  def enrolled_users
    object.enrollments.count
  end
end
