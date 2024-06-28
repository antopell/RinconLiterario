class Amistad < ApplicationRecord
    belongs_to :usuario
    belongs_to :amigo, class_name: 'Usuario'
  
    validates :usuario_id, presence: true
    validates :amigo_id, presence: true
  end
  