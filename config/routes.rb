Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'users', controller: :users do
    post '', action: :create, as: :create_user
    get ':id', action: :show, as: :user
  end
end
