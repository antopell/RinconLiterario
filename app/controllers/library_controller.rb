class LibraryController < ApplicationController

    @books

    def get_book
        api_service = ExternalApiService.new()
        params = {search:"Coraline"}
        begin
          @data = api_service.fetch_books2(params)
        rescue => e
          @error = e.message
        end
    end

    def library
        get_book
    end

end
