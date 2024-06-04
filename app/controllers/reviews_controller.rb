class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all
    end

    def crear_review
    end

    def reviewsPerfil
    end
end
