class Telefono < ActiveRecord::Base
  belongs_to :usuario
  validates :numero, presence: true, format: { with: \A[0-9+\.-]{8,}+\z }
end
