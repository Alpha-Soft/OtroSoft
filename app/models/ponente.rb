class Ponente < Usuario
  has_one :curriculum, :dependent => :destroy
  has_one :curso, :dependent => :destroy
end
