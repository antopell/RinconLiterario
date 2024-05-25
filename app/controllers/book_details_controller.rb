class BookDetailsController < ApplicationController

    helper_method :rate

    def show
        @rating = nil;
        api_service = ExternalApiService.new()
        @book = api_service.fetch_volume_by_id2(params)
        ##Category.find(params[:id])
    end

    def confirm_rating
        ## guardar rating
        @rating = params[:rating]
        puts "rating: #{params[:rating]}"
        render 'confirm_rating'
    end
end
