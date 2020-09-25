class Bay < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :production, optional: true
end
