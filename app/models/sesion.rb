class Sesion < ActiveRecord::Base
  belongs_to :curso
  validates :numeroHorasSesion, :totalHoras, presence: true
end
