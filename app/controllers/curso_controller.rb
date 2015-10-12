class CursoController < ApplicationController

    def index
        @cursos = Curso.all
    end

    def crear
    #Lo que estaba fallando en el lab es que no estabamos mandando un campo
    #"Contraseña" el cual esta como requerido en el modelo.
        @curso = Curso.new curso_params
        if request.post?
            if @curso.valid?
                @curso.save!
                redirect_to curso_index_path
            end
        end
    end


    def eliminar
    #Checamos que se haya hecho una petición post y que el arreglo de los id's
    #que mandamos para eliminar no sea vacío.
        if request.post? && eliminar_curso[:cursos].blank? == false
            @curso = eliminar_curso[:curso]
            @curso.each do |c|
                Curso.find(c).destroy
            end
            redirect_to curso_index_path
        else
            redirect_to curso_index_path
        end
  end

  def actualizar
    #Buscamos el usuario conforme al id que obtengamos en el link asignado a la vista
    #Con esto llenamos la vista de editar con los datos obtenidos de la base de datos.
    @curso = Curso.find (editar_curso[:id])
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
        @curso.costoUnam = curso_params[:costoUnam]
        @curso.pagoPresupuestoDocentes = curso_params[:pagoPresupuestoDocentes]
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
            redirect_to curso_index_path
        end
    end
  end

 

    private
    def curso_params
        params.require(:curso).permit(:tipo, :modalidad, :fechas, :diasHorario, :lugar, :numeroSesiones, :numeroHoras, :minInscritos, :maxInscritos, :costoPublicoGeneral, :costoUnam, :pagoPresupuestoDocentes, :materialApoyo, :equipoComputo, :materialRequeridoAlumnos, :materialApoyoAlumnos, :descripcionCurso, :objetivoGeneral, :objetivosEspecificos, :metas, :dirigidoA, :campoConocimiento, :procesoEvaluacion, :requisitosIngreso, :requisitosPermanencia, :requisitosEgreso, :bibliografia) if params[:curso]
    end

    def actualizar_curso
        params.permit(:id)
    end
    def eliminar_curso
        params.permit(:curso => [])
    end
end