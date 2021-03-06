Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope '/auth' do 
    post '/sign_up', to: 'users#create'
    post '/sign_in', to: 'users#sign_in'
    get 'profile', to: 'users#show'
    put 'profile/:id', to: 'users#update'
    delete 'profile/:id', to: 'users#destroy'
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
    get '/download/:id', to: 'applied_users#download'
    delete  '/application/:id', to: 'applied_users#destroy'

    scope '/job' do
      get 'level', to: 'job_levels#index' 
      get 'type', to: 'job_types#index'
      

    end
  end
end

