class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all
    end

    def create
        @puntaje = params[:rating]
        @usuario = Usuario.find(session[:usuario_id])
        @review = @usuario.reviews.create(review_params)
        
        redirect_to library_path
    end

    def reviewsPerfil
    end

    def review_params
        params.require(:review).permit(:id_libro, :comentario).merge(puntuacion: params[:puntaje])
      end
end
