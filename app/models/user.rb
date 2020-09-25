class User < ApplicationRecord
    has_many :bays
    has_many :productions, through: :bays
    
    has_secure_password
    validates :username, presence: true, uniqueness: true

end
