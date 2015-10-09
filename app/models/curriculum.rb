class Curriculum < ActiveRecord::Base
  belongs_to :profesor
  validates :rfc, :fechaNacimiento, :areaEspecializacion, :formacionUltimoGrado, :formacionCursoActualizacion, :experienciaDocente, :cargosAcademicos, :revisorOtros, :publicaciones, :ponenciasConferenciasCongresos, :formacionRecursosHumanos, :cursosImpartidos, :experienciaEntidadAcademica, :experienciaAreaCurso, :reconocimientos, presence: true
  validates :rfc,  format: { with: /\A[A-Z]{4}+\d{6}+[a-zA-Z0-9]{3}+\z }
end