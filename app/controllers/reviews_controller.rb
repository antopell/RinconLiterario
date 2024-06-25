class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all
    end

    def create
        @usuarioActual = Usuario.find(session[:usuario_id])
        Rails.logger.debug "datos:"
        Rails.logger.debug @usuarioActual
        Rails.logger.debug review_params
        @review = @usuarioActual.reviews.create(review_params)
        Rails.logger.debug @review
        if (@review.save)
            flash[:success] = "Se creo exitosamente la review"
        else
            Rails.logger.debug "Errores review:"
            Rails.logger.debug @review.errors.full_messages
            flash[:danger] = @review.errors.full_messages[0]
        end
        goBack
    end

    def reviewsPerfil
    end

    def review_params
        params.require(:review).permit(:libro_id, :comentario, :puntuacion)
                                .merge(fecha: Date.today)
                                .merge(puntuacion: params[:puntuacion].to_i)
    end

    def goBack
        previous_url = request.referrer
        redirect_to previous_url if previous_url.present?
    end
end
