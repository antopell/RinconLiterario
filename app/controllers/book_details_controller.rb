class BookDetailsController < ApplicationController

    helper_method :rotate

    @@rating = nil
    def show
        api_service = ExternalApiService.new()
        @@book = api_service.fetch_volume_by_id2(params)
        @book = @@book
        @rating = @@rating
        # resetea para que si vuelve a entrar no abra el modal directo
        @@rating = nil
        @lectura = Lectura.new #ver si se puede sacar
        ##Category.find(params[:id])
        session[:book_id] = @@book['id']
        session[:book_title] = @@book['volumeInfo']['title']
        session[:book_img] = @@book['volumeInfo']['imageLinks'].present? ? @@book['volumeInfo']['imageLinks']['thumbnail']: "https://d3525k1ryd2155.cloudfront.net/h/848/258/116258848.0.m.jpg"
        session[:total_pages] = @@book['volumeInfo']['pageCount']
    end

    def confirm_rating
        ## guardar rating
        @rating = params[:rating]
        puts "rating: #{params[:rating]}"
        render 'confirm_rating'
    end

    def create_rating
        # guardo en variable de clase el valor pasado
        @@rating = params[:rating].to_i
        # vuelvo a pagina anterior para mostrar modal
        goBack()
    end

    def reset_rating
        @@rating = nil
        goBack()
    end

    def goBack
        previous_url = request.referrer
        redirect_to previous_url if previous_url.present?
    end
end
