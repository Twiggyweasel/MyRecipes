class Chef < ActiveRecord::Base
    has_many :recipes
    has_many :likes
    
    before_save { self.email = email.downcase }
    validates :chefname, presence: true, length: { minimum: 3, maximum: 40 } 
    VALIDATE_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: { maximum: 105 }, 
                                      uniqueness: { case_sensitive: false}, 
                                      format: { with: VALIDATE_EMAIL_REGEX }
    has_secure_password 
end