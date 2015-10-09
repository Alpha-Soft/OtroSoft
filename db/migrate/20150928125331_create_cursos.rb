class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.belongs_to :profesor, index: true, polymorphic: true
      t.date :inicia
      t.date :finaliza
      t.boolean :aprovado
      t.string :tipo
      t.string :modalidad
      t.string :fechas
      t.string :diasHorario
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
      t.text :objetivosGeneral
      t.text :objetivosEspecifico
      t.text :metas
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
