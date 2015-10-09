class Temario < ActiveRecord::Base
  belongs_to :curso
  validates :tema, :numeroHoras, :ponente, :fechas, :subtemas, presence: true

end
