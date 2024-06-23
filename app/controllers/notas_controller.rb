class NotasController < ApplicationController

    def index
        @notas = Nota.all
    end

    def new
        @nota = Nota.new
    end

    def create
        @nota = Nota.new(nota_params)
        pp params
        @nota.lecture_id = session[:lecture_id]
        pp @nota
        if (@nota.save)
            flash[:success] = "Se guardó la nota exitosamente"
        else  
            flash[:danger] = "No se pudo guardar la nota #{@nota.errors.full_messages}"
        end
        redirect_to details_lectura_path(session[:lecture_id])
    end

    def nota_params
        params.require(:nota).permit(:lecture_id, :note)
    end

    def details
        @nota = Nota.find(params[:id])
    end

    def destroy
        @nota = Nota.find(params[:id])
        @nota.destroy
        flash[:success] = "La nota fue exitosamente eliminada"
        redirect_to details_lectura_path(session[:lecture_id])
    end
end
