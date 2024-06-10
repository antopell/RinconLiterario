class Review < ApplicationRecord
    belongs_to :usuario

    validates :comentario, presence: true
    validates :puntuacion, presence: true
    validates :id_libro, presence: true

    # def self.create(review_params, puntaje)
    #     review = new(review_params)
    #     review.puntaje = rating
    #     review.fecha = Date.today
    #     review.save!
    #     review
    # end
end
