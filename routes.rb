require './routes_helper.rb'

get '/',              to: 'home#index'
get '/hoge',          to: 'home#hoge'
get '/users',         to: 'users#index'
get '/users/:id',     to: 'users#show'
get '/users/new',     to: 'users#new'
post '/users/create', to: 'users#create'