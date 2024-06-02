class BooksController < ApplicationController

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
        if @search_query.present?
          get_books(@search_query)
        else
          @books = []
        end
        my_books
    end

end
