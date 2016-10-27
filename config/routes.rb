Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/patient/:patient_id/generaliste", to: "practitioners#generalist", as: "generalist"
  get "/patient/:patient_id/gynecologue", to: "practitioners#gynecologist", as: "gynecologist"
  get "/reading/:reading_id/antecedants", to: "first_forms#history", as: "history"
  post "/readings/:reading_id/first_forms/:first_form_id/breasts", to: "clinical_anomalies#breasts", as: "breasts"
  post "/readings/:reading_id/first_forms/:first_form_id/position/:clinical_anomaly_id", to: "clinical_anomalies#position", as: "position"
  get "/test", to: "pages#test", as: "test"
  get "/dashboard", to: "pages#dashboard", as: "dashboard"

  resources :patients, only: [:index, :new, :create] do
    resources :practitioners, only: [:create]
    resources :readings, only: [:new]
  end
  resources :readings, only: [] do
    resources :first_forms, only: [:new, :create] do
      resources :clinical_anomalies, only: [:index, :create, :delete]
    end
  end
end
