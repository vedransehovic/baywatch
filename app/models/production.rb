class Production < ApplicationRecord 
    has_many :clients

    accepts_nested_attributes_for :clients
end
