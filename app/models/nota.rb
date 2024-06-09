class Nota < ApplicationRecord

    validates :lecture_id, presence: true
    validates :note, presence: true
    
end
