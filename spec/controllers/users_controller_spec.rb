require "rails_helper"
require "response_helper"

describe UsersController do
  describe '#create' do
    it 'responds successfully' do
      get :create, params: { email: 'johnny@bravo.com' }

      expect(response.status).to eql(201)
    end

    it 'responds with a freshly created user' do
      get :create, params: { email: 'johnny@bravo.com' }

      expect(parsed_response).to eql(
        id: 1,
        email: 'johnny@bravo.com'
      )
    end
  end

  describe '#destroy' do
    let!(:user) { create(:user) }

    it 'responds with a message and 204 status' do
      delete :destroy, params: { id: user.id }

      expect(response.status).to eql(204)
      expect(response.body).to eql('User deleted')
    end
  end

  describe '#courses' do
    let!(:user) { create(:user, :with_courses) }

    it 'responds successfully' do
      get :courses, params: { user_id: user.id }

      expect(response.status).to eql(200)
    end

    it 'responds with a list of courses user is enrolled to' do
      get :courses, params: { user_id: user.id }

      courses = user.courses

      expect(parsed_response).to include(
        hash_including(
          id: courses[0].id,
          name: courses[0].name
        ),
        hash_including(
          id: courses[1].id,
          name: courses[1].name
        )
      )
    end
  end
end
