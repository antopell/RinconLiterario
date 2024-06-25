class Usuario < ApplicationRecord
    has_secure_password

    has_many :reviews, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :mail, presence: true, uniqueness: true
    validates :password, presence: true
end
