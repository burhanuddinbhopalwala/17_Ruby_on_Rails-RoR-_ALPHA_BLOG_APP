class User < ApplicationRecord 
    # class constant 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    has_many :articles, dependent: :destroy
    before_save {self.email = email.downcase()}
    
    validates(:username, presence: true, 
    uniqueness: {case_sensitive: false}, 
    length: {minimum: 3, maximum: 25})

    validates(:email, presence: true,
    uniqueness: {case_sensitive: false}, 
    length: {maximum: 25},
    format: {with: VALID_EMAIL_REGEX})

    has_secure_password # gem install bcrypt-ruby 
    # provides password_hashing and user.password and user.authenticate(pwd)
end  

=begin 
1: Checking using: 
- user.errors.any?() => true/ false 
- user.erros.full_messages() => Array of error messages
=end 