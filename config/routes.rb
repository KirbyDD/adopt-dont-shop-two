Rails.application.routes.draw do
  get '/', to: 'shelters#index'
  get '/shelters', to: 'shelters#index'
  get '/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  delete '/pets/:id', to: 'pets#destroy'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  get '/shelters/:id', to: 'shelters#show'
  post '/shelters', to: 'shelters#create'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/shelters/:shelter_id/pets', to: 'pets#index'
  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  delete '/shelters/:shelter_id/reviews/:id', to: 'reviews#destroy'
  post '/shelters/:shelter_id/reviews', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/reviews/:id', to: 'reviews#update'
  patch '/favorites/:pet_id', to: 'favorites#update'
  get '/favorites', to: 'favorites#index'
  delete '/favorites/:id', to: 'favorites#destroy'
  delete '/favorites', to: 'favorites#destroy_all'
  get '/applications', to: 'applications#index'
  get '/applications/new', to: 'applications#new'
  post '/applications', to: 'applications#create'
	get '/applications/:pet_id', to: 'applications#index'
end
# yarn installed
