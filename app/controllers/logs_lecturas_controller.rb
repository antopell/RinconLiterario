class LogsLecturasController < ApplicationController

    def index
        @logsLecturas = LogsLecturas.all
    end

    def new
        @logLectura = LogsLecturas.new
    end

    def create
        @logLectura = LogsLecturas.new(logs_lecturas_params)
        @logLectura.lecture_id = session[:lecture_id]
        if (@logLectura.save)
            flash[:success] = "Se guardó el log de lectura exitosamente"
        else  
            flash[:danger] = "No se pudo guardar el log de lectura #{@logLectura.errors.full_messages}"
        end
        redirect_to details_lectura_path(session[:lecture_id])
    end

    def logs_lecturas_params
        params.require(:logs_lecturas).permit(:username, :lecture_id, :last_read_page)
    end

end
