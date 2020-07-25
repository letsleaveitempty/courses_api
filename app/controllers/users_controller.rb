class UsersController < ApplicationController

  def create
    user = User.new(email: params[:email])

    if user.save
      render json: user, status: 201
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: 'User deleted', status: 204
    end
  end

  def courses
    user_courses = User.find(params[:user_id])&.courses

    render json: user_courses, each_serializer: CourseSerializer
  end
end
