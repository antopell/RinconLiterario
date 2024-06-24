class Usuario < ApplicationRecord
    has_secure_password

    has_many :lecturas, foreign_key: :username, primary_key: :username

    validates :username, presence: true, uniqueness: true
    validates :mail, presence: true, uniqueness: true
    validates :password, presence: true
end

  