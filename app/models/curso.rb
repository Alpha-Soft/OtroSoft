class Curso < ActiveRecord::Base
  belongs_to :profesor
  has_many :temario
  has_many :docente
  has_many :sesion
  has_many :interesado
  has_many :cursandos
  has_many :alumnos, through: :cursandos
  validates :tipo, :modalidad, :fechas, :diasHorario, :lugar, :numeroSesiones, :numeroHoras, :minInscritos, :maxInscritos, :costoPublicoGeneral, :costoUNAM, :pagoPropuestoDocentes, :materialApoyo, :equipoComputo, :materialRequeridoAlumnos, :materialApoyoAlumnos, :descripcionCurso, :objetivoGeneral, :objetivosEspecificos, :metas, :dirigidoA, :campoConocimiento, :procesoEvaluacion, :requisitosIngreso, :requisitosPermanencia, :requisitosEgreso, :bibliografia, presence: true
end
