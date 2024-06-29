class ReviewsController < ApplicationController
    def reviews
        @reviews = Review.all.order(created_at: :desc)
    end

    def create
        @usuarioActual = Usuario.find(session[:usuario_id])
        if (@usuarioActual.reviews.find_by(libro_id: review_params[:libro_id]))
            flash[:danger] = "Ya creaste una review para este libro"
        else    
            @review = @usuarioActual.reviews.create(review_params)
            if (@review.save)
                flash[:success] = "Se creo exitosamente la review"
            else
                flash[:danger] = @review.errors.full_messages[0]
            end
        end
        goBack
    end

    def search
        @search_query = params[:search]
        
        if params[:search].present?
            @ids_posibles = get_books_id(@search_query)
            @reviews = Review.where(libro_id: @ids_posibles)
        else
            @reviews = []
        end
        render :reviews
    end

    def get_books_id(book)
        @lista = []
        api_service = ExternalApiService.new()
        params = {
            search: book,
            maxResults: 20,
            pageNumber: 0
        }
        begin
          @data = api_service.fetch_books2(params)
          api_service.fetch_books2(params)
        rescue => e
          @error = e.message
          @data = nil
        end
        for @libro in @data['items']
            @lista.append(@libro['id'])
        end
        @lista
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
