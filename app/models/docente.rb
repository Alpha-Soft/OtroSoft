class Docente < ActiveRecord::Base
  belongs_to :curso
  validates  :nombre, :grado, :cargo :entidad, presence: true
end
