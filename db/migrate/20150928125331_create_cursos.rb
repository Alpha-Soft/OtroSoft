class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.belongs_to :ponente, index: true, polymorphic: true
      t.date :inicia
      t.date :finaliza
      t.boolean :aprovado
      t.string :tipo
      t.string :modalidad
      t.text :fechas
      t.text :diasHorario
      t.string :lugar
      t.integer :numeroSesiones
      t.integer :numeroHoras
      t.integer :minInscritos
      t.integer :maxInscritos
      t.float :costoPublicoGeneral
      t.float :costoUNAM
      t.float :pagoPropuestoDocentes
      t.text :materialApoyo
      t.text :equipoComputo
      t.text :materialRequeridoAlumnos
      t.text :materialApoyoAlumnos
      t.text :descripcionCurso
      t.text :objetivoGeneral
      t.text :objetivosEspecificos
      t.text :metas
      t.text :campoConocimiento
      t.text :dirigidoA
      t.text :procesoEvaluacion
      t.text :requisitosIngreso
      t.text :requisitosPermanencia
      t.text :requisitosEgreso
      t.text :bibliografia

      t.timestamps null: false
    end
  end
end
