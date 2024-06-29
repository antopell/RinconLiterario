class LogsLecturasController < ApplicationController

    def index
        @logsLecturas = LogsLecturas.all
    end

    def new
        @logLectura = LogsLecturas.new
    end

    def create
        @logLectura = LogsLecturas.new(logs_lecturas_params)
        fecha_ultimo_log = LogsLecturas.where(lecture_id: session[:lecture_id]).maximum(:created_at)
        ultimo_log = LogsLecturas.find_by(lecture_id: session[:lecture_id], created_at: fecha_ultimo_log)
        total_hojas_libro = Lectura.find(session[:lecture_id]).total_pages
        if (ultimo_log && ultimo_log[:last_read_page] > logs_lecturas_params[:last_read_page].to_i)
            flash[:danger] = "El número de hoja ingresado es menor al último log registrado"
        elsif (total_hojas_libro < logs_lecturas_params[:last_read_page].to_i)
            flash[:danger] = "El número de hoja ingresado es mayor al total de hojas del libro"
        else
            @logLectura.lecture_id = session[:lecture_id]
            if (@logLectura.save)
                flash[:success] = "Se guardó el log de lectura exitosamente"
            else  
                flash[:danger] = "No se pudo guardar el log de lectura #{@logLectura.errors.full_messages}"
            end
        end
        redirect_to details_lectura_path(session[:lecture_id])
    end

    def logs_lecturas_params
        params.require(:log_lectura).permit(:username, :lecture_id, :last_read_page)
    end

    def destroy
        @logLectura = LogsLecturas.find(params[:id])
        @logLectura.destroy
        flash[:success] = "El log de lectura fue exitosamente eliminado"
        redirect_to details_lectura_path(session[:lecture_id])
    end

end
