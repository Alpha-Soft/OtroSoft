class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.belongs_to :ponente, polymorphic: true,  index: true
      t.date :fechaNacimiento
      t.string :rfc
      t.text :areaEspecializacion
      t.text :formacionUltimoGrado
      t.text :formacionCursoActualizacion
      t.text :experienciaDocente
      t.text :cargosAcademicos
      t.text :revisorOtros
      t.text :publicaciones
      t.text :ponenciasConferenciasCongresos
      t.text :formacionRecursosHumanos
      t.text :cursosImpartidos
      t.string :experienciaEntidadAcademica
      t.text :experienciaAreaCurso
      t.text :reconocimientos

      t.timestamps null: false
    end
  end
end
