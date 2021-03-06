MeetupSearch::Application.routes.draw do
  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure", to: redirect('/')

  delete "/signout" => "sessions#destroy", as: :signout

  get '/e/:id', as: :event, controller: 'welcome', action: 'event'

  match '/progress', via: [:get, :post, :xhr], as: :progress, controller: 'sessions', action: 'progress'

  root "welcome#new"
end
