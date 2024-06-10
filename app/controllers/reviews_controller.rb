class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all
        @usuario = Usuario.find(session[:usuario_id])
        @reviewsUsuario = Review.count
    end

    def create
        Rails.logger.debug "Review params: "
        Rails.logger.debug review_params
        @review = Review.new(review_params)
        
        if (@review.save)
            Rails.logger.debug @review
            redirect_to :library
        else
            Rails.logger.debug @review
            Rails.logger.debug @review.errors.full_messages
            redirect_to :root
        end
    end

    def reviewsPerfil
    end

    def review_params
        params.require(:review).permit(:id_libro, :comentario, :puntuacion)
                                .merge(fecha: Date.today)
                                .merge(puntuacion: params[:puntuacion].to_i)
                                .merge(id_usuario: session[:usuario_id])
      end
end
