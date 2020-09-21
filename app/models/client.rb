class Client < ApplicationRecord
    belongs_to :production
    
    def name
        first_name + ' ' + last_name
    end
end
