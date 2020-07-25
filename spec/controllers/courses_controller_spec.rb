require "rails_helper"
require "response_helper"

describe CoursesController do
  describe '#create' do
    it 'responds successfully' do
      get :create, params: { name: 'Psychology 101' }

      expect(response.status).to eql(201)
    end

    it 'responds with a freshly created course' do
      get :create, params: { name: 'Psychology 101' }

      expect(parsed_response).to eql(
        id: 1,
        name: 'Psychology 101'
      )
    end
  end

  describe '#destroy' do
    let!(:course) { create(:course) }

    it 'responds with a message and 204 status' do
      delete :destroy, params: { id: course.id }

      expect(response.status).to eql(204)
      expect(response.body).to eql('Course deleted')
    end
  end

  describe '#index' do
    let!(:courses) { create_list(:course, 3, :with_users) }

    it 'responds successfully' do
      get :index

      expect(response.status).to eql(200)
    end

    it 'responds with a list of courses and number of its users' do
      get :index

      expect(parsed_response).to match_array(
        [
          hash_including(name: courses[0].name, enrolled_users: 5),
          hash_including(name: courses[1].name, enrolled_users: 5),
          hash_including(name: courses[2].name, enrolled_users: 5)
        ]
      )
    end
  end
end
