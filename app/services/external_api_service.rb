class ExternalApiService
    include HTTParty
    base_uri "https://www.googleapis.com/books/v1/"

    def fetch_books(params)
        url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:search]}&maxResults=15&key=#{ENV["API_KEY"]}"
        response = HTTParty.get(url)
        if response.success?
            response.parsed_response
        else
            raise "Error: #{response.code} - #{response.message}"
        end
    end

    def fetch_books2(params)       #esta y la anterior son dos maneras distintas de llamar al servicio, esta de abajo me parece más prolija
        query = { #ver despues si se puede consultar de manera paginada
          q: params[:search],
          maxResults: params[:maxResults],
          key: ENV['API_KEY'],
          startIndex: params[:pageNumber] * params[:maxResults]
        }
        response = self.class.get('/volumes', query: query)
        if response.success?
          response.parsed_response
        else
          raise "Error: #{response.code} - #{response.message}"
        end
      end

      def fetch_volume_by_id(id)
        query = {
          volumeId: id,
          maxResults: 1,
          key: ENV['API_KEY']
        }
        response = self.class.get('/volumes', query: query)
        if response.success?
          response.parsed_response
        else
          raise "Error: #{response.code} - #{response.message}"
        end
      end

      def fetch_volume_by_id2(params)
        url = "https://www.googleapis.com/books/v1/volumes/#{params[:id]}"
        response = HTTParty.get(url)
        if response.success?
            response.parsed_response
        else
            raise "Error: #{response.code} - #{response.message}"
        end
    end
  end
  