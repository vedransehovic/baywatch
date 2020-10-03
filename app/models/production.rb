class Production < ApplicationRecord 
    has_many :clients, dependent: :destroy
    has_many :bays
    has_many :users, through: :bays

    accepts_nested_attributes_for :clients

    def self.search(query)
        Production.where('name LIKE ?', "%#{query}%")
    end
end
