class Usuario < ActiveRecord::Base
  has_many :telefono
  validates :nombre, :contrasena, :email, presence: true
  validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]{2,}+\z/i }
end
