Rails.application.routes.draw do
  root 'main#index'
  

  get '/add' => 'timetables#add'
  get '/show_all' => 'timetables#show_all'
  post '/new' => 'timetables#new'
  
  get '/login' => 'users#login'
  get '/logout' => 'users#logout'
  get '/register' => 'users#register'
  post '/auth' => 'users#auth'
  post '/create' => 'users#create'
  get '/set_locale' => 'users#set_locale'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
