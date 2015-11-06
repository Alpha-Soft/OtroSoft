class CursoController < ApplicationController

    before_action :requiere_sesion

    def crear
        @action = 'crear'
        if @curso
            redirect_to curso_actualizar_path
        end
        @curso = Curso.new curso_params
        if request.post? && @curso.valid?
            @curso.save!
            @curso.ponente = @ponente
            @curso.save!
            flash[:notice] = "Curso guardado"
            redirect_to ponente_path
        end
    end


    def actualizar
        @action = 'actualizar'
        if ! @curso
            redirect_to curso_crear_path
        end
        if request.post?
            @cuso.tipo = curso_params[:tipo]
            @curso.modalidad = curso_params[:modalidad]
            @curso.fechas = curso_params[:fechas]
            @curso.diasHorario = curso_params[:diasHorario]
            @curso.lugar = curso_params[:lugar]
            @curso.numeroSesiones = curso_params[:numeroSesiones]
            @curso.numeroHoras = curso_params[:numeroHoras]
            @curso.minInscritos = curso_params[:minInscritos]
            @curso.maxInscritos = curso_params[:maxInscritos]
            @curso.costoPublicoGeneral = curso_params[:costoPublicoGeneral]
            @curso.costoUnam = curso_params[:costoUNAM]
            @curso.pagoPresupuestoDocentes = curso_params[:pagoPropuestoDocentes]
            @curso.materialApoyo = curso_params[:materialApoyo]
            @curso.equipoComputo = curso_params[:equipoComputo]
            @curso.materialRequeridoAlumnos = curso_params[:materialRequeridoAlumnos]
            @curso.materialApoyoAlumnos = curso_params[:materialApoyoAlumnos]
            @curso.descripcionCurso = curso_params[:descripcionCurso]
            @curso.objetivoGeneral = curso_params[:objetivoGeneral]
            @curso.objetivosEspecifico = curso_params[:objetivosEspecificos]
            @curso.metas = curso_params[:metas]
            @curso.dirigidoA = curso_params[:dirigidoA]
            @curso.campoConocimiento = curso_params[:campoConocimiento]
            @curso.procesoEvaluacion = curso_params[:procesoEvaluacion]
            @curso.requisitosIngreso = curso_params[:requisitosIngreso]
            @curso.requisitosPermanencia = curso_params[:requisitosPermanencia]
            @curso.requisitosEgreso = curso_params[:requisitosEgreso]
            @curso.bibliografia = curso_params[:bibliografia]
            if @curso.valid?
                @curso.save
                redirect_to ponente_path
            end
        end
    end

 

    private
    def curso_params
        params.require(:curso).permit(:tipo, :modalidad, :fechas, :diasHorario, :lugar, :numeroSesiones, :numeroHoras, :minInscritos, :maxInscritos, :costoPublicoGeneral, :costoUNAM, :pagoPropuestoDocentes, :materialApoyo, :equipoComputo, :materialRequeridoAlumnos, :materialApoyoAlumnos, :descripcionCurso, :objetivoGeneral, :objetivosEspecificos, :metas, :dirigidoA, :campoConocimiento, :procesoEvaluacion, :requisitosIngreso, :requisitosPermanencia, :requisitosEgreso, :bibliografia) if params[:curso]
    end

    def requiere_sesion
        if ! session[:usuario_id] || ! session[:usuario_tipo] || session[:usuario_tipo] != "Ponente"
            flash[:notice] = "Inicie sesion como profesor"
            redirect_to usuario_iniciarSesion_path and return
        end
        @ponente = Ponente.find_by_id(session[:usuario_id])
        @curso = @ponente.curso
    end
end