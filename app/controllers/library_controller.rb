class LibraryController < ApplicationController

    def my_books
        @books = @data ? @data['items'] : []
    end

    def get_book
        api_service = ExternalApiService.new()
        params = {search:"Good Omens"}
        begin
          @data = api_service.fetch_books2(params)
        rescue => e
          @error = e.message
          @data = nil
        end
    end

    def library
        get_book
        my_books
    end

end
