class Usuario < ApplicationRecord
    has_secure_password

    has_many :lecturas, foreign_key: :username, primary_key: :username

    validates :username, presence: true, uniqueness: true
    validates :mail, presence: true, uniqueness: true
    validates :password, presence: true

    has_many :amistades, foreign_key: :usuario_id, class_name: 'Amistad'
    has_many :amigos, through: :amistades, source: :amigo

    # Inverse friendships
    #has_many :inverse_amistades, class_name: 'Amistad', foreign_key: :amigo_id
    #has_many :inverse_amigos, through: :inverse_amistades, source: :usuario

    def son_amigos?(otro_usuario)
        self.amigos.include?(otro_usuario)
    end

end

  