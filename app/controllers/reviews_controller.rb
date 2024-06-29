class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all.order(created_at: :desc)
    end

    def create
        @usuarioActual = Usuario.find(session[:usuario_id])
        @review = @usuarioActual.reviews.create(review_params)
        if (@review.save)
            flash[:success] = "Se creo exitosamente la review"
        else
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
