Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/auth' do 
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'users#sign_in'
    get 'profile', to: 'users#show'
  end
  scope '/api' do 
    get '/jobs', to: 'listings#index'
    post '/jobs', to: 'listings#create'
    get '/jobs/:id', to: 'listings#show'
    put  '/jobs/:id', to: 'listings#update'
    delete  '/jobs/:id', to: 'listings#destroy'

    post '/apply', to: 'applied_users#apply' 
    get '/applied', to: 'applied_users#index' 
    get '/my-application', to: 'applied_users#applied' 
     
    scope '/job' do
      get 'level', to: 'job_levels#index' 
      get 'type', to: 'job_types#index' 

    end
  end
end

