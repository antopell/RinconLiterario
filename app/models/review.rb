class Review < ApplicationRecord

    validates :id_usuario, presence: true
    validates :comentario, presence: true
    validates :puntuacion, presence: true
    validates :id_libro, presence: true

    def titulo_libro
        api_service = ExternalApiService.new()
        book = api_service.fetch_volume_by_id2(id: id_libro)
        book['volumeInfo']['title']
        
    end

    def creador
        Usuario.find(id_usuario).username
    end
end
