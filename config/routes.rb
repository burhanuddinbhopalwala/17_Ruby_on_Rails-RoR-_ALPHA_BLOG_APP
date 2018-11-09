Rails.application.routes.draw do
  # 1: Domain Specific Language (DSL) + Order wise priority
  root "welcome#home" #  http://localhost:3000
  #get "welcome/index" #  http://localhost:3000/welcome/index 

  resources :articles do # 2:
    resources :comments # 3:
  end
  
  # 4:
  get "/signup", to: "users#new" 
  resources :users, except: [:new]

  # 5: Authentications
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # 6: Testing 
  resources :categories, except: [:destroy]
end 

=begin
2: A resource is the term used for a collection of similar objects, 
such as articles, people or animals. Rails provides a resources 
method which can be used to declare a standard REST resource on that
object in # 8. See using "rails routes"

3: This creates comments as a nested resource within articles. This 
is another part of capturing the hierarchical relationship that 
exists between articles and comments.
=end 