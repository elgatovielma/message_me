class User < ApplicationRecord

    has_many :messages

    validates :username, presence: true, 
            uniqueness: {case_sensitive: false}, 
            length: { minimum: 3, maximum: 15}
            
    #it allows to use the password digest
    has_secure_password
end
