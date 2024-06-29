class BooksController < ApplicationController

  helper_method :rotate

    def my_books
        @books = @data ? @data['items'] : []
    end

    def get_books(book)
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
    end

    def get_by_volume_id(id) #https://www.googleapis.com/books/v1/volumes/volumeId
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
    end

    def search
        @search_query = params[:search] || ""
        @search_type = params[:search_type] || "books"
    
        case @search_type
        when "books"
          get_books(@search_query)
        when "users"
          @users = Usuario.where("username LIKE ?", "%#{@search_query}%")
        end
    
        my_books
    end

    @@rating = nil
    def details
      api_service = ExternalApiService.new()
      @book = api_service.fetch_volume_by_id2(params)
      @ratings = Review.where(libro_id: params[:id]).order("created_at DESC")
      puts @ratings
      @rating = @@rating
      # resetea para que si vuelve a entrar no abra el modal directo
      @@rating = nil
      session[:book_id] = @book['id']
      session[:book_title] = @book['volumeInfo']['title']
      session[:book_img] = @book['volumeInfo']['imageLinks'].present? ? @book['volumeInfo']['imageLinks']['thumbnail']: "https://d3525k1ryd2155.cloudfront.net/h/848/258/116258848.0.m.jpg"
      session[:total_pages] = @book['volumeInfo']['pageCount']
    end

    def reset_rating
      @@rating = nil
      goBack()
    end

    def goBack
      previous_url = request.referrer
      redirect_to previous_url if previous_url.present?
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

end
