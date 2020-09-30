class Client < ApplicationRecord
    belongs_to :production, optional: true
    
    def name
        first_name + ' ' + last_name
    end
end
