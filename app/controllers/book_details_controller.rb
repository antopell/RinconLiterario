class BookDetailsController < ApplicationController

    helper_method :rate

    def show
        @rating = 0;
        api_service = ExternalApiService.new()
        @book = api_service.fetch_volume_by_id2(params)
        @lectura = Lectura.new #ver si se puede sacar
        ##Category.find(params[:id])
        session[:book_id] = @book['id']
        session[:book_title] = @book['volumeInfo']['title']
        session[:book_img] = @book['volumeInfo']['imageLinks'].present? ? @book['volumeInfo']['imageLinks']['thumbnail']: "https://d3525k1ryd2155.cloudfront.net/h/848/258/116258848.0.m.jpg"
    end

    def confirm_rating
        ## guardar rating
        @rating = params[:rating]
        puts "rating: #{params[:rating]}"
        render 'confirm_rating'
    end
end
