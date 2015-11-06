class AlumnoController < ApplicationController
    def index
        @alumnos = Alumno.all
    end

    def mostrar
        @alumno = Alumno.find (params[:id])
    end
end
