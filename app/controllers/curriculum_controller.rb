class CurriculumController < ApplicationController

    before_action :requiere_sesion

    def crear
        @action = 'crear'
        if @curriculum
            redirect_to curriculum_actualizar_path
        end
        @curriculum = Curriculum.new curriculum_params
        if request.post? && @curriculum.valid?
            @curriculum.save!
            @curriculum.ponente = @ponente
            @curriculum.save!
            flash[:notice] = "Curriculum guardado"
            redirect_to ponente_path
        end
    end

    def actualizar
        @action = 'actualizar'
        if ! @curriculum
            redirect_to curriculum_crear_path
        end
        if request.post?
            @curriculum.rfc = curriculum_params[:rfc]
            @curriculum.fechaNacimiento = curriculum_params[:fechaNacimiento]
            @curriculum.areaEspecializacion = curriculum_params[:areaEspecializacion]
            @curriculum.formacionUltimoGrado = curriculum_params[:formacionUltimoGrado]
            @curriculum.formacionCursoActualizacion = curriculum_params[:formacionCursoActualizacion]
            @curriculum.experienciaDocente = curriculum_params[:experienciaDocente]
            @curriculum.cargosAcademicos = curriculum_params[:cargosAcademicos]
            @curriculum.revisorOtros = curriculum_params[:revisorOtros]
            @curriculum.publicaciones = curriculum_params[:publicaciones]
            @curriculum.ponenciasConferenciasCongresos = curriculum_params[:ponenciasConferenciasCongresos]
            @curriculum.formacionRecursosHumanos = curriculum_params[:formacionRecursosHumanos]
            @curriculum.cursosImpartidos = curriculum_params[:cursosImpartidos]
            @curriculum.experienciaEntidadAcademica = curriculum_params[:experienciaEntidadAcademica]
            @curriculum.experienciaAreaCurso = curriculum_params[:experienciaAreaCurso]
            @curriculum.reconocimientos = curriculum_params[:reconocimientos]
            if @curriculum.valid?
                @curriculum.save
                redirect_to ponente_path
            end
        end
    end

 

    private
    def curriculum_params
        params.require(:curriculum).permit(:rfc, :fechaNacimiento, :areaEspecializacion, :formacionUltimoGrado, :formacionCursoActualizacion, :experienciaDocente, :cargosAcademicos, :revisorOtros, :publicaciones, :ponenciasConferenciasCongresos, :formacionRecursosHumanos, :cursosImpartidos, :experienciaEntidadAcademica, :experienciaAreaCurso, :reconocimientos) if params[:curriculum]
    end

    def requiere_sesion
        if ! session[:usuario_id] || ! session[:usuario_tipo] || session[:usuario_tipo] != "Ponente" 
            flash[:notice] = "Inicie sesion como profesor"
            redirect_to usuario_iniciarSesion_path and return
        end
        @ponente = Ponente.find_by_id(session[:usuario_id])
        @curriculum = @ponente.curriculum
    end

end
