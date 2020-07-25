class EnrollmentsController < ApplicationController

  def create
    enrollment = Enrollment.new(
      user_id: params[:user_id],
      course_id: params[:course_id]
    )

    if enrollment.save
      render json: enrollment, status: 201
    end
  end

  def destroy
    enrollment = Enrollment.where(
      user_id: params[:user_id],
      course_id: params[:course_id]
    ).first

    if enrollment.destroy
      render json: 'Enrollment deleted', status: 204
    end
  end
end
