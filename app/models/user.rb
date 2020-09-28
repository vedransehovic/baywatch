class User < ApplicationRecord
    has_many :bays
    has_many :productions, through: :bays
    
    has_secure_password
    validates :username, presence: true, uniqueness: true


    def self.from_omniauth(auth)
        find_or_create_by(username: auth[:info][:email]) do |user|
            user.password = SecureRandom.hex(15)
        end
    end

end
