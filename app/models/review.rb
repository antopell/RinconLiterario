class Review < ApplicationRecord

    belongs_to :usuario

    validates :comentario, presence: true
    validates :puntuacion, presence: true
    validates :libro_id, presence: true

    def titulo_libro
        api_service = ExternalApiService.new()
        book = api_service.fetch_volume_by_id2(id: libro_id)
        book['volumeInfo']['title']

    end

    def creador
        Usuario.find(usuario_id).username
    end
end
