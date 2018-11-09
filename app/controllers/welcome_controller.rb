=begin
1: rails generate controller Welcome index 
with controller, helper, app/views/welcome/index.html.erb
=end 

class WelcomeController < ApplicationController
  def home
    redirect_to(articles_path()) if(logged_in?())
  end
end

=begin
2: In development mode (which is what you're working in by default), 
Rails reloads your application with every browser request, so there's 
no need to stop and restart the web server when a change is made
=end 