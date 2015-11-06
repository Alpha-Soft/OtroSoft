class UsuarioController < ApplicationController

    def iniciarSesion
        @usuario = Usuario.new usuario_sesion
        if request.post?
            @iniciar = Usuario.find_by(correo: usuario_sesion[:correo], contrasena: usuario_sesion[:contrasena])
            if @iniciar
                session[:usuario_id] = @iniciar.id
                session[:usuario_tipo] = @iniciar.type
                redirect_to ponente_path
                
            else
                flash[:notice] = "Usuario o contraseña incorrectos"
            end
        end
    end

    def cerrarSesion
        if session[:usuario_id] && Usuario.find_by_id(session[:usuario_id])
            reset_session
            flash[:notice] = "Sesion cerrada"
            redirect_to usuario_iniciarSesion_path
        else
            redirect_to usuario_iniciarSesion_path
            flash[:notice] = "Sesion no iniciada"
        end
    end

    def registrar
        if params[:tipo] == "ponente"
            @usuario = Ponente.new usuario_params
        end
        if params[:tipo] == "alumno"
            @usuario = Alumno.new usuario_params
        end
        @action = "registrar"
        @tipo = params[:tipo]
        if request.post?
            if @usuario.valid?
                @usuario.save!
                redirect_to usuario_path
            end
        end
    end


    def borrar
        if borrar_usuario[:id].blank? == false
            Usuario.find(borrar_usuario[:id]).destroy
           redirect_to usuario_path
        else
            redirect_to usuario_path
        end
  end


    def actualizar
        @usuario = Usuario.find (actualizar_usuario[:id])
        @action = "actualizar"
        @tipo = params[:tipo]
        if request.post?
            param = (params[params[:tipo]] ? params[params[:tipo]] : params) 
            @usuario.nombre = (param[:nombre].nil? || param[:nombre].empty? ? @usuario.nombre : param[:nombre])
            @usuario.contrasena = (param[:contrasena].nil? || param[:contrasena].empty? ? @usuario.contrasena : param[:contrasena])
            @usuario.direccion = (param[:direccion].nil? || param[:direccion].empty? ? @usuario.direccion : param[:direccion])
            @usuario.apellidoMaterno = (param[:apellidoMaterno].nil? || param[:apellidoMaterno].empty? ? @usuario.apellidoMaterno : param[:apellidoMaterno])
            @usuario.apellidoPaterno = (param[:apellidoPaterno].nil? || param[:apellidoPaterno].empty? ? @usuario.apellidoPaterno : param[:apellidoPaterno])
            if @usuario.valid?
                @usuario.save
                redirect_to usuario_path
            end
        end
    end

    private

    def usuario_params
        params.require(params[:tipo]).permit(:nombre, :contrasena, :correo, :direccion, :apellidoMaterno, :apellidoPaterno) if params[params[:tipo]]
    end

    def usuario_sesion
        params.require(:usuario).permit(:correo, :contrasena) if params[:usuario]
    end

    def actualizar_usuario
        params.permit(:id)
    end

    def borrar_usuario
        params.permit(:id)
    end

end
