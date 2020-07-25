class CoursesController < ApplicationController

  def create
    course = Course.new(name: params[:name])

    if course.save
      render json: course, status: 201
    end
  end

  def destroy
    course = Course.find(params[:id])

    if course.destroy
      render json: 'Course deleted', status: 204
    end
  end

  def index
    courses = Course.all

    render json: courses, each_serializer: CourseEnrollmentsSerializer
  end
end
