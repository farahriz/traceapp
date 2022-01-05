class Location < ApplicationRecord
    has_many :checkins, dependent: :destroy
    
    has_secure_password

    validates_confirmation_of :password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :name, presence: true
end
