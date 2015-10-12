class ProfesorController < ApplicationController

    def index
        @profesores = Profesor.all
    end

    def crear
    #Lo que estaba fallando en el lab es que no estabamos mandando un campo
    #"Contraseña" el cual esta como requerido en el modelo.
        @profesor = Profesor.new profesor_params
        if request.post?
            if @profesor.valid?
                @profesor.save!
                redirect_to profesor_path
            end
        end
    end


    def borrar
    #Checamos que se haya hecho una petición post y que el arreglo de los id's
    #que mandamos para eliminar no sea vacío.
        if request.post? && borrar_profesor[:profesors].blank? == false
            @profesor = borrar_profesor[:profesors]
            @profesor.each do |c|
                Profesor.find(c).destroy
            end
            redirect_to profesor_path
        else
            redirect_to profesor_path
        end
  end

  def actualizar
    #Buscamos el usuario conforme al id que obtengamos en el link asignado a la vista
    #Con esto llenamos la vista de editar con los datos obtenidos de la base de datos.
    @profesor = Profesor.find (actualizar_profesor[:id])
    if request.post?
        @profesor.nombre = profesor_params[:nombre]
        @profesor.contrasena = profesor_params[:contrasena]
        @profesor.direccion = profesor_params[:direccion]
        if @profesor.valid?
            @profesor.save
            redirect_to profesor_index_path
        end
    end
  end

  def mostrar
      @profesor = Profesor.find (actualizar_profesor[:id])
  end

    private
    def profesor_params
        params.require(:profesor).permit(:nombre, :contrasena, :correo, :direccion) if params[:profesor]
    end

    def actualizar_profesor
        params.permit(:id)
    end
    def borrar_profesor
        params.permit(:profesors => [])
    end

end
