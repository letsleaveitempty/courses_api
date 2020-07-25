Rails.application.routes.draw do

  resources :users, only: [:create, :destroy] do
    get :courses
  end

  resources :courses, only: [:create, :destroy, :index]
  resources :enrollments, only: [:create]
  delete '/enrollment', to: 'enrollments#destroy', as: 'destroy_enrollment'
end
