class Store < ApplicationRecord

    has_many :store_transactions , dependent: :destroy 

    scope :sorted,lambda { order ("id ASC")}
    validates_presence_of :store
    validates_length_of :store, :maximum => 255
    validates_presence_of :city
    validates_length_of :city, :maximum => 25
    
end
