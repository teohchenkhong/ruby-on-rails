Rails.application.routes.draw do
	devise_for :users, :controllers => {registrations: 'registrations'}
	root to: 'pages#index'
	resources :articles do
		resources :comments
	end
	get 'pages/contact'
	get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
