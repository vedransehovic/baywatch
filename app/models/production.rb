class Production < ApplicationRecord 
    has_many :clients, dependent: :destroy
    has_many :bays
    has_many :users, through: :bays

    validates :name, presence: true, uniqueness: true

    accepts_nested_attributes_for :clients
    

    scope :search, ->(query) { where('name LIKE ?', "%#{query}%")}

    # changed class method below to the line abeve for theatrics and showboating
    # def self.search(query)
    #     Production.where('name LIKE ?', "%#{query}%")
    # end
end
