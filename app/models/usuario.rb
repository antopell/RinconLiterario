class Usuario < ApplicationRecord
    has_secure_password
    has_many :reviews, foreign_key: :id_usuario, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :mail, presence: true, uniqueness: true
    validates :password, presence: true
end
