require 'digest'
class User < ApplicationRecord
    # attr_accessor :password_confirmation
    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, uniqueness: true 
    validates :account, presence: true, confirmation: true
    
    private
    def encrypt_password
        salted_pw = "xyz#{self.password}"
        self.password = Digest::SHA1.hexdigest(salted_pw)
    end    
end
