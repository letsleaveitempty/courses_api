require "rails_helper"
require "response_helper"

describe EnrollmentsController do
  describe '#create' do
    let!(:user) { create(:user) }
    let!(:course) { create(:course) }

    it 'responds successfully' do
      post :create, params: { course_id: course.id, user_id: user.id }

      expect(response.status).to eql(201)
    end

    it 'responds with details of new enrollment' do
      post :create, params: { course_id: course.id, user_id: user.id }

      expect(parsed_response).to eql(
        course: {
          id: course.id,
          name: course.name
        },
        user: {
          id: user.id,
          email: user.email
        }
      )
    end
  end

  describe '#destroy' do
    let!(:enrollment) { create(:enrollment) }

    it 'responds with a message and 204 status' do
      delete :destroy, params: {
        course_id: enrollment.course.id,
        user_id: enrollment.user.id
      }

      expect(response.status).to eql(204)
      expect(response.body).to eql('Enrollment deleted')
    end
  end
end
