Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/patient/:patient_id/generaliste", to: "practitioners#generalist", as: "generalist"
  get "/patient/:patient_id/gynecologue", to: "practitioners#gynecologist", as: "gynecologist"
  get "/reading/:reading_id/antecedants", to: "first_forms#history", as: "history"
  get "/test", to: "pages#test", as: "test"

  resources :patients, only: [:index, :new, :create] do
    resources :practitioners, only: [:create]
    resources :readings, only: [:new]
  end
  resources :readings, only: [] do
    resources :first_forms, only: [:new, :create]
  end
end
