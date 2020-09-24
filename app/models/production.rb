class Production < ApplicationRecord 
    has_many :clients, dependent: :destroy
    has_many :bays
    has_many :users, through: :bays

    accepts_nested_attributes_for :clients
end
