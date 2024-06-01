class LecturasController < ApplicationController

    def index
        @lecturas = Lectura.all
    end

    def new
        @lectura = Lectura.new
    end

    def create
        @lectura = Lectura.new(lectura_params)
        @lectura.username = current_user.username
        @lectura.book_id = session[:book_id]
        @lectura.book_title = session[:book_title]
        @book_img = session[:book_img]
        if (@lectura.save)
            redirect_to book_detail_path(session[:book_id]), alert: "Se guardó la lectura exitosamente"
        else 
            redirect_to library_path, alert: "No se pudo guardar la lectura"
        end
    end

    def lectura_params
        params.require(:lectura).permit(:username, :book_id, :book_title, :book_img, :lecture_state, :reading_start_date, :reading_end_date)
    end
    
end
