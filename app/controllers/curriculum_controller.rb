class CurriculumController < ApplicationController

    def index
        @curriculums = Curriculum.all
    end

    def crear
    #Lo que estaba fallando en el lab es que no estabamos mandando un campo
    #"Contraseña" el cual esta como requerido en el modelo.
        @curriculum = Curriculum.new curriculum_params
        if request.post?
            if @user.valid?
                @user.save!
                redirect_to crud_user_index_path
            end
        end
    end


    def eliminar
    #Checamos que se haya hecho una petición post y que el arreglo de los id's
    #que mandamos para eliminar no sea vacío.
        if request.post? && eliminar_curriculum[:curriculums].blank? == false
            @curriculum = eliminar_curriculum[:curriculums]
            @curriculum.each do |c|
                Curriculum.find(c).destroy
            end
            redirect_to curriculum_index_path
        else
            redirect_to curriculum_index_path
        end
  end

  def actualizar
    #Buscamos el usuario conforme al id que obtengamos en el link asignado a la vista
    #Con esto llenamos la vista de editar con los datos obtenidos de la base de datos.
    @curriculum = Curriculum.find (editar_curriculum[:id])
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
            redirect_to curriculum_index_path
        end
    end
  end

 

    private
    def curriculum_params
        params.require(:curriculum).permit(:rfc, :fechaNacimiento, :areaEspecializacion, :formacionUltimoGrado, :formacionCursoActualizacion, :experienciaDocente, :cargosAcademicos, :revisorOtros, :publicaciones, :ponenciasConferenciasCongresos, :formacionRecursosHumanos, :cursosImpartidos, :experienciaEntidadAcademica, :experienciaAreaCurso, :reconocimientos) if params[:curriculum]
    end

    def edit_user
        params.permit(:id)
    end
    def eliminar_curriculum
        params.permit(:curriculums => [])
    end

end
