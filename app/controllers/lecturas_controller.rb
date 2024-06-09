class LecturasController < ApplicationController

    def index
        @lecturas = Lectura.all
    end

    def new
        @lectura = Lectura.new
    end

    def library
        @lecturas = Lectura.all
    end

    def search #ver despues si corregir el tema de que se muestra el nombre del estado en el campo busqueda de titulos
        @search_query = params[:search] || params[:lecture_state] || ""
        if params[:lecture_state].present?
            @lecturas = Lectura.where("lecture_state ilike ?", "%#{@search_query[0]}%")
        elsif params[:lecture_state].present?
            @lecturas = Lectura.where("book_title ilike ?", "%#{@search_query}%")
        else
            @lecturas = []
        end
    end

    def create
        @lectura = Lectura.new(lectura_params)
        @lectura.username = current_user.username
        @lectura.book_id = session[:book_id]
        @lectura.book_title = session[:book_title]
        @book_img = session[:book_img]
        if (@lectura.save)
            flash[:success] = "Se guardó la lectura exitosamente"
            redirect_to library_path
        else 
            flash[:danger] = "No se pudo guardar la lectura"
            redirect_to library_path
        end
    end

    def lectura_params
        params.require(:lectura).permit(:username, :book_id, :book_title, :book_img, :lecture_state, :reading_start_date, :reading_end_date)
    end

    def destroy
        @lectura = Lectura.find(params[:id])
        @lectura.destroy
        flash[:danger] = "La lectura fue exitosamente eliminada"
        redirect_to library_path
    end
    
end
